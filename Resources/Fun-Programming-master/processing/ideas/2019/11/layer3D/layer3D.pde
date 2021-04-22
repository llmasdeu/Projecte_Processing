CubeLayer layer;

void settings() {
  size(640, 480, P3D);
}

void setup() {
  layer = new CubeLayer(this);
}

void draw() {
  background(#0f5383);
  translate(width/2, height/2);
  rotate(-frameCount * 0.003);
  layer.update();
  for (int i=0; i<7; i++) {    
    image(layer, 70, 0);
    rotate(TAU/7.0);
  }
}

public class CubeLayer extends PGraphics3D {
  CubeLayer(PApplet p5) {
    setParent(p5);
    setPrimary(false);
    setSize(200, 200);
  }
  void update() {
    beginDraw();
    clear();
    noStroke();
    directionalLight(184, 199, 164, 1, 1, -1);
    directionalLight(237, 208, 172, -1, -1, -1);
    translate(width/2, height/2);
    rotateX(frameCount * 0.01);
    rotateY(1);
    box(100);
    endDraw();
  }
}
