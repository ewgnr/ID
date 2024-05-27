PImage image;
PShape[] svgs;
float brSize;

void setup () {
  size(1280, 780);
  svgs = new PShape[8];

  image = loadImage("BG.jpg");  

  for (int i = 0; i < svgs.length; i++) {
    svgs[i] = loadShape(i +".svg");
  }
}

void draw() {
  background(255);
  shapeMode(CENTER); 
  
  for (int y = 0; y < image.height; y += 10) { 
    for (int x = 0; x < image.width; x += 10) { 
      
      int index = x + y * image.width; 
      float br = brightness(image.pixels[index]); 
      int brIndex = (int) constrain(br, 0, svgs.length); 
      // println("brightness" + br + " brIndex " + brIndex);

      float m = (float(mouseX)/float(width)) * 130; 
      
      if (brIndex != svgs.length) { 
        shape(svgs[brIndex], x, y, m, m); 
      }
    }
  }
}
