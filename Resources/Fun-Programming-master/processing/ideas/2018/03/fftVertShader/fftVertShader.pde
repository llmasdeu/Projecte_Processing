/*
  Example of using Minim to get the FFT out of a sound
  and deform a sphere with it.
  
  The shader receives two things: a mesh of a sphere
  (by using the sphere() function), and an image that
  contains the visualization of the sound frequencies,
  each FFT band encoded as one pixel color.
  
  The reason to do this is that we want to send many
  values to the shader (30 in this case). If we send
  a vector we can only send 4 values at once. The next
  best option is to send an image, which is a trick to
  send many numbers to the shader.
*/
import ddf.minim.analysis.*;
import ddf.minim.*;

Minim minim;  
AudioPlayer jingle;
FFT fftLog;
PImage fftimg;
PShader fx;
int numBands;
float biggest;

void setup() {
  size(512, 480, P3D);
  noStroke();
  
  fx = loadShader("frag.glsl", "vert.glsl");
  
  minim = new Minim(this);
  jingle = minim.loadFile("jingle.mp3", 1024);

  jingle.loop();

  fftLog = new FFT( jingle.bufferSize(), jingle.sampleRate() );
  fftLog.logAverages( 22, 3 );
  
  numBands = fftLog.avgSize();
  println("There are", numBands, "bands");
  // Create a 30x1 pixels image.
  fftimg = createImage(numBands, 1, ARGB);
}

void draw() {
  background(255);
  fftLog.forward( jingle.mix );

  // Convert FFT values into colors of pixels
  fftimg.loadPixels();
  for (int i = 0; i < numBands; i++) {
    float theval = fftLog.getAvg(i);
    // Here we set one of the pixels to contain
    // one FFT  value
    fftimg.pixels[i] = color(theval * 5);
  }
  fftimg.updatePixels();
  
  // Send the fft image texture to the GPU
  fx.set("fft", fftimg);
  
  // Enable  the shader
  shader(fx);
  // Move to the center of the screen
  translate(width/2, height/2);
  // Draw a sphere
  sphere(200);  
}