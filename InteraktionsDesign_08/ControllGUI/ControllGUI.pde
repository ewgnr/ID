import controlP5.*;

ControlP5 cp5;
int slider;

void setup() {
  size(600,300);
  cp5 = new ControlP5(this);
  cp5.addSlider("slider").setPosition(10,10)
                         .setSize(100,10)
                         .setRange(0,255)
                         .setValue(0);
}

void draw() {
  background(0);
  rectMode(CENTER);
  fill(slider);
  rect(width/2,height/2,200,100);
}