import java.util.Collection;
import javax.sound.midi.*;

AMidiPlayer midiPlayer;

void setup() {
  midiPlayer = new AMidiPlayer();
  midiPlayer.load(dataPath("jarre.mid"));
  midiPlayer.start();
}

void draw() {
  for (Note n : midiPlayer.getNotes()) {
    println(n.channel+" "+n.note+" "+n.velocity);

  }
  midiPlayer.update();
}
