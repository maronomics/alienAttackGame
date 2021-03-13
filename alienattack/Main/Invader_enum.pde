// enum for the invaders game mode

enum invLevel {

  lvl1(1, 100, 2, -2, 4), 
    lvl3(3, 130, 2.5, -2.5, 5), 
    lvl6(6, 160, 3, -3, 6), 
    lvl9(9, 190, 3.5, -3.5, 7), 
    lvl12(12, 220, 3.5, -3.5, 8), 
    lvl17(17, 240, 4, -4, 9), 
    lvl21(21, 260, 4.5, -4.5, 10), 
    lvl27(27, 280, 4.5, -4.5, 10), 
    lvl33(33, 300, 5, -5, 11), 
    lvl39(39, 320, 5.5, -5.5, 12), 
    lvl45(45, 335, 6, -6, 13), 
    lvl50(50, 350, 6.5, -6.5, 15);


  int level;
  int deltaY;
  float sxt1;
  float sxt2;
  float syt;


  invLevel(int lvl, int dY, float sx1, float sx2, float sy) {
    level = lvl;
    deltaY = dY;
    sxt1 = sx1;
    sxt2 = sx2;
    syt = sy;
  }

  int getlvl() {
    return level;
  }

  int getdY() {
    return deltaY;
  }

  float getSx1() {
    return sxt1;
  }

  float getSx2() {
    return sxt2;
  }

  float getSy() {
    return syt;
  }
}
