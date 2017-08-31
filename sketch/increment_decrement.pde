int a;
int b;
boolean direction;

void start() {
  colorMode(RGB, width);
  a = 0;
  b = width;
  direction = true;
}

void draw() {
  a = 50;
  if(a > width) {
    a = 0;
    direction = !direction;
  }
  if(direction == true){
    stroke(a);
  } else {
    stroke(width-a);
  }
  line(a, 0, a, height/2);

  b--;
  if(b < 0) {
    b = width;
  }
  if(direction == true) {
    stroke(width-b);
  } else {
    stroke(b);
  }
  line(b, height/2+1, b, height);
}