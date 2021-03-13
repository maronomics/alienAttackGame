// Class for MotherShip Ship

class mShip {
  //members
  float x;  
  float y;
  float xSpeed = 1;

  // PShape to Load SVG files for Ship Animation
  PShape ship1;
  PShape ship2;
  int counter = 0;
  int counterDir = 1;

  mShip(int x, int y) { 
    //constructor 
    this.x = x;
    this.y = y;
    msBullets = new ArrayList();
    velocity = new PVector();
    velocity.x = 0;
    velocity.y = 0;
    ship1 = loadShape("mShip1.svg");
    ship2 = loadShape("mShip2.svg");
  }

  void render() {
    pushMatrix();   
    drawMShip(x, y);
    popMatrix();
  }

  void drawMShip(float x, float y) {
    // Animate motherShip
    if (counter >=0 && counter <=20) {
      shape(ship1, x, y, 90, 40);
    } else if (counter>20 && counter <=40) {
      shape(ship2, x, y, 90, 40);
    } else {
      counter = 0;
    }
    counter = counter +counterDir;
  }

  void move() {
    // Move Ship Left and Right
    if (x<25) {
      xSpeed = +1;
    }


    if (x>475) {
      xSpeed = -1;
    } 
    x = x + xSpeed;
  }

  void DropmBullet() {
    if (mShipOne.x == defenderOne.x || mShipOne.x == defenderOne.x+25 || mShipOne.x == defenderOne.x-25) {
      float ySpeed = -4;      
      msBullets.add(new bullet(x, y, ySpeed, 10));
    }

    for (bullet currentmB : msBullets) {
      currentmB.move2();
      currentmB.render();
    }
  }

  void update() {
    move(); // get moveLeft and moveRight from code
    render();
    DropmBullet();
  }
}
