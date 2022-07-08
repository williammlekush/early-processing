int numColonies = (int)random(2, 100); //number of cube groups to populate

Cube[] cubeverse = new Cube[numColonies+1];  //declare array of cube objects

void setup() {
  size (1000, 1000);
  smooth();

  for (int i = 0; i < cubeverse.length; i++) {

    cubeverse[i] = new Cube ();
  }
}


void draw() {
  for (int i = 0; i < cubeverse.length; i++) {
    cubeverse[i].move();
    cubeverse[i].display();
  }
}

class Cube {


  Cube () {
  }  

  float x = random(0, width);
  float y = random(0, height);
  float size = random(5, 11);

  void move() {

    boolean rightDrawn = false;
    boolean leftDrawn = false;
    boolean topDrawn = false;
    boolean bottomDrawn = false;

    int posNextCube = (int)random(1, 5); 
    switch(posNextCube) {
    case 1 : 
      //cube on right
      if (!rightDrawn) { 
        x += size * .86062;
        y += size/2;
        rightDrawn = true;
      }
      break; 
    case 2 : 
      //cube on left
      if (!leftDrawn) {
        x -= size * .86062;
        y -= size/2;
        leftDrawn = true;
      }
      break; 
    case 3 : 
      //cube on top
      if (!topDrawn) {
        y -= size;
        topDrawn = true;
      }
      break;
    case 4:
      //cube on bottom
      if (!bottomDrawn) {
        y += size;
        bottomDrawn = true;
      }
    }
  }

  float fillR = random(0, 255);
  float fillG = random(0, 255);
  float fillB = random(0, 255);
  color fill = color(fillR, fillG, fillB);

  float strokeR = random(0, 255);
  float strokeG = random(0, 255);
  float strokeB = random(0, 255);
  color stroke = color(strokeR, strokeG, strokeB);

  void display() {
    boolean cubeDrawn = false;

    if (!cubeDrawn) {
      fill(fill);
      stroke(stroke);
      //right side
      pushMatrix(); 
      translate(x + size * .86062, y + size/2); 
      rotate(radians(330)); 
      shearX(radians(330)); 
      scale(1, .86062); 
      square(0, 0, size); 
      popMatrix(); 
      //left side
      pushMatrix(); 
      translate(x, y); 
      rotate(radians(30)); 
      shearX(radians(30)); 
      scale(1, .86062); 
      square(0, 0, size); 
      popMatrix(); 
      //top
      pushMatrix(); 
      translate(x, y); 
      rotate(radians(330)); 
      shearX(radians(30)); 
      scale(1, .86062); 
      square(0, 0, size); 
      popMatrix();
      cubeDrawn = true;
    }
  }
}
