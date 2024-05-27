PImage mImg1, mImg2, mImg3;
int mDir;

float move(float pMouse, int pFactor, int pDirection) {
  return pMouse * pFactor * pDirection;
}

float moveMouseToCenter(int pMouse, int pWidth) {
  return float(pMouse) / float(pWidth) * 2 - 1;
}

void setup() {
  size(600,371);
  imageMode(CENTER);
  mImg1 = loadImage("dali_1.png");
  mImg2 = loadImage("dali_2.png");
  mImg3 = loadImage("dali_3.png");
}

void draw() {
  background(0,255,0);
 
  image(mImg1,(width * 0.5) + move(moveMouseToCenter(mouseX, width), 30, 1), height * 0.5);
  image(mImg2,(width * 0.5) + move(moveMouseToCenter(mouseX, width), 50, -1), height * 0.5);
  image(mImg3,(width * 0.5) + move(moveMouseToCenter(mouseX, width), 80, 1), height * 0.5);  
}
