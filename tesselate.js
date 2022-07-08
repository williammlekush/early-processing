// define hexagon side length
const hypotenuse = 10;
const shortLeg = 5;
const longLeg = shortLeg * Math.sqrt(3);

// declare color variables
let colors;
let spinSpeed;

// define the translation of the hexagons in the second row of the tile
const hexRo2X = 1.5 * hypotenuse;

// define y translations of hexagons
const hex1Y = 2 * longLeg;
const hex2Y = -hex1Y;
const hex3Y = -longLeg;
const hex4Y = -hex3Y;

// how far to shift tiles so they don't overlap
const xTileShift = 3 * hypotenuse;
const yTileShift = 6 * longLeg;

// set maxs for number of rows + columns
const roMax = 25;
const colMax = 50;

let rowStart, rowEnd, colStart, colEnd;

const hexagons = [
  getHex(1, 0, hex1Y),
  getHex(1, hexRo2X, hex3Y),
  getHex(2, 0, hex2Y),
  getHex(2, hexRo2X, hex4Y),
];

function setup() {
  createCanvas(1000, 1000);

  // set starting/ending tile positions for rows
  rowStart = width / 2 - (colMax / 2) * xTileShift;
  rowEnd = width / 2 + (colMax / 2) * xTileShift;
  // now for columns
  colStart = height / 2 - (roMax / 2) * yTileShift;
  colEnd = height / 2 + (roMax / 2) * yTileShift;

  // define hexagon colors
  colors = [color(0), color(250, 0, 0), color(0, 0, 250)];

  print(colors);
  print(hexagons);

  spinSpeed = 0;
}

function draw() {
  // remember that background color = color of one set of hexagons
  // could make two more hexagons, but frame rate issues...
  background(colors[0]);

  const zoomX = map(mouseX, 0, width, 0.1, 4);
  const zoomY = map(mouseY, 0, height, 0.1, 4);

  // move rotation/scale point to the center
  translate(width / 2, height / 2);
  spinSpeed += 5;

  // scale according to zoom
  scale(zoomX, zoomY);

  // rotate according to spinSpeed
  rotate(radians(spinSpeed));

  // draw the grid of tiles
  for (let xPos = rowStart; xPos < rowEnd; xPos += xTileShift) {
    for (let yPos = colStart; yPos < colEnd; yPos += yTileShift) {
      push();
      translate(xPos, yPos);
      noStroke();

      hexagons.forEach((hex) => {
        fill(colors[hex.color]);
        beginShape();
        vertex(hex.v1.x, hex.v1.y);
        vertex(hex.v2.x, hex.v2.y);
        vertex(hex.v3.x, hex.v3.y);
        vertex(hex.v4.x, hex.v4.y);
        vertex(hex.v5.x, hex.v5.y);
        vertex(hex.v6.x, hex.v6.y);
        endShape();
      });
      pop();
    }
  }
}

function getHex(color = 0, xShift = 0, yShift = 0) {
  // define the vertices of a hexagon centered on its position
  // think about drawing those 30-60-90 triangles from the position as center
  const clX = -hypotenuse; // center left vertex x position
  const clY = 0; // center left vertex y position
  const tlX = -shortLeg; // top left vertex x position
  const tlY = -longLeg; // top left vertex y position
  const trX = shortLeg; // top right vertex x position
  const trY = -longLeg; // top right vertex y position
  const crX = hypotenuse; // center right vertex x position
  const crY = 0; // center right vertex y position
  const brX = shortLeg; // bottom right vertex x position
  const brY = longLeg; // bottom right vertex y position
  const blX = -shortLeg; // bottom left vertex x position
  const blY = longLeg; // bottom left vertex y position

  return {
    color: color,
    v1: {
      x: clX + xShift,
      y: clY + yShift,
    },
    v2: {
      x: tlX + xShift,
      y: tlY + yShift,
    },
    v3: {
      x: trX + xShift,
      y: trY + yShift,
    },
    v4: {
      x: crX + xShift,
      y: crY + yShift,
    },
    v5: {
      x: brX + xShift,
      y: brY + yShift,
    },
    v6: {
      x: blX + xShift,
      y: blY + yShift,
    },
  };
}
