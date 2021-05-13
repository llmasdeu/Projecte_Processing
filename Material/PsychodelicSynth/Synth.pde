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
        this.triOsc.play(midiToFreq(this.midiSequence[this.note]), 0.5);
    
        // The envelope gets triggered with the oscillator as input and the times and
        // levels we defined earlier
        this.env.play(this.triOsc, this.attackTime, this.sustainTime, this.sustainLevel, this.releaseTime);
    
        // Create the new trigger according to predefined duration
        this.trigger = millis() + this.duration;
        
        this.currentNote = this.notesSequence.get(this.note);
    
        // Advance by one note in the midiSequence;
        this.note++;
    
        // Loop the sequence, notice the jitter
        if (this.note == 12) {
          // this.note = 0;
        }
      }
    }
  }
  
  public void drawNote() {
    if (currentNote != null) {
      switch (currentNote.getNoteName()) {
        case "C":
          ellipse(mouseX, mouseY, 60, 60);
          break;
          
        case "C#":
          ellipse(mouseX, mouseY, 30, 30);
          break;
          
        case "D":
          triangle(mouseX, mouseY - 30, mouseX - 30, mouseY + 30, mouseX + 30, mouseY + 30);
          break;
          
        case "D#":
          triangle(mouseX, mouseY - 15, mouseX - 15, mouseY + 15, mouseX + 15, mouseY + 15);
          break;
          
        case "E":
          triangle(mouseX, mouseY - 30, mouseX - 40, mouseY + 40, mouseX + 40, mouseY + 40);
          triangle(mouseX, mouseY + 60, mouseX - 40, mouseY, mouseX + 40, mouseY);
          break;
          
        case "F":
          rect(mouseX - 30, mouseY - 30, 60, 60);
          break;
          
        case "F#":
          rect(mouseX - 15, mouseY - 15, 30, 30);
          break;
    
        case "G":
          quad(mouseX - 35, mouseY - 54, mouseX + 24, mouseY + 32, mouseX - 37, mouseY + 37, mouseX + 45, mouseY + 43);
          break;
          
        case "G#":
          quad(mouseX - 15, mouseY - 21, mouseX + 24, mouseY + 32, mouseX - 7, mouseY + 15, mouseX + 45, mouseY + 23);
          break;
    
        case "A":
          rect(mouseX - 60, mouseY - 60, 120, 120, 7);
          break;
          
        case "A#":
          rect(mouseX - 45, mouseY - 45, 90, 90, 7);
          break;
          
        case "B":
          arc(mouseX, mouseY, 80, 80, 0, PI + QUARTER_PI, CHORD);
          break;
      }
    }
  }
  
  // This helper function calculates the respective frequency of a MIDI note
  private float midiToFreq(int note) {
    return (pow(2, ((note-69) / 12.0))) * 440;
  }
}
