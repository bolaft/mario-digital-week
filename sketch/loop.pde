y = 1;

void draw() { 
  background(0);
  line(0, y, width, y);  
  
  if (y < 0) { 
    y = height; 
  } 
}