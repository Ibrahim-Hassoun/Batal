import { WebSocketServer } from 'ws';
import http from 'http';
import dotenv from 'dotenv';
import axios from 'axios';

dotenv.config();
const server = http.createServer();
const wss = new WebSocketServer({ server });


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

      // Check token again on every message (optional)
      const cached = tokenCache.get(token);
      if (!cached || Date.now() > cached.expiresAt) {
        ws.send(JSON.stringify({ error: 'Token expired' }));
        ws.close(4003, 'Expired token');
        return;
      }

      if (parsed.type === 'private_message') {
        const { to, message } = parsed;
        const targets = users.get(to);

        if (targets && targets.length > 0) {
          targets.forEach((targetWs) => {
            if (targetWs.readyState === WebSocket.OPEN) {
              targetWs.send(
                JSON.stringify({
                  from: userId,
                  message,
                })
              );
            }
          });
        } else {
          ws.send(
            JSON.stringify({ error: `User ${to} is not connected.` })
          );
        }
      }
    } catch (err) {
      ws.send(JSON.stringify({ error: 'Invalid JSON format' }));
    }
  });

  ws.on('close', () => {
    const sockets = users.get(userId) || [];
    users.set(
      userId,
      sockets.filter((s) => s !== ws)
    );
    if (users.get(userId).length === 0) {
      users.delete(userId);
    }
    console.log(`User ${userId} disconnected`);
  });
});


async function verifyToken(token) {
  const laravelUrl = process.env.LARAVEL_SERVER_URL;
  try {
    const res = await axios.get(`${laravelUrl}/api/v0.1/auth-check`, {
      headers: {
        Authorization: `Bearer ${token}`
      }
    });
    console.log('This is what we got back from Laravel:', res.data);
    return {
      success: true,
      user: res.data.user,
      expiresIn: res.data.expires_in 
    };
  } catch (err) {
    
    return {
      success: false,
      message: err
    };
  }
}



server.listen(3000, () => {
  console.log('Private chat WebSocket server on ws://localhost:3000');
});
