/* @pjs preload="data/big.jpg"; */

float d = 20;
PImage back_image;

void setup() {
  size(500, 400);
  background(#FF760D);
  noFill();
  stroke(255);
  smooth();
  back_image = loadImage("data/big.jpg");
}
void draw() {
  background(back_image);
  ellipse(mouseX, mouseY, d, d);
  if(mousePressed) {
    d++;
  }
}
void mouseReleased() {
  d = 20;
}

