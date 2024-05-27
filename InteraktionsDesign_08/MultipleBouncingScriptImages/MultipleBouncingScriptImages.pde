ArrayList<Ball> balls = new ArrayList<Ball>();
ArrayList<PImage> images = new ArrayList<PImage>(); 

int imagesToLoad = 4; // Anzahl der zu ladenden Bilder

void setup() {
  size(300,300,P2D);
  for (int i = 0; i < imagesToLoad; i++) {
    images.add(loadImage(i+".png")); // Dateinahmen 0.png 1.png 2.png usw. aufsteigend
  }
}

void draw() {
  imageMode(CORNER);
  image(images.get(3),0,0,width,height); // Index für das Hintergrundbild (Dateinamen mit höchstem Index)
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

class Ball {
  int diam, rad;
  float x, y;
  float speed_x;
  float speed_y;
  int imgNr;

  Ball(int d, int temp_x, int temp_y, int temp_imgNr) {
    diam = d;
    rad = diam/2;
    x = temp_x;
    y = temp_y;
    imgNr = temp_imgNr;
    speed_x = random(-1,1);
    speed_y = random(-1,1);
  }

  void run() {
    x += speed_x *= 0.999;
    y += speed_y *= 0.999;
    display();
    collide();
  }

  void display() {
    imageMode(CENTER);
    image(images.get(imgNr), x, y, diam, diam);
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
        float ax = (tx - b.x) * 0.01;
        float ay = (ty - b.y) * 0.01;

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