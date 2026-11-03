import express from 'express';
import { createServer } from 'http';
import { Server } from 'socket.io';
import cors from 'cors';
import fs from 'fs';
import path from 'path';
import { generateNewsVideo } from './videoGenerator.js';

const app = express();
const httpServer = createServer(app);

app.use(cors());
app.use(express.json());

const io = new Server(httpServer, {
  cors: { origin: "*", methods: ["GET", "POST"] },
  transports: ['polling', 'websocket']
});

// Root route
app.get('/', (req, res) => {
  res.status(200).send('Ruvaa National News & Tourism Platform Engine is live!');
});

// Health check
app.get('/health', (req, res) => {
  res.status(200).json({ status: 'online', service: 'Ruvaa Core Engine', activeConnections: io.engine.clientsCount });
});

// Islands & Tourism API Module
app.get('/api/islands', (req, res) => {
  try {
    const dataPath = path.join(process.cwd(), 'data', 'islands.json');
    const islands = JSON.parse(fs.readFileSync(dataPath, 'utf8'));
    res.status(200).json({ success: true, count: islands.length, islands });
  } catch (error) {
    res.status(500).json({ success: false, error: error.message });
  }
});

// Automated Social Video Generation Endpoint
app.post('/api/generate-social-video', async (req, res) => {
  const { headline, imageUrl } = req.body;
  if (!headline) return res.status(400).json({ error: 'Headline is required' });

  try {
    const videoPath = await generateNewsVideo(headline, imageUrl);
    res.status(200).json({ success: true, message: 'Vertical social video rendered successfully', videoPath });
  } catch (error) {
    res.status(500).json({ success: false, error: error.message });
  }
});

// Real-time WebSocket handlers
io.on('connection', (socket) => {
  console.log(Client connected: \);

  socket.on('join-island-room', (islandSlug) => {
    socket.join(island-\);
    console.log(Socket \ joined room: island-\);
  });

  socket.on('publish-breaking-news', (newsData) => {
    // Broadcast to all connected clients or specific island rooms
    if (newsData.islandSlug) {
      io.to(island-\).emit('breaking-news-broadcast', newsData);
    } else {
      io.emit('breaking-news-broadcast', newsData);
    }
  });

  socket.on('disconnect', () => {
    console.log(Client disconnected: \);
  });
});

const PORT = process.env.PORT || 3000;
httpServer.listen(PORT, '0.0.0.0', () => {
  console.log(Ruvaa Full-Stack Backend running live on port \);
});
