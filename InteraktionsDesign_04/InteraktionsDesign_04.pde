PImage img;

void canvas(PImage pImg, float pPivot_x, float pPivot_y, float pCanvasWidth, float pCanvasHeight, int pMoveX, int pMoveY, int pMoveXOffset, int pMoveYOffset, float pScale_x, float pScale_y)
{
  pushMatrix();
  scale(pScale_x, pScale_y);
  image(pImg, pPivot_x, pPivot_y, pCanvasWidth, pCanvasHeight, pMoveX, pMoveY, pMoveXOffset, pMoveYOffset);
  popMatrix();
}

void setup() 
{
  size(500,500);
  img = loadImage("zweige.jpg");
}

void draw()
{
  translate(width*0.5,height*0.5);

  canvas(img, 0, 0, 200, 100, mouseX, mouseY, mouseX + 200, mouseY + 200, 1, 1);
  canvas(img, 0, 0, 200, 100, mouseX, mouseY, mouseX + 200, mouseY + 200, 1, -1);
  canvas(img, 0, 0, 200, 100, mouseX, mouseY, mouseX + 200, mouseY + 200, -1, 1);
  canvas(img, 0, 0, 200, 100, mouseX, mouseY, mouseX + 200, mouseY + 200, -1, -1);
}
