int rad = 60;        // Largeur de la forme
float xpos, ypos;    // Position de départ de la forme    

float xspeed = 2.8;  // Vitesse horizontale
float yspeed = 2.2;  // Vitesse verticale

int xdirection = 1;  // Gauche à droite
int ydirection = 1;  // Haut en bas


void start() 
{
  noStroke();
  ellipseMode(RADIUS);
  // Position de départ
  xpos = width/2;
  ypos = height/2;
}

void draw() 
{
  background(0);
  
  // Met à jour la position
  xpos = xpos + ( xspeed * xdirection );
  ypos = ypos + ( yspeed * ydirection );
  
  // Vérifie si on atteint la bordure de l'image
  if (xpos > width-rad || xpos < rad) {
    xdirection *= -1;
  }
  if (ypos > height-rad || ypos < rad) {
    ydirection *= -1;
  }

  // Dessin de la forme
  ellipse(xpos, ypos, rad, rad);
}