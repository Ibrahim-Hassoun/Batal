import { WebSocketServer } from 'ws';
import http from 'http';
import dotenv from 'dotenv';

dotenv.config();
const server = http.createServer();
const wss = new WebSocketServer({ server });

const users = new Map(); 

wss.on('connection', (ws) => {
  let currentUsername = null;

  ws.on('message', (data) => {
    try {
      const parsed = JSON.parse(data);

      
      if (parsed.type === 'register') {
        currentUsername = parsed.username;
        users.set(currentUsername, ws);
        console.log(`User registered: ${currentUsername}`);
        return;
      }


      if (parsed.type === 'private_message') {
        const { to, message } = parsed;
        const target = users.get(to);

        if (target && target.readyState === ws.OPEN) {
          target.send(JSON.stringify({
            from: currentUsername,
            message,
          }));
        } else {
          ws.send(JSON.stringify({
            error: `User '${to}' not connected.`,
          }));
        }
      }
    } catch (err) {
      ws.send(JSON.stringify({ error: 'Invalid JSON format.' }));
    }
  });

  ws.on('close', () => {
    if (currentUsername) {
      users.delete(currentUsername);
      console.log(`User disconnected: ${currentUsername}`);
    }
  });
});

server.listen(3000, () => {
  console.log('Private chat WebSocket server on ws://localhost:3000');
});
