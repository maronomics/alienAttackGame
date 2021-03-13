/* 
 ALIEN ATTACK
 PROGRAMMING FINAL ASSIGNMENT
 MARIA REHMAN 

 see Game_Description
 
 Keys:
 Left and right to move Defender
 Space to Fire bullets
 
 Mouse: 
 Click to select game modes, restart and go back to menu.
 
 bullet firespeed for Defender (line 66)
 fast 100 (testing)
 slow 700 (default)
 
 timer mode is not working properly
 */

// Move Ship Left and Right
boolean moveLeft;
boolean moveRight;

// Starry Background
int starNumber;

// Alien PShape Array to load SVG files for different coloured Ships
PShape[] drawAliens = new PShape[8];
// Alien ArrayList to spawn multiple Alien Ships
ArrayList<alien> Aliens;
ArrayList<alien> AliensDisplay;
int index;
alien[][] invGrid;

// ArrayList for Bullets
ArrayList<bullet> bullets;
ArrayList<bullet>aBullets;
ArrayList<bullet>msBullets;
PVector velocity;

// Alien Spawn Initial Timer and interval Adder
int intervalAdd = 200;
int initialTimeAdd;

//create MotherShip
mShip mShipOne;

// create Defender Ship
defender defenderOne;
int defLife;
boolean defHit;

// create Invader alienGrid
alienGrid aG1;

// ArrayList for Explosions
ArrayList <Explosion> missiles;
ArrayList <Explosion> Amissiles;
ArrayList <Explosion> ShipMissiles;

// for Bullets
final float bulletFlySpeed = 12.5;   // how fast the bullet flies
final int fireSpeed = 100;  // how often the bullet is fired
int lastFired = millis();  // timer to determine when next bullet starts

//NOT USED YET
int ammoCount = 100;
int alienCount = 100;
int spawn = 1;

// for TIMER 
String time = "00";
int timer;
int interval = 0;
int overlap = 0;
int prevtime = 0;

//GAMESTATE and SCORE Variables
int gameState;
int tempGameState;
int curScore;
int curLevel;
int tempScore;
int arcHighScore;
int invHighScore;
int timHighScore;
Table HScores;


//Splash Screen
PShape logo;
PShape gameOver;
PShape ARCADE;
PShape INVADERS;
PShape TIMER;
PShape RESTART;
PShape MENU;
PShape[] drawHearts = new PShape[3];

//Buttons Position X, Position Y, Size X, Size Y
int bSizeX = 250;
int bSizeY = 50;
int buttonPosX = 250;
int arcBPosY = 350;
int invBPosY = 425;
int timBPosY = 500;
int resBPosY = 575;
int menBPosY = 650;

//Button Boolean
Boolean arcOver = false;
Boolean invOver = false;
Boolean timOver = false;
Boolean resOver = false;
Boolean menOver = false;


void setup() {
  size(500, 700);
  smooth();
  shapeMode(CENTER);
  rectMode(CENTER);
  background(25, 25, 112);
  initialTimeAdd = millis();
  starNumber = 50;
  curScore = 0;
  curLevel = 1;
  tempScore = 5;
  interval = 30;
  defLife = 27;
  defHit = false;
  prevtime = second();
  interval = 0;
  overlap = 0;

  HScores = loadTable("highScoreFile.csv");
  arcHighScore = HScores.getInt(0, 0);
  invHighScore = HScores.getInt(0, 1);
  timHighScore = HScores.getInt(0, 2);

  // font Size, Color
  textSize(25);
  textAlign(CENTER, CENTER);

  // make Defender ship
  defenderOne = new defender(250, 640);

  // make invaders alienGrid
  aG1 = new alienGrid(50, 100);
  aBullets = new ArrayList();
  msBullets = new ArrayList();

  // make an empty arrayList for explosions
  missiles = new ArrayList<Explosion>();
  Amissiles = new ArrayList<Explosion>();
  ShipMissiles = new ArrayList<Explosion>();
  Aliens = new ArrayList<alien>();
  AliensDisplay = new ArrayList<alien>();

  //load images for splash screen
  logo = loadShape("logo.svg");
  ARCADE = loadShape("buttonArcade.svg");
  INVADERS = loadShape("buttonInvaders.svg");
  TIMER = loadShape("buttonTimer.svg");
  gameOver = loadShape("gameOver.svg");
  RESTART = loadShape("buttonRestart.svg");
  MENU = loadShape("buttonMenu.svg");
  drawHearts[0] = loadShape("heart.svg");
  drawHearts[1] = loadShape("heart.svg");
  drawHearts[2] = loadShape("heart.svg");
}

void draw () {
  // Draw Background and Stars
  background(25, 25, 112);
  stroke(255); 
  for (int i = 0; i<starNumber; i++) {
    point(random(width), random(height));
  }

  // Game Mode Selection Function
  gameMode();

  // Defining Game Modes
  switch (gameState) {

  case 0:
    // SPLASH SCREEN

    shape(logo, 250, 180, 400, 200);
    shape(ARCADE, buttonPosX, arcBPosY, bSizeX, bSizeY);
    shape(INVADERS, buttonPosX, invBPosY, bSizeX, bSizeY);
    shape(TIMER, buttonPosX, timBPosY, bSizeX, bSizeY);
    index = 0;
    AliensDisplay.add(new alien(drawAliens[index], index, 100, 600));
    index = 1;
    AliensDisplay.add(new alien(drawAliens[index], index, 200, 600));
    index = 2;
    AliensDisplay.add(new alien(drawAliens[index], index, 300, 600));
    index = 3;
    AliensDisplay.add(new alien(drawAliens[index], index, 400, 600));

    for (alien AD : AliensDisplay) {
      // AD.move();
      AD.render();
    }


    break;

  case 1:
    // GAME MODE: ARCADE

    // call functions to run Arcade Mode
    tempGameState = gameState;
    spawnAliens();
    Score();
    defenderOne.update();
    Bullet();
    arcadeGame();
    // Call Explosion manager function
    ExplosionManager();

    break;

  case 2:
    // GAME MODE: INVADERS
    // call functions to start the Invaders Mode
    // draw heart shape for the defender life indication
    if (drawHearts[0] != null) shape(drawHearts[0], 20, 680, 25, 25);
    if (drawHearts[1] != null) shape(drawHearts[1], 50, 680, 25, 25);
    if (drawHearts[2] != null) shape(drawHearts[2], 80, 680, 25, 25);

    tempGameState = gameState;

    setGrid(); // calls alien Grid class and procedures
    Score();   // calls the score function
    Bullet(); // checks bullet collision with aliens
    defenderOne.update(); // sets the defender from defender class
    defHit(); // check bullet collision with defender (yellow - score) (red - life)
    ExplosionManager();  // manages the multiple bullets explosions for different bullets

    // levels? speed goes up 
    // game end?
    // reset grid multiples

    break;

  case 3:
    // GAME MODE: TIMER
    // call functions to run Arcade Mode with timer

    tempGameState = gameState;
    spawnAliens();
    Score();
    defenderOne.update();
    Bullet();
    arcadeGame();
    gameTimer();
    // Call Explosion manager function
    ExplosionManager();

    break;

  case 5:
    //GAME MODE: GameOver
    shape(gameOver, 250, 150, 400, 200);
    text("TOTAL SCORE", 250, 320);
    text(curScore, 250, 350);
    text("LEVEL REACHED", 250, 390);
    text(curLevel, 250, 420);
    if (tempGameState == 1) {
      if (curScore > arcHighScore) {
        HScores.setInt(0, 0, curScore);
        saveTable(HScores, "data/highScoreFile.csv");
        arcHighScore = HScores.getInt(0, 0);
        text("HIGH SCORE", 250, 470);
        text(arcHighScore, 250, 500);
      } else {
        arcHighScore = HScores.getInt(0, 0);
        text("HIGH SCORE", 250, 470);
        text(arcHighScore, 250, 500);
      }
    } else if (tempGameState == 2) {
      if (curScore > invHighScore) {
        HScores.setInt(0, 1, curScore);
        saveTable(HScores, "data/highScoreFile.csv");
        invHighScore = HScores.getInt(0, 1);
        text("HIGH SCORE", 250, 470);
        text(invHighScore, 250, 500);
      } else {
        invHighScore = HScores.getInt(0, 1);
        text("HIGH SCORE", 250, 470);
        text(invHighScore, 250, 500);
      }
    } else if (tempGameState == 3) {
      if (curScore > timHighScore) {
        HScores.setInt(0, 2, curScore);
        saveTable(HScores, "data/highScoreFile.csv");
        timHighScore = HScores.getInt(0, 2);
        text("HIGH SCORE", 250, 470);
        text(timHighScore, 250, 500);
      } else {
        timHighScore = HScores.getInt(0, 2);
        text("HIGH SCORE", 250, 470);
        text(timHighScore, 250, 500);
      }
    }
    shape(RESTART, buttonPosX, resBPosY, bSizeX, bSizeY);
    shape(MENU, buttonPosX, menBPosY, bSizeX, bSizeY);

    break;

  default:
    gameState = 0;

    break;
  }
}

void spawnAliens() {
  // Spawn Aliens
  //   ENUM set for level getlvl(), timers for generating aliens getT1(),getT2()
  //   and the number of aliens spawned at the same time getAit()

  for (levels level : levels.values()) {

    if (curLevel <= level.getlvl()) {
      if (millis() - initialTimeAdd > intervalAdd) {
        initialTimeAdd = millis();
        intervalAdd = int(random(level.getT1(), level.getT2()));
        for (int i = 0; i < level.getAit(); i++) {
          index = int(random(0, 4));
          Aliens.add(new alien(drawAliens[index], index, random(-100, width), random(-50, -200)));
        }
      }
    }
  }
}


// Function to Count Score and Display Score


void Score() {
  fill(255);
  text(curScore, 100, 50);
  text(curLevel, 400, 50);
  //arcade game

  if (gameState == 1 && curScore >= tempScore*3) {
    curLevel = curLevel + 1;
    tempScore = 2 * tempScore;
  }
}

// Function for Timer game mode

void gameTimer() {
  interval = 0;

  overlap = interval + (second()-prevtime);

  int timer = overlap;
  time = nf(timer, 2);
  if (timer == 30) {
    gameState = 5;
  }
  text(time, 250, 50);
}

//Function for Bullets (defender)
// called in all three modes 
void Bullet() {
  // Move and Render Bullets
  for (bullet currentBullet : bullets) {
    currentBullet.move();
    currentBullet.render();
  }

  // Explode and Remove bullets if hit the Edge 
  // for loop to check each bullet
  for (int i = bullets.size()-1; i>=0; i--) {
    bullet currentBullet = bullets.get(i);
    if (currentBullet.finished()) {
      bullets.remove(i);
    }
  }
}

//Functions for Invader game mode
void setGrid() {
  aG1.render();
  aG1.moveGrid();
  aG1.DropBullet();
  aG1.invHit();
  if (aG1.hitCount == 0) {
    aG1.resetGrid();
  }
}

void defHit() {
  // hit by a Yellow Bullets
  for (int i = aBullets.size()-1; i >= 0; i--) {
    float distance = dist(defenderOne.x, defenderOne.y, aBullets.get(i).x, aBullets.get(i).y);      
    if (distance < 30) {
      aBullets.get(i).life = -1;
      curScore--;
    }
  }

  //hit by a Red Bullets
  for (int j = msBullets.size()-1; j>=0; j--) {
    float distance = dist(defenderOne.x, defenderOne.y, msBullets.get(j).x, msBullets.get(j).y);
    if (distance < 20 && defHit == false) {
      msBullets.get(j).life = -1;
      defHit = true;
      break;
    }
  }

  if (defHit == true) {
    defLife = defLife - 1;
    defHit = false;
  }

  if (defLife == 18) {
    drawHearts[2] = null;
  }

  if (defLife == 9) {
    drawHearts[1] = null;
  }

  if (defLife == 0) {
    gameState = 5;
  }
}

//Function for ARCADE game mode
void arcadeGame() {

  // Move and Render Aliens
  for (alien currentAlien : Aliens) {
    currentAlien.move();
    currentAlien.render();
  }

  // Check the Aliens if hit the bottom
  // Call the gameOver function
  for (int i = Aliens.size()-1; i>=0; i--) {
    if (Aliens.get(i).y>=650) {
      gameState = 5;
    }
  }

  // Explode the Remove bullets and Aliens if Hit is detected 
  // 2 for loops to check the dist between bullet and an alien
  for (int i = bullets.size()-1; i >= 0; i--) {
    for (int j = Aliens.size()-1; j >= 0; j--) {
      float distance = dist(bullets.get(i).x, bullets.get(i).y, Aliens.get(j).x, Aliens.get(j).y);

      if (distance < 40) {
        bullets.get(i).life = -1;
        Aliens.remove(j);
        curScore = curScore + 2;
      }
    }
  }
}

// Explosion Manager gets called in all three gamemodes.
void ExplosionManager() {
  // for loop for Explosion sparks
  for (Explosion m : missiles) {
    m.decreaseLife();
    m.fly();
    m.render();
  }

  // remove dead sparks
  for (int i = missiles.size()-1; i>=0; i--) {
    Explosion m = (Explosion) missiles.get(i);
    if (m.dead) {
      missiles.remove(i);
    }
  }
  //Alien Bullets: Yellow
  // for loop for Explosion sparks
  for (Explosion Am : Amissiles) {
    Am.decreaseLife();
    Am.fly();
    Am.render();
  }

  // remove dead sparks
  for (int i = Amissiles.size()-1; i>=0; i--) {
    Explosion Am = (Explosion) Amissiles.get(i);
    if (Am.dead) {
      Amissiles.remove(i);
    }
  }

  //MotherShip Bullets: Red
  // for loop for Explosion sparks
  for (Explosion Sm : ShipMissiles) {
    Sm.decreaseLife();
    Sm.fly();
    Sm.render();
  }

  // remove dead sparks
  for (int i = ShipMissiles.size()-1; i>=0; i--) {
    Explosion Sm = (Explosion) ShipMissiles.get(i);
    if (Sm.dead) {
      ShipMissiles.remove(i);
    }
  }
}
