a = 0;
b = 0.0;

void draw() {  
  a = a + 1;
  b = b + 0.2; 
  line(a, 0, a, height/2);
  line(b, height/2, b, height);
  
  if(a > width) {
    a = 0;
  }
  
  if(b > width) {
    b = 0;
  }
}