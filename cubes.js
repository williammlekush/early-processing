let cubeverse = [];

function setup() {
  createCanvas(1000, 1000);
  smooth();

  for (let i = 0; i < random(2, 100); i++) {
    cubeverse.push(new Cube());
  }
}

function draw() {
  cubeverse.forEach((cube) => {
    cube.move();
    cube.display();
  });
}

class Cube {
  constructor() {
    this.x = random(width);
    this.y = random(height);
    this.size = random(5, 11);
    this.fill = color(random(255), random(255), random(255));
    this.stroke = color(random(255), random(255), random(255));
  }

  move() {
    switch (random([1, 2, 3, 4])) {
      case 1:
        this.x += this.size * 0.86062;
        this.y += this.size / 2;
        break;
      case 2:
        this.x -= this.size * 0.86062;
        this.y -= this.size / 2;
        break;
      case 3:
        this.y -= this.size;
        break;
      case 4:
        this.y += this.size;
        break;
      default:
        break;
    }
  }

  display() {
    fill(this.fill);
    stroke(this.stroke);

    //right side
    push();
    translate(this.x + this.size * 0.86062, this.y + this.size / 2);
    rotate(radians(330));
    shearX(radians(330));
    scale(1, 0.86062);
    square(0, 0, this.size);
    pop();

    //left side
    push();
    translate(this.x, this.y);
    rotate(radians(30));
    shearX(radians(30));
    scale(1, 0.86062);
    square(0, 0, this.size);
    pop();

    //top
    push();
    translate(this.x, this.y);
    rotate(radians(330));
    shearX(radians(30));
    scale(1, 0.86062);
    square(0, 0, this.size);
    pop();
  }
}
