/**
 * Processing Sound Library, Example 2
 * 
 * This sketch shows how to use envelopes and oscillators. 
 * Envelopes describe to course of amplitude over time. 
 * The Sound library provides an ASR envelope which stands for 
 * attack, sustain, release. 
 * 
 *       .________
 *      .          ---
 *     .              --- 
 *    .                  ---
 *    A       S        R 
 */

import processing.sound.*;
import java.util.Collection;
import javax.sound.midi.*;

Sequencer sequencer;

TriOsc triOsc;
Env env; 

// Times and levels for the ASR envelope
float attackTime = 0.0001;
float sustainTime = 0.004;
float sustainLevel = 0.3;
float releaseTime = 0.1;

AMidiPlayer player = new AMidiPlayer();

// This is an octave in MIDI notes.
//int[] midiSequence = { 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72 }; 
int[] midiSequence;  

// Play a new note every 200ms
int duration = 250;

// This variable stores the point in time when the next note should be triggered
int trigger = millis(); 

// An index to count up the notes
int note = 0; 

long timeStamp = 0;

void playMusic()
{
  File test = new File(dataPath("Bass.mid"));
  Sequence mySeq = null;
  try 
  {
    mySeq = MidiSystem.getSequence(test);
    
  } catch (Exception e) {
   // Handle error and/or return
   println(e.getMessage());
  }
  
    Track[] tracks = mySeq.getTracks();
    Track track = tracks[1];
    println(tracks.length);
    
    for(int i = 0; i < track.size(); i++)
    {
      MidiEvent midiEvent = track.get(i);
      MidiMessage midiMessage = midiEvent.getMessage();
      player.send(midiMessage,timeStamp);
    }
    
      midiSequence = player.getMidiSequence();
}

void setup() {
  size(640, 360);
  background(255);

  // Create triangle wave and start it
  triOsc = new TriOsc(this);

  // Create the envelope 
  env = new Env(this);
  
  playMusic();
}

void draw() { 
  // If the determined trigger moment in time matches up with the computer clock and
  // the sequence of notes hasn't been finished yet, the next note gets played.
  if ((millis() > trigger) && (note<midiSequence.length)) {

    // midiToFreq transforms the MIDI value into a frequency in Hz which we use to
    // control the triangle oscillator with an amplitute of 0.5
    triOsc.play(midiToFreq(midiSequence[note]), 0.5);

    // The envelope gets triggered with the oscillator as input and the times and
    // levels we defined earlier
    env.play(triOsc, attackTime, sustainTime, sustainLevel, releaseTime);

    // Create the new trigger according to predefined duration
    trigger = millis() + duration;

    // Advance by one note in the midiSequence;
    note++; 

    // Loop the sequence, notice the jitter
    if (note == 12) {
      //note = 0;
    }
  }
} 

// This helper function calculates the respective frequency of a MIDI note
float midiToFreq(int note) {
  return (pow(2, ((note-69)/12.0))) * 440;
}
