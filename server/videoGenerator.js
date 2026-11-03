import ffmpeg from 'fluent-ffmpeg';
import fs from 'fs';
import path from 'path';

export function generateNewsVideo(headline, imageUrl) {
  return new Promise((resolve, reject) => {
    const outputDir = path.join(process.cwd(), 'output');
    if (!fs.existsSync(outputDir)) {
      fs.mkdirSync(outputDir, { recursive: true });
    }

    const outputPath = path.join(outputDir, `ruvaa-social-${Date.now()}.mp4`);
    
    const bgImage = imageUrl || path.join(process.cwd(), 'assets', 'default-bg.png');
    const bgAudio = path.join(process.cwd(), 'assets', 'beat.mp3');

    ffmpeg()
      .input(bgImage)
      .loop(6)
      .input(bgAudio)
      .videoCodec('libx264')
      .outputOptions([
        '-pix_fmt yuv420p',
        '-shortest',
        '-vf scale=1080:1920:force_original_aspect_ratio=increase,crop=1080:1920'
      ])
      .audioCodec('aac')
      .audioBitrate('128k')
      .save(outputPath)
      .on('end', () => resolve(outputPath))
      .on('error', (err) => reject(err));
  });
}
