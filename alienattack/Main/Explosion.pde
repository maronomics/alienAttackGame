// Class for Explosions

class Explosion {
  //members
  float startlocX, startlocY;
  float x, y;
  float xVelocity, yVelocity;
  float sizeMissile;
  float life=20;
  float lifeDecrease;
  boolean dead=false;
  boolean withLine;

  //constructor
  Explosion(float _startlocX, float _startlocY, float _xVelocity, float _yVelocity, float _size, float _lifeDecrease, boolean _withLine) {
    startlocX = _startlocX;
    startlocY = _startlocY;
    x = startlocX;
    y = _startlocY;
    sizeMissile = _size;
    lifeDecrease = _lifeDecrease;
    xVelocity = _xVelocity;
    yVelocity = _yVelocity;
    // withLine = _withline;
  } //constructor end

  void render() {
    fill(255);
    noStroke();
    if (withLine) {
      line(startlocX, startlocY, x, y);
    }
    sizeMissile-=0.07;
    rect(x, y, sizeMissile, sizeMissile);
  }

  void fly() {
    x += xVelocity;
    y += yVelocity;
  }

  void decreaseLife() {
    life -= lifeDecrease;

    // check wall collision
    if (x<0)
      dead = true;
    if (x>width)
      dead = true;

    if (life<=0 || sizeMissile <=0) {
      dead = true;
    }
  }
}
