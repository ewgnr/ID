import processing.video.*;
Capture video;

int draw_position_x;
int video_slice_x;
boolean cameraImage, scanLine;

void setup()
{
  size(1280, 720);
  background(0);
  
  // Windows
  video = new Capture(this, 1280, 720, "pipeline:autovideosrc");
  // Mac
  // video = new Capture(this, 1280, 720);
  video.start();
  
  draw_position_x = 2;
  cameraImage = true;
}

void draw()
{
  if (video.available() != true) return;
  
  video.read();
  loadPixels();
  video.loadPixels();

  switch(key)
  {
    case '1':
      draw_position_x += 1;
      video_slice_x = draw_position_x;
    break;
    
    case '2':
      draw_position_x -= 1;
      video_slice_x = draw_position_x;
    break;
    
    case '3':
      draw_position_x += 1;    
      video_slice_x = width / 2;
    break;  
    
    case '4':
      draw_position_x -= 1;    
      video_slice_x = width / 2;
    break;    
  }
       
  for (int y = 0; y < height; y++) 
  {
    int setPixelIndex = y * width + draw_position_x;
    int getPixelIndex = y * video.width + video_slice_x;
    pixels[setPixelIndex] = video.pixels[getPixelIndex];
  }

  if (draw_position_x >= width - 1) 
  {
    draw_position_x = 2;
  }
  
  if (draw_position_x <= 1) 
  {
    draw_position_x = width - 2;
  }  
    
  updatePixels();
  
  
  fill(0);
  rect(0, height - 20, width, 20);
  
  if (cameraImage) 
  {
    image(video, 0, 0); 
  }
  
  if (scanLine) 
  {
    fill(0,255,0);
    ellipse(video_slice_x, height - 10, 5, 5);
  }
}

void keyPressed()
{
  if (key == 'i') 
  {
    cameraImage = !cameraImage;
    background(0);
  }
  
  if (key == 's')
  {
    scanLine = !scanLine;
  }
}
