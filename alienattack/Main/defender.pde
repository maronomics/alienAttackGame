// Class for Defender Ship

class defender {
  //members
  float x;  
  float y;

  // PShape to Load SVG files for Ship Animation
  PShape ship1;
  PShape ship2;
  int counter = 0;
  int counterDir = 1;

  defender(int x, int y) { 
    //constructor 
    this.x = x;
    this.y = y;
    bullets = new ArrayList();
    velocity = new PVector();
    velocity.x = 0;
    velocity.y = 0;
    ship1 = loadShape("SHIP.svg");
    ship2 = loadShape("SHIP2.svg");
  }

  void fire() {
    if (fireSpeed <=millis()-lastFired) {
      if (ammoCount>0) {
        // ammmoCount--;
        lastFired=millis();
        float ySpeed;
        ySpeed = -1;
        ySpeed *= bulletFlySpeed;
        bullets.add(new bullet(this.x, this.y, ySpeed, 5));
      }
    }
  }

  void render() {
    pushMatrix();   
    drawDefender(x, y);
    popMatrix();
  }

  void drawDefender(float x, float y) {
    // Animate defender Ship
    if (counter >=0 && counter <=20) {
      shape(ship1, x, y, 50, 50);
    } else if (counter>20 && counter <=40) {
      shape(ship2, x, y, 50, 50);
    } else {
      counter = 0;
    }
    counter = counter +counterDir;
  }

  void move(boolean moveLeft, boolean moveRight) {
    // Move Ship Left and Right
    if (moveLeft == true && x>=25) {
      x = x - 10;
    }

    if (moveRight == true && x<=475) {
      x = x + 10;
    }
  }

  void update() {
    move(moveLeft, moveRight); // get moveLeft and moveRight from code
    render();
  }
}
