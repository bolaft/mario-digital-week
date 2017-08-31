void setup() {
  size(640, 36);
  stroke(255);
  frameRate(50);
  background(0);

  try {
  	start();
  } catch (e) {}

  noLoop();
}

boolean doLoop = false;

void mousePressed() {
  if (!doLoop) {
    loop();
    doLoop = true;
  } else {
    noLoop();
    doLoop = false;
  }
}