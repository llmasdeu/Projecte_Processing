public class AMidiPlayer implements Receiver {
  private ArrayList<Integer> midiSequence;
  private ArrayList<Note> notesSequence;
  
  public AMidiPlayer() {
    this.midiSequence = new ArrayList<Integer>();
    this.notesSequence = new ArrayList<Note>();
  }
  
  public int[] getMidiSequence() {
    int [] returnType = new int[midiSequence.size()];
    
    for (int i = 0; i < midiSequence.size(); i++) {
      returnType[i] = midiSequence.get(i);
    }
    
    return returnType;
  }
  
  // When I say "send" I mean "receive" :)
  @Override
  public void send(MidiMessage message, long t) {
    if (message instanceof ShortMessage) {
      ShortMessage sm = (ShortMessage) message;
      int cmd = sm.getCommand();
      
      if (cmd == ShortMessage.NOTE_ON || cmd == ShortMessage.NOTE_OFF) {
        int channel = sm.getChannel() - 1;      
        int note = sm.getData1();
        int velocity = sm.getData2();
        int id = channel * 1000 + note;
        if (cmd == ShortMessage.NOTE_ON && velocity > 0) {
          
          //midiData.put(id, new Note(channel, note, velocity));
          this.midiSequence.add(note);
          this.notesSequence.add(new Note(note));
          //println("note: " + note);
        } else {
          //midiData.get(id).dying++;
        }
      }
    }
  }
  
  @Override
  public void close() {}
  
  public ArrayList<Note> getNotesSequence() {
    return this.notesSequence;
  }
}
