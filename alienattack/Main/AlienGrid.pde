// class for invaders mode
class alienGrid {
  //members
  int rows = 5;
  int cols = 5;
  alien[][] invGrid;
  int deltaX;
  int deltaY;
  int index;
  float sX, sY;
  int count = 0;
  int hitCount = 25;
  boolean isNull = true;
  int waveCount = 100;
  float tempSx1 = 2;
  float tempSx2 = -2;
  float tempSy = 4;

  alienGrid(int deltaX, int deltaY) {
    //constructor
    
    this.deltaX = deltaX;
    this.deltaY = deltaY;
    this.sX = tempSx1;
    this.sY = tempSy;

    invGrid = new alien[cols][rows];
    aBullets = new ArrayList();

    // make mothership
    
    mShipOne = new mShip(250, 40);
    msBullets = new ArrayList();

    for (int i = 0; i < cols; i++) {
      for (int j = 0; j < rows; j++) {
        // Initialize each object in a grid
        index = int(random(0, 4));
        invGrid[i][j] = new alien(drawAliens[index], index, deltaX, deltaY);  
        deltaY = deltaY + 50;
      }
      deltaY = 100;
      deltaX = deltaX + 50;
    }
  }

  // render the mother ship and the invaders
  
  void render() {
    mShipOne.update();
    for (int i=0; i<cols; i++) {
      for (int j=0; j<rows; j++) {
        if (invGrid[i][j] != null)
          invGrid[i][j].render();
      }
    }
  }       

  // move the aliens and keep the grid shape
  
  void moveGrid() {

    for (int i=0; i<cols; i++) {
      for (int j=0; j<rows; j++) {
        if (invGrid[i][j] != null)
          if (invGrid[i][j].x>=width) {
            sX = tempSx1;
            count = 2;
          } else if (invGrid[i][j].x<=0) {
            sX = tempSx2;
            count = 2;
          }
        if (invGrid[i][j] != null)
          invGrid[i][j].x=invGrid[i][j].x-sX;

        if (count == 2) {

          for (int m=0; m<cols; m++) {
            for (int n=0; n<rows; n++) {
              if (invGrid[m][n] != null)
                invGrid[m][n].y=invGrid[m][n].y+sY;
              count = 0;
            }
          }
        }
      }
    }
  }

  // Invaders drop yellow bullets
  // Each bullet hitting the defender makes it loss score
  
  void DropBullet() {
    if (millis() - initialTimeAdd > intervalAdd) {
      initialTimeAdd = millis();
      intervalAdd = int(random(2500, 3000));
      float ySpeed = -2; 
      int a = int(random(0, cols));
      int b = int(random(0, rows));
      if (invGrid[a][b] != null)
        aBullets.add(new bullet(invGrid[a][b].x, invGrid[a][b].y, ySpeed, 7));
    }

    for (bullet currentaB : aBullets) {
      currentaB.move2();
      currentaB.render();
    }
  }

  // Explode the Remove bullets and Aliens if Hit is detected 
  // 2 for loops to check the dist between bullet and an alien
  
  void invHit() {
    for (int i = bullets.size()-1; i >= 0; i--) {
      for (int w = rows-1; w >= 0; w--) {
        for (int v = cols-1; v >= 0; v--) {
          if (invGrid[w][v] != null) {
            float distance = dist(bullets.get(i).x, bullets.get(i).y, invGrid[w][v].x, invGrid[w][v].y);

            if (distance < 20) {
              invGrid[w][v] = null;     
              hitCount = hitCount - 1;

              bullets.get(i).life = -1;
              curScore = curScore + 5;
            }
          }
        }
      }
    }

    // Explode the Remove bullets if Hit is detected with motherShip
    // Score goes up 10 points with each hit

    for (int j = bullets.size()-1; j >= 0; j--) {
      float distance = dist(mShipOne.x, mShipOne.y, bullets.get(j).x, bullets.get(j).y);
      if (distance < 25) {
        curScore = curScore + 10;
        bullets.get(j).life = -1;
      }
    }

    // Game End if the invaders reach defenders locY
    
    for (int w = rows-1; w >= 0; w--) {
      for (int v = cols-1; v >= 0; v--) {
        if (invGrid[w][v] != null) {
          float distance = dist(defenderOne.x, defenderOne.y, invGrid[w][v].x, invGrid[w][v].y);

          if (distance < 30 || invGrid[w][v].y == defenderOne.y) {
            gameState = 5;
          }
        }
      }
    }
  }  

  // checks the hitCount and resets the invaders grid

  void resetGrid() {
    hitCount = 25;
    curLevel++;

    for (invLevel invLevel : invLevel.values()) {
      if (curLevel > invLevel.getlvl()) {
        deltaY = invLevel.getdY();
        tempSx1 = invLevel.getSx1();
        tempSx2 = invLevel.getSx2();
        tempSy = invLevel.getSy();
      }
    }

    int tempDeltaY = deltaY;

    deltaX = 50;

    for (int i = 0; i < cols; i++) {
      for (int j = 0; j < rows; j++) {
        // Initialize each object in a grid
        index = int(random(0, 4));

        invGrid[i][j] = new alien(drawAliens[index], index, deltaX, deltaY);  
        deltaY = deltaY + 50;
      }
      deltaY =  tempDeltaY;
      deltaX = deltaX + 50;
    }
  }
}
