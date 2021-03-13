// Class for Alien Ship

class alien {
  //members
  float x;  
  float y;
  float size = 50;
  float speedY;
  float speedX;
  float life = 400;
  int counter = 0;
  int counterDir = 1;
  PShape shape;
  int index;
  PShape[] drawAliens = new PShape[8];


  alien(PShape tempShape, int index, float x, float y) { 
    //constructor 
    this.x = x;
    this.y = y;
    this.speedY = (float)random(2, 5);
    this.speedX = (float)random(2, 5);
    shape = tempShape;
    this.index = index;

    drawAliens[0] = loadShape("ALIEN11.svg");
    drawAliens[4] = loadShape("ALIEN12.svg");
    drawAliens[1] = loadShape("ALIEN01.svg");
    drawAliens[5] = loadShape("ALIEN02.svg");
    drawAliens[2] = loadShape("ALIEN21.svg");
    drawAliens[6] = loadShape("ALIEN22.svg"); 
    drawAliens[3] = loadShape("ALIEN31.svg");
    drawAliens[7] = loadShape("ALIEN32.svg");
  }

  // render the aliens
  void render() {
    drawAlien(index, x, y);
  }

  // draw aliens 4 aliens in different colours
  // animate the 2 svg files for each
  void drawAlien(int index, float x, float y) {
    if (index == 0) {
      if (counter >=0 && counter <=20) {
        shape(drawAliens[0], x, y, size, size);
      } else if (counter>20 && counter <=40) {
        shape(drawAliens[4], x, y, size, size);
      } else {
        counter = 0;
      }
      counter = counter +counterDir;
    }
    if (index == 1) {
      if (counter >=0 && counter <=20) {
        shape(drawAliens[1], x, y, size, size);
      } else if (counter>20 && counter <=40) {
        shape(drawAliens[5], x, y, size, size);
      } else {
        counter = 0;
      }
      counter = counter +counterDir;
    }
    if (index == 2) {
      if (counter >=0 && counter <=20) {
        shape(drawAliens[2], x, y, size, size);
      } else if (counter>20 && counter <=40) {
        shape(drawAliens[6], x, y, size, size);
      } else {
        counter = 0;
      }
      counter = counter +counterDir;
    }
    if (index == 3) {
      if (counter >=0 && counter <=20) {
        shape(drawAliens[3], x, y, size, size);
      } else if (counter>20 && counter <=40) {
        shape(drawAliens[7], x, y, size, size);
      } else {
        counter = 0;
      }
      counter = counter +counterDir;
    }
  }
  // move method for aliens in arcade game mode
  void move() {
    if (x>=width-25) {
      speedX = (float)random(+2, +5);
    }
    if (x<=25) {
      speedX = (float)random(-2, -5);
    }
    y=y+speedY;
    x=x-speedX;
  }

  // move method for display (not used yet)
  void moveDis() {
    if (x >= 20) {
      speedX = (float)random(+8, +10);
    }
    if (x <=  20) {
      speedX = (float)random(-8, -10);
    }
    x = x+speedX;
  }

  //update method for aliens
  void update() {
    move();
    render();
  }
}
