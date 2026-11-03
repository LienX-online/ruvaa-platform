import express from 'express';
import { createServer } from 'http';
import { Server } from 'socket.io';
import cors from 'cors';
import { generateNewsVideo } from './videoGenerator.js';

const app = express();
const httpServer = createServer(app);

app.use(cors());
app.use(express.json());

const io = new Server(httpServer, {
  cors: {
    origin: "*",
    methods: ["GET", "POST"]
  },
  transports: ['polling', 'websocket']
});

// Health check endpoint for Railway
app.get('/health', (req, res) => {
  res.status(200).json({ status: 'online', service: 'Ruvaa Core Engine', activeConnections: io.engine.clientsCount });
});

// Automated Video Generation Route for TikTok & Facebook
app.post('/api/generate-social-video', async (req, res) => {
  const { headline, imageUrl } = req.body;
  if (!headline) return res.status(400).json({ error: 'Headline is required' });

  try {
    const videoPath = await generateNewsVideo(headline, imageUrl);
    res.status(200).json({ success: true, message: 'Video generated successfully', videoPath });
  } catch (error) {
    res.status(500).json({ success: false, error: error.message });
  }
});

io.on('connection', (socket) => {
  console.log(`Editor/Reader connected: ${socket.id}`);

  socket.on('join-island-room', (islandSlug) => {
    socket.join(`island-${islandSlug}`);
  });

  socket.on('publish-breaking-news', (newsData) => {
    io.emit('breaking-news-broadcast', newsData);
  });

  socket.on('disconnect', () => {
    console.log(`Disconnected: ${socket.id}`);
  });
});

const PORT = process.env.PORT || 3000;
httpServer.listen(PORT, '0.0.0.0', () => {
  console.log(`Ruvaa Backend running live on port ${PORT}`);
});
