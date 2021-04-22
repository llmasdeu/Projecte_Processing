// This program acts funny in the funprogramming.org website
// Everything goes up and left

// There is a bug with using filter() in processing.js:
// https://processing-js.lighthouseapp.com/projects/41284/tickets/1392-filterblur-shifts-contents-of-blurred-image

// In the Processing IDE it works fine :)

void setup() {
  size(400, 400);
  background(0);
  stroke(255);
  fill(255);
  textSize(80);
}
void draw() {
  fill(random(255), random(255), random(255));
  ellipse(random(width), random(height), 40, 40);
  filter(BLUR, 2);
}
