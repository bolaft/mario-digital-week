void draw() {
  b = false;

  d = 20;
  middle = width/2;;

  for (i = d; i <= width; i += d) {
    if (i < middle) {
      b = true;
    } else {
      b = false;
    }
    
    if (b == true) {
      // Ligne verticale
      line(i, d, i, height-d);
    }
    
    if (b == false) {
      // Ligne horizontale
      line(middle, i - middle + d, width-d, i - middle + d);
    }
  }
}