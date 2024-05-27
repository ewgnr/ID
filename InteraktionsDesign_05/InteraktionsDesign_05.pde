PImage[] images;
int size_x, size_y;

void setup() 
{
  size(400, 400); 
  images = new PImage[4]; 
  size_x = width / 4; 
  size_y = height / 4; 

  for (int i = 0; i < images.length; i++) 
  {
    images[i] = loadImage("img_0" + (i + 1) + ".jpg");
    images[i].resize(width, height);
  }
  image(images[int(random(images.length))], 0, 0);
}

void mousePressed() 
{
  mouseDragged();
}

void mouseDragged() 
{
  int x = int(mouseX / size_x) * size_x;
  int y = int(mouseY / size_y) * size_y;

  image(images[int(random(images.length))].get(x, y, size_x, size_y), x, y);
}

void draw() {}
