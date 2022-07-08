void setup() {
  size(2000, 1200);
  background(0);

  stroke(255);

  int disLines = 10;
  int maxXLines = width/10;
  int maxYLines = height/10;
  int xInitial = width - disLines;
  int yInitial = 0;
  int xFinal = width;
  int yFinal = disLines;

  for (int i = 0; i < maxXLines; i++) {
    line(xInitial, yInitial, xFinal, yFinal);
    xInitial -= disLines;
    yFinal += disLines;
  }
  for (int i1 = 0; i1 < maxYLines; i1++) {
    line(xInitial, yInitial, xFinal, yFinal);
    yInitial += disLines;
    xFinal -= disLines;
  }
}

void draw() {
  int sizeMax = frameCount/100;
  int size = (int)random (1, sizeMax);

  int xMax = width - size;
  float xRange = random(xMax);
  float xNoise = noise(xRange);
  int x = (int)map(xNoise, 0, 1, 0, xMax);

  int yMax = height - size;
  float yRange = random(yMax);
  float yNoise = noise(yRange);
  int y = (int)map(yNoise, 0, 1, 0, yMax);

  int depMax = frameCount/300;
  int dep = (int) random(2, depMax);

  float angle = random(10, 360);

  int edgeNum = (int)random(1, 5);

  fill(0);

  switch(edgeNum) {
  case 1:
    for (int i = 0; i < dep; i++) {
      pushMatrix();
      rotate(radians(angle));
      circle(x, y, size);
      popMatrix();
      x ++;
      y ++;
    }
    break;
  case 2:
    break;
  case 3:
    for (int i = 0; i < dep; i++) {
      int x2 = x+size;
      int y2 = y;
      float x3 = x+size;
      float y3 = y+size;
      pushMatrix();
      rotate(radians(angle));
      triangle(x, y, x2, y2, x3, y3);
      popMatrix();
      x++;
      y++;
    }
    break;
  case 4:
    for (int i = 0; i < dep; i++) {
      pushMatrix();
      rotate(radians(angle));
      square(x, y, size);
      popMatrix();
      x ++;
      y ++;
    }
  }
}
