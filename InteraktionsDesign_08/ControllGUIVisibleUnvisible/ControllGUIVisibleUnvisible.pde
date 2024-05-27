import controlP5.*;

ControlP5 cp5;
Slider[] sliders;
boolean showGUI = true;
int slider_1,slider_2,slider_3,slider_4;

void setup() {
  size(460,300);
  setupGUI();
}

void draw() {
  background(0);
  fill(slider_1);
  rect(30,height/2,100,100);
  fill(slider_2);
  rect(130,height/2,100,100);
  fill(slider_3);
  rect(230,height/2,100,100);
  fill(slider_4);
  rect(330,height/2,100,100);  
  drawGUI();
}

void keyReleased() {
  showGUI = !showGUI;
  if (showGUI) {
    cp5.getGroup("GUI").open();
  } else {
    cp5.getGroup("GUI").close();
  }
}

void setupGUI() {  
  cp5 = new ControlP5(this);
  
  ControlGroup ctrl = cp5.addGroup("GUI",20,30,0)
                         .hideArrow()
                         .hideBar();
  
  sliders = new Slider[4];
  sliders[0] = cp5.addSlider("slider_1",0,255,10,10,100,10);
  sliders[1] = cp5.addSlider("slider_2",0,255,10,30,100,10);
  sliders[2] = cp5.addSlider("slider_3",0,255,10,50,100,10);
  sliders[3] = cp5.addSlider("slider_4",0,255,10,70,100,10);
  
  for (int i = 0; i < sliders.length; i++) {
    sliders[i].setGroup(ctrl);
  }
}

void drawGUI() {
  cp5.show();
  cp5.draw();
}