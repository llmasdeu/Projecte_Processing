import processing.sound.*;
import java.util.Collection;
import javax.sound.midi.*;
import java.util.concurrent.ConcurrentHashMap;

Synth synth;
  private float s = 0;
  private float h = 0;
  private float b = 0;
  private float n = 0;

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
  
   changeColor();

  // Draws the current note
  for (int i = 0; i <10; i+=1){
      synth.drawNote();
  }
  //synth.drawNote();
    
  // Plays the file
  thread("playFile");
}

void changeColor(){
   background(s);
  //el tono asume el valor de n
  h = n;
  //la saturación, un valor aleatorio entre 50 y 100
  s = random(0, 255);
  //y el brillo, valores variables pero cercanos entre 0 y 100
  b = noise(n/50)*100;
  //n aumenta en 1 en cada ciclo 
  n++;
 
  //si n alcanza el valor máximo
  if(n == 100){
    //vuelve a cero
    n = 0;
  } 
}

public void playFile() {
  synth.playFile();
}
