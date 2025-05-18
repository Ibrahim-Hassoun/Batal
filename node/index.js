import { WebSocketServer } from 'ws';
import http from 'http';
import dotenv from 'dotenv';
import { verifyToken } from './middlewares/verify_token.js';
import { validateMessage } from './middlewares/validate_message.js';
import axios from 'axios';

dotenv.config();
const server = http.createServer();
const wss = new WebSocketServer({ server });
const laravelURL = process.env.LARAVEL_SERVER_URL;

const users = new Map();
const tokenCache = new Map();

wss.on('connection', async (ws, req) => {

  const token = new URL(req.url, `http://${req.headers.host}`).searchParams.get('token');
  

  const auth = await verifyToken(token, tokenCache, laravelURL);
  if (!auth.success) return ws.close(4002, 'Invalid token');

  const userId = auth.userId;
  if (!users.has(userId)) users.set(userId, []);
  users.get(userId).push(ws);

  ws.on('message', async (data) => {
    try {
      const parsed = JSON.parse(data);
      const parsedTo = validateMessage(parsed); 
      const targets = users.get(parsedTo);

      const res = await axios.post(`${laravelURL}/api/v0.1/chat/messages`, {
        
        receiver_id: parsedTo,
        content: parsed.message,
      }, {
        headers: { Authorization: `Bearer ${token}` },
      });



      targets?.forEach((targetWs) => {
        if (targetWs?.readyState === 1) { 
          targetWs.send(JSON.stringify({
            from: userId,
            message: parsed.message
          }));
        }
      });
    } catch (err) {
      ws.send(JSON.stringify({ error: err }));
    }
  });

  ws.on('close', () => {
    const sockets = users.get(userId) || [];
    const remainingSockets = sockets.filter((s) => s !== ws && s.readyState !== 3); 
    
    if (remainingSockets.length > 0) {
      users.set(userId, remainingSockets);
    } else {
      users.delete(userId);
    }
    console.log(`User ${userId} disconnected`);
  });
});



server.listen(3000, () => {
  console.log('Private chat WebSocket server on ws://localhost:3000');
});
