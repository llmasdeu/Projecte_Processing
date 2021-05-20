public class Synth {
  private PApplet parent;
  private String filePath;
  private AMidiPlayer player;
  private Sequencer sequencer;
  private TriOsc triOsc;
  private Env env; 
  private Track[] tracks;
  private int[] midiSequence;
  private ArrayList<Note> notesSequence;
  private int note;
  private int trigger;
  private int duration;
  private long timeStamp;
  private float attackTime;
  private float sustainTime;
  private float sustainLevel;
  private float releaseTime;
  private Note currentNote;
  private boolean fileStatus;
    
  public Synth(PApplet parent, String filePath) {
    this.parent = parent;
    this.filePath = filePath;
    
    // Creates the object in charge of processing the MIDI file
    this.player = new AMidiPlayer();
    
    // Create triangle wave and start it
    this.triOsc = new TriOsc(parent);
    
    // Create the envelope
    this.env = new Env(parent);
    
    // An index to count up the notes
    this.note = 0;
    
    // This variable stores the point in time when the next note should be triggered
    this.trigger = millis();
    
    // Play a new note every 250 ms
    this.duration = 250;
    
    this.timeStamp = 0;
    
    // Times and levels for the ASR envelope
    this.attackTime = 0.0001;
    this.sustainTime = 0.004;
    this.sustainLevel = 0.3;
    this.releaseTime = 1.0;
    
    this.currentNote = null;
    
    this.tracks = null;
    this.midiSequence = null;
    this.notesSequence = null;
    
    // Reads the file
    this.fileStatus = readFile();
  }
  
  private boolean readFile() {
    File test = new File(this.filePath);
    Sequence mySeq = null;
    
    try {
      mySeq = MidiSystem.getSequence(test);
    } catch (Exception e) {
      // Handle error and/or return
      println(e.getMessage());
      
      return false;
    }
    
    // Reads the tracks of the file
    this.tracks = mySeq.getTracks();
    
    // Selects the first track
    Track track = tracks[1];
    println(tracks.length);
    
    for(int i = 0; i < track.size(); i++) {
      MidiEvent midiEvent = track.get(i);
      MidiMessage midiMessage = midiEvent.getMessage();
      player.send(midiMessage, timeStamp);
    }
    
    this.midiSequence = player.getMidiSequence();
    this.notesSequence = player.getNotesSequence();
    
    return true;
  }
  
  public void playFile() {
    // Checks if something happened while reading the file
    if (this.fileStatus) {
      // If the determined trigger moment in time matches up with the computer clock and
      // the sequence of notes hasn't been finished yet, the next note gets played.
      if ((millis() > this.trigger) && (this.note < this.midiSequence.length)) {
    
        // midiToFreq transforms the MIDI value into a frequency in Hz which we use to
        // control the triangle oscillator with an amplitute of 0.5
        //this.triOsc.play(midiToFreq(this.midiSequence[this.note]) + (mouseX + mouseY)/6, 0.5);
        this.triOsc.play(midiToFreq(this.midiSequence[this.note]), 0.5);
        
        this.triOsc.pan(map(mouseX, 0, width, -1.0, 1.0));
        this.attackTime = map(mouseX, 0, width, 0.001, 1.0);
        this.releaseTime = map(mouseY, height, 0, 0.1, 1.0);

    
        // The envelope gets triggered with the oscillator as input and the times and
        // levels we defined earlier
        this.env.play(this.triOsc, this.attackTime, this.sustainTime, this.sustainLevel, this.releaseTime);
    
        // Create the new trigger according to predefined duration
        this.trigger = millis() + this.duration;
        
        this.currentNote = this.notesSequence.get(this.note);
    
        // Advance by one note in the midiSequence;
        this.note++;
    
        // Loop the sequence, notice the jitter
        if (this.note == this.midiSequence.length) {
           this.note = 0;
        }
      }
    }
  }
  
  
void changeColor(){
   fill(h, s, b);
  //el tono asume el valor de n
  h = n;
  //la saturación, un valor aleatorio entre 50 y 100
  s = random(50, 100);
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

  
  public void drawNote() {
  int inverseX = width-mouseX;
  int inverseY = height-mouseY;
    if (currentNote != null) {
      switch (currentNote.getNoteName()) {
        case "C":
          changeColor();
          ellipse(mouseX, mouseY, 60, 60);
          ellipse(inverseX, inverseY, 60, 60);
          break;
          
        case "C#":
          changeColor();
          ellipse(mouseX, mouseY, 30, 30);
          ellipse(inverseX, inverseY, 30, 30);
          ellipse(mouseY, mouseX, 30, 30);
          ellipse(inverseY, inverseX, 30, 30);          
          break;
          
        case "D":
          changeColor();
          triangle(mouseX, mouseY - 30, mouseX - 30, mouseY + 30, mouseX + 30, mouseY + 30);
          triangle(inverseX, inverseY - 30, inverseX - 30, inverseY + 30, inverseX + 30, inverseY + 30);        
          break;
          
        case "D#":
          changeColor();
          triangle(mouseX, mouseY - 15, mouseX - 15, mouseY + 15, mouseX + 15, mouseY + 15);
          triangle(inverseX, inverseY - 15, inverseX - 15, inverseY + 15, inverseX + 15, inverseY + 15);
          break;
          
        case "E":
          changeColor();
          triangle(mouseX, mouseY - 30, mouseX - 40, mouseY + 40, mouseX + 40, mouseY + 40);
          triangle(inverseX, inverseY + 60, inverseX - 40, inverseY, inverseX + 40, inverseY);
          break;
          
        case "F":
          changeColor();
          rect(mouseX - 30, mouseY - 30, 60, 60);
          rect(inverseX - 30, inverseY - 30, 60, 60);          
          break;
          
        case "F#":
          rect(mouseX - 15, mouseY - 15, 30, 30);
          rect(inverseX - 15, inverseY - 15, 30, 30);
          break;
    
        case "G":
          quad(mouseX - 35, mouseY - 54, mouseX + 24, mouseY + 32, mouseX - 37, mouseY + 37, mouseX + 45, mouseY + 43);
          quad(inverseX - 35, inverseY - 54, inverseX + 24, inverseY + 32, inverseX - 37, inverseY + 37, inverseX + 45, inverseY + 43);
          break;
          
        case "G#":
          quad(mouseX - 15, mouseY - 21, mouseX + 24, mouseY + 32, mouseX - 7, mouseY + 15, mouseX + 45, mouseY + 23);
          quad(inverseX - 15, inverseY - 21, inverseX + 24, inverseY + 32, inverseX - 7, inverseY + 15, inverseX + 45, inverseY + 23);
          break;
    
        case "A":
          rect(mouseX - 60, mouseY - 60, 120, 120, 7);
          rect(inverseX - 60, inverseY - 60, 120, 120, 7);
          break;
          
        case "A#":
          rect(mouseX - 45, mouseY - 45, 90, 90, 7);
          rect(inverseX - 45, inverseY - 45, 90, 90, 7);
          break;
          
        case "B":
          arc(mouseX, mouseY, 80, 80, 0, PI + QUARTER_PI, CHORD);
          arc(inverseX, inverseY, 80, 80, 0, PI + QUARTER_PI, CHORD);
          break;
      }
    }
  }

  
  // This helper function calculates the respective frequency of a MIDI note
  private float midiToFreq(int note) {
    return (pow(2, ((note-69) / 12.0))) * 440;
  }
}
