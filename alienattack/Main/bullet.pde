// Class for Bullets

class bullet {
  //members
  float x;  
  float y;
  float speedY;
  float w;
  float life = 255;

  //Constructor
  bullet(float tempX, float tempY, float tempSpeedY, float tempW) {
    x = tempX;
    y = tempY;
    w = tempW;
    speedY = tempSpeedY;
  }

  //  move method for dropping bullets from alien and mothership
  void move2() {
    y = y - speedY;

    if (y>=680)
      life =-1;   

    if (life==-1)
      explode();
  }

  // move method for firing bullets from the defender
  void move() {
    y = y + speedY;

    if (y<5)
      life =-1;
    if (y>height-5)
      life =-1;   

    if (life==-1)
      explode();
  }

  // explode method that adds explosion to the bullets
  void explode() {
    if (w == 5) {
      //bullet explosion 
      int maxMissiles = int(random(5, 100));
      for (int i=0; i<maxMissiles; i+=1) {
        //this for loop is where the explosion is created
        // added to missiles arrayList
        missiles.add(new Explosion(random(x-2, x+2), random(y+2, y+2), random(-1.3, 1.3), random(-2.7, 0.6), 4, 0.72, false));
      }
    }
    if (w == 7) {
      //bullet explosion 
      int maxMissiles = int(random(5, 10));
      for (int i=0; i<maxMissiles; i+=1) {
        //this for loop is where the explosion is created
        // added to missiles arrayList
        Amissiles.add(new Explosion(x, y, random(-1.3, 1.3), random(-2.7, 0.6), 4, 0.72, false));
      }
    }
    if (w == 10) {
      //bullet explosion 
      int maxMissiles = int(random(5, 10));
      for (int i=0; i<maxMissiles; i+=1) {
        //this for loop is where the explosion is created
        // added to missiles arrayList
        ShipMissiles.add(new Explosion(random(x-4, x+4), random(y-4, y+4), random(-1.3, 1.3), random(-2.7, 0.6), 4, 0.72, false));
      }
    }
  }


  boolean finished() {
    // bullet dead?
    if (life<0) {
      return true;
    } else {
      return false;
    }
  }

  void render() {
    // draw an ellipse for bullet
    // check w to set the color
    if (w == 5) {
      fill(255);
    } else if (w == 7) {
      fill(255, 255, 0);
    } else if (w == 10) {
      fill(255, 0, 0);
    }
    noStroke();
    ellipse(x, y, w, w);
  }
}
