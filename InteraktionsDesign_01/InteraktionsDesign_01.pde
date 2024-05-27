int oldMouseValueX, oldMouseValueY;
float ellipseSize;

void setup() {
  size(1000,500);    
  background(255);
  stroke(255,0,0);
  ellipse(width/2,height/2,200,200); 
  noCursor();
}

void draw() {  
  stroke(0,255,0);
  ellipseSize = (abs(oldMouseValueX-mouseX) + abs(oldMouseValueY-mouseY));
  if (mousePressed) {
    ellipse(mouseX,mouseY,ellipseSize,ellipseSize);
  }
  oldMouseValueX = mouseX;
  oldMouseValueY = mouseY;

  fill(255);
  noStroke();
  rect(0,0,80,40);
  fill(0,0,255);
  text(frameRate,20,20);
}