PImage img;
float offset_x, offset_y;

void setup(){
  size(1000,562,P2D);
  
  img = loadImage("wolke.png");  
  imageMode(CENTER);   
}

void draw() {
  background(0);  
  translate(width/2,height/2);
  
  float mouse = float(mouseY)/float(height);
  
  color c1 = color(232,35,75,230);
  color c2 = color(219,81,27,120);
  color c3 = color(247,158,40,100);

  imageLayer(c1, 0, 1, mouse, 2.0);
  imageLayer(c2, -30, 1, mouse, 1.0);
  imageLayer(c3, 80, 1, mouse, 3.0);
}

void imageLayer(color col, float offset_x, float offset_y, float mouse, float scale) {
  tint(col);
  image(img, offset_x, offset_y, mouse * scale * width, mouse * scale * height);
}