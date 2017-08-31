float theta;
float a = 1;

void draw() {
  background(0);
  a++;
  // Convertion en radians
  theta = radians(a);
  // Commence l'arbre en bas de l'écran
  translate(width/2,height);
  // Dessine une ligne de 120 pixels
  line(0,0,0,-120);
  // Déplace au bout de la ligne
  translate(0,-120);
  // On commence le branchement récursif
  branch(120);

}

void branch(float h) {
  // Chaque branche fera 2/3 de la précédente
  h *= 0.66;
  
  // Toutes les fonctions récursives doivent avoirent une condition de sortie !
  // La notre vérifie si la branche fait 2 pixels ou moins
  if (h > 2) {
    pushMatrix();    // Sauvegarde l'état de la transformation
    rotate(theta);   // Rotation par theta
    line(0, 0, 0, -h);  // Dessine la branche
    translate(0, -h); // Déplace au bout de la branche
    branch(h);       // Récursion !
    popMatrix();     // Quand on sort de la récursion, on restaure l'état de la transformation
    
    // Même chose, avec la branche de "gauche"
    pushMatrix();
    rotate(-theta);
    line(0, 0, 0, -h);
    translate(0, -h);
    branch(h);
    popMatrix();
  }
}