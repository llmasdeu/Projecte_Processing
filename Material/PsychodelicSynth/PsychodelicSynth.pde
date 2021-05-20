import processing.sound.*;
import java.util.Collection;
import javax.sound.midi.*;
import java.util.concurrent.ConcurrentHashMap;

Synth synth;

void setup() {
  // Sets the size of the canvas
  
  //size(720, 480);
  fullScreen();
  
  // Sets the background
  background(0);

  // Creates the object that'll handle the synth
  synth = new Synth(this, dataPath("Bass.mid"));
}

void draw() {
  // Sets the configuration of the new drawings
  fill(0, 12);
  rect(0, 0, width, height);
  fill(255);
  noStroke();

  // Draws the current note
  synth.drawNote();
    
  // Plays the file in the background
  thread("playFile");
}

public void playFile() {
  synth.playFile();
}
