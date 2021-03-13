// enum for the arcade game mode

enum levels {
  lvl1(1, 1, 500, 700), 
    lvl5(5, 1, 500, 650), 
    lvl10(10, 2, 500, 700), 
    lvl15(15, 2, 500, 750), 
    lvl20(20, 3, 600, 800), 
    lvl25(25, 4, 600, 800), 
    lvl30(30, 5, 600, 800), 
    lvl35(35, 6, 600, 750), 
    lvl40(40, 6, 600, 750), 
    lvl45(45, 7, 600, 700), 
    lvl50(50, 8, 600, 800);

  int level;
  int aItteration;
  int timer1;
  int timer2;

  levels(int lvl, int aIt, int tim1, int tim2) {
    level = lvl;
    aItteration = aIt;
    timer1 = tim1;
    timer2 = tim2;
  }

  int getlvl() {
    return level;
  }

  int getAit() {
    return aItteration;
  }

  int getT1() {
    return timer1;
  }

  int getT2() {
    return timer2;
  }
}
