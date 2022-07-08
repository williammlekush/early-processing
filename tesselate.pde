PShape tile;  //declare smallest unit of tesselation pattern
//declare shapes that make up tile
//only 4 hexagons to create 6 hexagon pattern (woo! background!)
PShape hex1;
PShape hex2;
PShape hex3;
PShape hex4;

//define hexagon side length
float hexSideLength = 10;
//6 equilateral triangles = 1 regular hexagon
// 1/2 of equilaterateral triangle = 30-60-90 triangle
//define 30-60-90 triangle side lengths
//used to establish vertices from center
float hypotenuse = hexSideLength;
float shortLeg = hexSideLength/2;
float longLeg = shortLeg*sqrt(3);

//declare color variables
color color1, color2, color3;
float spinSpeed;

void setup() {  
  size(500, 500);

  //define the vertices of a hexagon centered on its position
  //think about drawing those 30-60-90 triangles from the position as center
  float clX = -hypotenuse;  //center left vertex x position
  float clY = 0;            //center left vertex y position
  float tlX = -shortLeg;    //top left vertex x position
  float tlY = -longLeg;     //top left vertex y position
  float trX = shortLeg;     //top right vertex x position
  float trY = -longLeg;     //top right vertex y position
  float crX = hypotenuse;   //center right vertex x position
  float crY = 0;            //center right vertex y position
  float brX = shortLeg;     //bottom right vertex x position
  float brY = longLeg;      //bottom right vertex y position
  float blX = -shortLeg;    //bottom left vertex x position
  float blY = longLeg;      //bootom left vertex y position
  //define the translation of the hexagons in the second row of the tile
  float hexRo2X = 1.5*hypotenuse;
  //define y translations of hexagons
  float hex1Y = 2*longLeg;
  float hex2Y = -hex1Y;
  float hex3Y = -longLeg;
  float hex4Y = -hex3Y;



  //define hexagon colors
  color1 = color(250, 0, 0);
  color2 = color (0, 0, 250);
  color3 = color (0);
  //create the tile shape as a group of hexagon shapes
  //this makes the tesselation grid simpler to create
  //and is a general method for doing any desired tesselation
  tile = createShape(GROUP);

  //create a hexagon shape
  hex1 = createShape();            //empty createshape() defines shape in next lines
  hex1.beginShape();                 //start to define the shape
  hex1.fill(color1);
  hex1.noStroke();
  hex1.vertex(clX, clY + hex1Y);     //left vertex (ORDER MATTERS)
  hex1.vertex(tlX, tlY + hex1Y);     //top left vertex
  hex1.vertex(trX, trY + hex1Y);     //top right vertex
  hex1.vertex(crX, crY + hex1Y);     //right ertex
  hex1.vertex(brX, brY + hex1Y);     //bottom right vertex
  hex1.vertex(blX, blY + hex1Y);     //bottom left vertex
  hex1.endShape();                   //stop defining shape
  tile.addChild(hex1);             //add shape to shape group
  //now do the same for the rest
  hex2 = createShape();
  hex2.beginShape();
  hex2.fill(color2);
  hex2.noStroke();
  hex2.vertex(clX, clY + hex2Y);
  hex2.vertex(tlX, tlY + hex2Y);
  hex2.vertex(trX, trY + hex2Y);
  hex2.vertex(crX, crY + hex2Y);
  hex2.vertex(brX, brY + hex2Y);
  hex2.vertex(blX, blY + hex2Y);
  hex2.endShape();
  tile.addChild(hex2);

  hex3 = createShape();
  hex3.beginShape();
  hex3.fill(color1);
  hex3.noStroke();
  hex3.vertex(clX + hexRo2X, clY +hex3Y);
  hex3.vertex(tlX + hexRo2X, tlY + hex3Y);
  hex3.vertex(trX + hexRo2X, trY + hex3Y);
  hex3.vertex(crX + hexRo2X, crY + hex3Y);
  hex3.vertex(brX + hexRo2X, brY + hex3Y);
  hex3.vertex(blX + hexRo2X, blY + hex3Y);
  hex3.endShape();
  tile.addChild(hex3);

  hex4 = createShape();
  hex4.beginShape();
  hex4.fill(color2);
  hex4.noStroke();
  hex4.vertex(clX + hexRo2X, clY +hex4Y);
  hex4.vertex(tlX + hexRo2X, tlY + hex4Y);
  hex4.vertex(trX + hexRo2X, trY + hex4Y);
  hex4.vertex(crX + hexRo2X, crY + hex4Y);
  hex4.vertex(brX + hexRo2X, brY + hex4Y);
  hex4.vertex(blX + hexRo2X, blY + hex4Y);
  hex4.endShape();
  tile.addChild(hex4);
  spinSpeed = 0;
}

void draw() {
  //remember that background color = color of one set of hexagons
  //could make two more hexagons, but frame rate issues...
  background(color3);

  //how far to shift tiles so they don't overlap
  float xTileShift = 3 * hypotenuse;
  float yTileShift = 6 * longLeg;
  //set maxs for number of rows + columns
  int roMax = 50;
  int colMax = 100;
  //set starting/ending tile positions for rows
  float rowStart = (width/2) - ((colMax/2) * xTileShift);
  float rowEnd = (width/2) + ((colMax/2) * xTileShift);
  //now for columns
  float colStart = (height/2) - ((roMax/2) * yTileShift);
  float colEnd = (height/2) + ((roMax/2) * yTileShift);



  float zoomX = map(mouseX, 0, width, .1, 4);
  float zoomY = map(mouseY, 0, height, .1, 4);

  //move rotation/scale point to the center
  translate(width/2, height/2);
  spinSpeed += 5;
  //scale according to zoom
  scale(zoomX, zoomY);
  //rotate according to spinSpeed
  rotate(radians(spinSpeed));
  //draw the grid of tiles
  for (float xPos = rowStart; xPos < rowEnd; xPos += xTileShift) { 
    for (float yPos = colStart; yPos < colEnd; yPos += yTileShift) {
      shape(tile, xPos, yPos);
    }
  }
  println(spinSpeed);
}
