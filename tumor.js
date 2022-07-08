function setup() {
  createCanvas(1000, 1000);
  background(0);

  stroke(255);
  fill(0);

  const disLines = 10;
  let x1 = 0;
  let y1 = height - disLines;
  let x2 = disLines;
  let y2 = height;

  for (let i = 0; i < (2 * width) / disLines; i++) {
    line(x1, y1, x2, y2);
    if (x2 <= width && y1 >= 0) {
      x2 += disLines;
      y1 -= disLines;
    } else {
      x1 += disLines;
      y2 -= disLines;
    }
  }
}

function draw() {
  const size = random(1, frameCount / 10);

  let x = map(noise(random(width)), 0, 1, 0, width - size);
  let y = map(noise(random(height)), 0, 1, 0, height - size);

  const dep = random(2, frameCount / 300);

  const angle = random(10, 360);

  const shape = random([1, 3, 4]);

  push();
  rotate(radians(angle));
  for (let i = 0; i < dep; i++) {
    switch (shape) {
      case 1:
        circle(x, y, size);
        break;
      case 3:
        triangle(x, y, x + size, y, x + size, y + size);
        break;
      case 4:
        square(x, y, size);
        break;
      default:
        break;
    }
    x++;
    y++;
  }
  pop();
}
