
// Function for Game Mode Selection
void gameMode() {
  if (overArc(buttonPosX, arcBPosY, bSizeX, bSizeY)) {
    arcOver = true;
    invOver = false;
    timOver = false;
    resOver = false;
    menOver = false;
  } else if (overInv(buttonPosX, invBPosY, bSizeX, bSizeY)) {
    invOver = true;
    arcOver = false;
    timOver = false;
    resOver = false;
    menOver = false;
  } else if (overTim(buttonPosX, timBPosY, bSizeX, bSizeY)) {
    timOver = true;
    arcOver = false;
    invOver = false;
    resOver = false;
    menOver = false;
  } else if (overRes(buttonPosX, resBPosY, bSizeX, bSizeY)) {
    timOver = false;
    arcOver = false;
    invOver = false;
    resOver = true;
    menOver = false;
  } else if (overMen(buttonPosX, menBPosY, bSizeX, bSizeY)) {
    timOver = false;
    arcOver = false;
    invOver = false;
    resOver = false;
    menOver = true;
  }
}

void mousePressed() {
  //Mouse Event for Game Mode selection
  if (gameState ==0 && mouseButton == LEFT && arcOver) {
    gameState = 1;
    setup();
  }
  if (gameState ==0 && mouseButton == LEFT && invOver) {
    gameState = 2;
    setup();
  }
  if (gameState ==0 && mouseButton == LEFT && timOver) {
    gameState = 3;
    setup();
  }
  if (gameState ==5 && mouseButton == LEFT && resOver) {
    gameState = tempGameState;
    setup();
  }
  if (gameState ==5 && mouseButton == LEFT && menOver) {
    gameState = 0;
  }
}

boolean overArc(int buttonPosX, int arcBPosY, int bSizeX, int bSizeY) {
  if (mouseX >= buttonPosX && mouseX <= buttonPosX + bSizeX
    && mouseY >= arcBPosY && mouseY <= arcBPosY + bSizeY) {
    return true;
  } else {
    return false;
  }
}

boolean overInv(int buttonPosX, int invBPosY, int bSizeX, int bSizeY) {
  if (mouseX >= buttonPosX && mouseX <= buttonPosX + bSizeX
    && mouseY >= arcBPosY && mouseY <= invBPosY + bSizeY) {
    return true;
  } else {
    return false;
  }
}

boolean overTim(int buttonPosX, int timBPosY, int bSizeX, int bSizeY) {
  if (mouseX >= buttonPosX && mouseX <= buttonPosX + bSizeX
    && mouseY >= arcBPosY && mouseY <= timBPosY + bSizeY) {
    return true;
  } else {
    return false;
  }
}

boolean overRes(int buttonPosX, int resBPosY, int bSizeX, int bSizeY) {
  if (mouseX >= buttonPosX && mouseX <= buttonPosX + bSizeX
    && mouseY >= arcBPosY && mouseY <= resBPosY + bSizeY) {
    return true;
  } else {
    return false;
  }
}

boolean overMen(int buttonPosX, int menBPosY, int bSizeX, int bSizeY) {
  if (mouseX >= buttonPosX && mouseX <= buttonPosX + bSizeX
    && mouseY >= menBPosY && mouseY <= menBPosY + bSizeY) {
    return true;
  } else {
    return false;
  }
}
