var song;
var slider;
var amp;

var trebhistory = [];
var midhistory = [];

function setup() {
	createCanvas(windowWidth, windowHeight);
	
	// load sound file with a callback function
	song = loadSound("mean-something.mp3", loaded);
	
	// create slider for volume
	// slider = createSlider(0,1,0.2,0.02);
	
	
	// create an amplitude object
	amp = new p5.Amplitude();
	
	// set angle mode for radians
	angleMode(DEGREES);
	
	fft = new p5.FFT();
	
}

function loaded() {
	song.play();
}


function draw() {
	push();
	fill(0);
	textSize(36);
	text('hey', 0,0); 
	pop();
	fft.analyze();
	
	var bass = fft.getEnergy( "bass" );
	var mid = fft.getEnergy( "mid" );
	var treb = fft.getEnergy( "treble" );
	
	trebhistory.push(treb);
	midhistory.push(mid);
	
	// create background each new draw
	background("#fff2f9");
	
	// get amp level
	var vol = amp.getLevel();
	
	// if slider changes, update volume value
	// song.setVolume(slider.value());
	song.setVolume(0.2);
	
	
	
	
	noFill();
	
	// put everything in the center
	translate(width/2,height/2);
	
	// treble line
	beginShape();
	for (var i=0; i<trebhistory.length; i++) {
		stroke("#cde3d6");
		strokeWeight(4);
		var r = map(trebhistory[i], 0, 256, 100, 500);
		var x = r * cos(i);
		var y = r * sin(i);
		// var y = map(volhistory[i], 0, 1, height/2, 0);
		vertex(x,y);
	}
	endShape();
	
	// mid line
	beginShape();
	for (var i=0; i<midhistory.length; i++) {
		stroke("#7dc1ac");
		strokeWeight(4);
		var r = map(midhistory[i], 0, 256, 80, 250);
		var x = r * cos(i);
		var y = r * sin(i);
		// var y = map(volhistory[i], 0, 1, height/2, 0);
		vertex(x,y);
	}
	endShape();
	
	// map the volume to diamater between 10 and 100
	var diam = map(bass, 0, 256, 30, 220);
	
	// create center circle
	push();
	noStroke();
	fill("#5ca890");
	ellipse(0, 0, diam, diam);
	pop();
	
	// when volhistory arr reaches 360
	// update by dropping first and adding new value each draw
	if (trebhistory.length > 360) {
		trebhistory.splice(0, 1);
	}
	// same for mid line
	if (midhistory.length > 360) {
		midhistory.splice(0, 1);
	}
}

// play and pause sketch when key pressed
function keyPressed() {
	if (song.isPlaying()) {
		song.pause();
		noLoop();
	} else {
		loop();
		song.play();
	}
}

