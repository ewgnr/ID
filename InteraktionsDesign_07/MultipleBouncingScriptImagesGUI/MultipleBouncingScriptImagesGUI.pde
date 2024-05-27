import controlP5.*;
ControlP5 cp5;
Slider[] sliders;
boolean showGUI = true;
float spring, inertia_x, inertia_y, size;
int transparency, fade, black;

ArrayList<Ball> balls = new ArrayList<Ball>();
ArrayList<PImage> images = new ArrayList<PImage>(); 

int imagesToLoad = 4; // Anzahl der zu ladenden Bilder

void setup() {
  size(300, 300, P2D);
  background(255);
  spring = inertia_x = inertia_y = size = 1;
  transparency = fade = 255;
  black = 0;
  setupGUI();  
  for (int i = 0; i < imagesToLoad; i++) {
    images.add(loadImage(i+".png")); // Dateinahmen 0.png 1.png 2.png usw. aufsteigend
  }
}

void draw() {
  drawGUI();
  imageMode(CORNER);
  tint(black,fade);
  image(images.get(3), 0, 0, width, height); // Fester Index für das Hintergrundbild (Dateinamen mit höchstem Index)
  for (int i = 0; i < balls.size(); i++) {
    Ball b = balls.get(i);
    b.run();
  }
}

void mousePressed() {
  float size = random(20, 80);
  int imgNr = 1;//(int)random(0, images.size()-1);
  balls.add(new Ball(size, mouseX, mouseY, imgNr));
}

void keyPressed() {
  if (key == ' ') {
    if (balls.size() > 0) {
      balls.remove(0);
    }
  } else {
    showGUI = !showGUI;
    if (showGUI == true) {
      cp5.getGroup("GUI").open();
    } else {
      cp5.getGroup("GUI").close();
    }
  }
}


class Ball {
  float diam, rad;
  float x, y;
  float speed_x;
  float speed_y;
  int imgNr;

  Ball(float d, int temp_x, int temp_y, int temp_imgNr) {
    diam = d;
    rad = diam/2;
    x = temp_x;
    y = temp_y;
    imgNr = temp_imgNr;
    speed_x = random(-1, 1);
    speed_y = random(-1, 1);
  }

  void run() {
    rad = diam * size / 2;
    x += speed_x *= inertia_x;
    y += speed_y *= inertia_y;
    display();
    collide();
  }

  void display() {
    imageMode(CENTER);
    tint(255,transparency);
    image(images.get(imgNr), x, y, diam * size, diam * size);
  }

  void collide() {
    for (int i = balls.size()-1; i >= 0; i--) {
      Ball b = balls.get(i);
      float dist_x = b.x - x;
      float dist_y = b.y - y;
      float distance = sqrt(dist_x * dist_x + dist_y * dist_y);
      float min_dist = b.rad + rad;

      if (distance <= min_dist) {
        float angle = atan2(dist_y, dist_x);
        float tx = x + cos(angle) * min_dist;
        float ty = y + sin(angle) * min_dist;
        float ax = (tx - b.x) * 0.01 * spring;
        float ay = (ty - b.y) * 0.01 * spring;

        speed_x -= ax;
        speed_y -= ay;

        b.speed_x += ax;
        b.speed_y += ay;
      }
    }

    if (x + rad > width) {
      x = width - rad;
      speed_x *= -1;
    } else if (x - rad < 0) {
      x = rad;
      speed_x *= -1;
    }

    if (y + rad > height) {
      y = height - rad;
      speed_y *= -1;
    } else if (y - rad < 0) {
      y = rad;
      speed_y *= -1;
    }
  }
}
