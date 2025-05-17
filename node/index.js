import { WebSocketServer } from 'ws';
import http from 'http';
import dotenv from 'dotenv';
import axios from 'axios';

dotenv.config();
const server = http.createServer();
const wss = new WebSocketServer({ server });
const laravelURL = process.env.LARAVEL_SERVER_URL;

const users = new Map();
const tokenCache = new Map();

wss.on('connection', async (ws, req) => {
  const url = new URL(req.url, `http://${req.headers.host}`);
  const token = url.searchParams.get('token');

  if (!token) {
    ws.close(4001, 'Token missing');
    return;
  }

  const result = await verifyToken(token);

  if (!result.success) {
    ws.close(4002, 'Invalid or expired token');
    return;
  }
  
  const userId = result.userId;

  // Register the socket
  if (!users.has(userId)) {
    users.set(userId, []);
  }
  users.get(userId).push(ws);
  console.log(`User ${userId} connected`);

  ws.on('message', async (data) => {
    try {
      const parsed = JSON.parse(data);

      
      const cached = tokenCache.get(token);
      if (!cached || Date.now() > cached.expiresAt) {
        ws.send(JSON.stringify({ error: 'Token expired' }));
        ws.close(4003, 'Expired token');
        return;
      }

      if (parsed.type === 'private_message') {
        const { to, message } = parsed;
        const parsedTo = parseInt(to, 10);
        
        if (isNaN(parsedTo)) {
          ws.send(JSON.stringify({ error: 'Invalid recipient ID format' }));
          return;
        }

        const targets = users.get(parsedTo);
        
        if (targets && targets.length > 0) {
          let messageDelivered = false;
          
          targets.forEach((targetWs) => {
            try {
              
              if (targetWs && targetWs.readyState === 1) {  
                targetWs.send(JSON.stringify({
                  from: userId,
                  message
                }));
                messageDelivered = true;
              }
            } catch (err) {
              console.error(`Error sending to user ${parsedTo}:`, err);
            }
          });

          if (!messageDelivered) {
            ws.send(JSON.stringify({ 
              error: `User ${parsedTo} is not currently reachable` 
            }));
          }
        } else {
          ws.send(JSON.stringify({ 
            error: `User ${parsedTo} is not connected` 
          }));
        }
      }
    } catch (err) {
      console.error('Message handling error:', err);
      ws.send(JSON.stringify({ error: 'Invalid message format' }));
    }
  });

  ws.on('close', () => {
    const sockets = users.get(userId) || [];
    const remainingSockets = sockets.filter((s) => s !== ws && s.readyState !== 3); // 3 = CLOSED
    
    if (remainingSockets.length > 0) {
      users.set(userId, remainingSockets);
    } else {
      users.delete(userId);
    }
    console.log(`User ${userId} disconnected`);
  });
});

const verifyToken = async (token) => {
  if (tokenCache.has(token)) {
    const { userId, expiresAt } = tokenCache.get(token);
    if (Date.now() < expiresAt) {
      return { success: true, userId, expiresAt };
    }
    tokenCache.delete(token);
    return { success: false };
  }

  try {
    const res = await axios.get(`${laravelURL}/api/v0.1/auth-check`, {
      headers: { Authorization: `Bearer ${token}` },
    });
   
    const user = res.data.data.user;
    const expiresIn = res.data.data.expires_in * 1000; 
    const expiresAt = Date.now() + expiresIn;
    
    tokenCache.set(token, { userId: user.id, expiresAt });
    return { success: true, userId: user.id, expiresAt };
  } catch (err) {
    console.error('Token verification error:', err);
    return { success: false };
  }
};

server.listen(3000, () => {
  console.log('Private chat WebSocket server on ws://localhost:3000');
});
