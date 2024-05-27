ArrayList<Ball> balls = new ArrayList<Ball>();
ArrayList<PImage> images = new ArrayList<PImage>(); 

int imagesToLoad = 4; // Anzahl der zu ladenden Bilder

void setup() {
  background(255);
  size(300,300,P2D);
  for (int i = 0; i < imagesToLoad; i++) {
    images.add(loadImage(i+".png")); 
  }
}

void draw() {
  imageMode(CORNER);
  image(images.get(images.size()-1),0,0,width,height); 
  for (int i = 0; i < balls.size(); i++) {
    Ball b = balls.get(i);
    b.run();
  }
}

void mousePressed() {
  int size = (int)random(20,80);
  int imgNr = (int)random(0,images.size()-1);
  balls.add(new Ball(size,mouseX,mouseY,imgNr));
}

void keyPressed() {
  if (balls.size() > 0) {
    balls.remove(0);
  }
}
