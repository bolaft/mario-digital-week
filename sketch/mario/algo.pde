/**
 * VARIABLES :
 *    personnage.x         e	x du personnage
 *    personnage.y          	position verticale du personnage
 *    personnage.precedent.xe	x du personnage à la frame précédente
 *    personnage.precedent.y 	position verticale du personnage à la frame précédente
 *
 *    mario.aLaClef 			vrai si Mario transporte la clef
 *    mario.peutTraverser 		vrai si Mario peut traverser un conduit
 * 
 * FONCTIONS :
 *    mario.courirDroite() 		Mario court vers la droite
 *    mario.courirGauche() 		Mario court vers la gauche
 *    mario.sauter() 			Mario saute (seulement s'il est sur une surface solide)
 *    mario.seBaisser() 		Mario se baisse (permet aussi de traverser les conduits)
 */

arrierePlan = false;
variable1 = false;
variable2 = false;
variable3 = null;
variable4 = null;
entier = 0;
entier1 = 0;
entier2 = 0;
flottant = 0.0;
flottant1 = 0.0;
flottant2 = 0.0;

void choixAction(mario, monstres, nombreDeMonstres)
{
	console.log(nombreDeMonstres);
	lines = loadStrings("sketch/mario/algo.txt");

	String code = "";

	for (int i = 0; i < lines.length; i++) {
		if (lines[i] == "demo") {
			choixActionSuccess(mario, monstres, nombreDeMonstres);
			break;
		}

		code += interpret(lines[i].toLowerCase()) + "\n";
	}

	console.log(code);

	eval(code);
}

String interpret(s)
{
	/*HashMap<String,String> t = new HashMap<String,String>();*/

	s = s.replace(" au ", " à le ");

	s = s.replace("mario court à droite", "mario.courirDroite();");
	s = s.replace("mario court à gauche", "mario.courirGauche();");
	s = s.replace("mario saute", "mario.sauter();");
	s = s.replace("mario se baisse", "mario.seBaisser(); mario.courirDroite();");

	s = s.replace("mario a la clef", "mario.aLaClef");
	s = s.replace("mario n'a pas la clef", "mario.aLaClef == false");
	s = s.replace("mario peut traverser", "mario.peutTraverser");
	s = s.replace("mario ne peut pas traverser", "mario.peutTraverser == false");

	s = s.replace("devient vraie", "= true");
	s = s.replace("devient vrai", "= true");
	s = s.replace("devient faux", "= false");
	s = s.replace("devient fausse", "= false");

	s = s.replace("est vraie", "== true");
	s = s.replace("est vrai", "== true");
	s = s.replace("est faux", "== false");
	s = s.replace("est fausse", "== false");

	s = s.replace("est égal à", "==");
	s = s.replace("est supérieur à", ">");
	s = s.replace("est supérieur ou égal à", ">=");
	s = s.replace("est inférieur à", "<");
	s = s.replace("est inférieur ou égal à", "<=");
	s = s.replace("est égale à", "==");
	s = s.replace("est supérieure à", ">");
	s = s.replace("est supérieure ou égale à", ">=");
	s = s.replace("est inférieure à", "<");
	s = s.replace("est inférieure ou égale à", "<=");
	s = s.replace("prend la valeur de", "=");

	s = s.replace(" moins ", " - ");
	s = s.replace(" plus ", " + ");
	s = s.replace(" fois ", " * ");
	s = s.replace(" divisé par ", " / ");
	s = s.replace(" divisée par ", " / ");

	s = s.replace(" et ", " && ");
	s = s.replace(" ou ", " || ");
	s = s.replace(" alors", "){");
	s = s.replace("sinon si", "} else if (");
	s = s.replace("sinon", "} else {");
	s = s.replace("si ", "if (");
	s = s.replace("fin si", "}");

	s = s.replace("pour chaque monstre", "i = 0; while (i < nombreDeMonstres) { monstre = monstres.get(i);");
	s = s.replace("fin pour", "i++; }");

	s = s.replace("le x de mario", "mario.x");
	s = s.replace("la position de mario", "mario.x");
	s = s.replace("la position horizontale de mario", "mario.x");
	s = s.replace("le y de mario", "mario.y");
	s = s.replace("la position verticale de mario", "mario.y");

	s = s.replace("le x du monstre", "monstre.x");
	s = s.replace("la position horizontale du monstre", "monstre.x");
	s = s.replace("le y du monstre", "monstre.y");
	s = s.replace("la position verticale du monstre", "monstre.y");

	s = s.replace("le x précédent de mario", "mario.precedent.x");
	s = s.replace("la position précédente de mario", "mario.precedent.x");
	s = s.replace("la position horizontale précédente de mario", "mario.precedent.x");
	s = s.replace("le y précédent de mario", "mario.precedent.y");
	s = s.replace("la position verticale précédente de mario", "mario.precedent.y");
	s = s.replace("le x précédent du monstre", "monstre.precedent.x");
	s = s.replace("la position précédente du monstre", "monstre.precedent.x");
	s = s.replace("la position horizontale précédente du monstre", "monstre.precedent.x");
	s = s.replace("le y précédent du monstre", "monstre.precedent.y");
	s = s.replace("la position verticale précédente du monstre", "monstre.precedent.y");

	s = s.replace("faux", "false");
	s = s.replace("vraie", "true");
	s = s.replace("vrai", "true");

	/*	s = s.replace("vrai", "true")*/

	/*for (Map.Entry me : t.entrySet()) {
		s = s = s.replace(me.getKey(), me.getValue());
	}*/

	return s;
}

arrierePlan = false;

void choixActionSuccess(mario, ennemis, nombreEnnemis)
{
	// Si Mario a la clef et qu'il ne se trouve pas en arrière plan Mario court vers la gauche
	if (mario.aLaClef == true && arrierePlan == false){ 
		directionDroite = false
		mario.courirGauche();
	// Sinon Mario court vers la droite
	} else {
		directionDroite = true;
		mario.courirDroite();
	}

	// Pour chaque élément de la liste des ennemis
	i = 0;
	while (i < nombreEnnemis) {
	    ennemi = ennemis.get(i);

	    // Si Mario court vers la droite
	    if (directionDroite == true){
	    	// ... et si un ennemi se trouve à moins de 35 pixels à DROITE de Mario
		    if (ennemi.x - mario.x < 35 
		    	// ... et qu'il est à droite de Mario
		    	&& ennemi.x > mario.x){
		    	// alors Mario saute.
		    	mario.sauter();
		    }
		// Sinon
	    } else {
	    	// ... si un ennemi se trouve à moins de 35 pixels à GAUCHE de Mario
		    if (ennemi.x - mario.x > -35 
		    	// ... et qu'il est à gauche de Mario
		    	&& ennemi.x - mario.x < 0){
		    	// alors Mario saute.
		    	mario.sauter();
		    }
	    }

	    i++;
	}

	// Si Mario est à la même position horizontale qu'à la frame précédente (et donc, s'il est bloqué)
    if (mario.x == mario.precedent.x) {
    	// alors Mario saute
    	mario.sauter();
    }

	// Si Mario peut traverser un conduit, et s'il a la clef, et s'il ne se trouve pas déjà à l'arrière plan
    if (mario.peutTraverser == true && mario.aLaClef == true && arrierePlan == false){
    	// alors Mario se baisse
    	mario.seBaisser();
    	// on enregistre qu'on est passé à l'arrière-plan
    	arrierePlan = true;
    }
}