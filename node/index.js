import { WebSocketServer } from 'ws';
import http from 'http';
import dotenv from 'dotenv';

dotenv.config();
const server = http.createServer();
const wss = new WebSocketServer({ server });


const users = new Map();

wss.on('connection', (ws) => {
  let id = null;

  ws.on('message', (data) => {
    try {
      const parsed = JSON.parse(data);

      if (parsed.type === 'register') {
        id = parsed.id;
        if (!users.has(id)) {
          users.set(id, []);
        }
        users.get(id).push(ws);
        console.log(`User registered: ${id}`);
        return;
      }

      if (parsed.type === 'private_message') {
        const { to, message } = parsed;
        const targets = users.get(to);

        if (targets && targets.length > 0) {
          
          targets.forEach(targetWs => {
            if (targetWs.readyState === ws.OPEN) {
              targetWs.send(JSON.stringify({
                from: id,
                message,
              }));
            }
          });
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
    if (id && users.has(id)) {
      
      const userSockets = users.get(id).filter(socket => socket !== ws);

      if (userSockets.length > 0) {
        users.set(id, userSockets);
      } else {
        users.delete(id);
      }

      console.log(`User disconnected: ${id}`);
    }
  });
});

server.listen(3000, () => {
  console.log('Private chat WebSocket server on ws://localhost:3000');
});
