
void keyPressed() {
  // Move Ship Left and Right
  if (keyCode==LEFT) {
    defenderOne.move(moveLeft=true, moveRight=false);
  }
  if (keyCode==RIGHT) {
    defenderOne.move(moveLeft=false, moveRight=true);
  }
  // Space to fire bullets from ship
  if (keyCode==' ') {
    defenderOne.fire();
  }
}


void keyReleased() {
  // Stop moving the Ship
  if (keyCode==LEFT) {
    defenderOne.move(moveLeft=false, moveRight=false);
  }
  if (keyCode==RIGHT) {
    defenderOne.move(moveLeft=false, moveRight=false);
  }
}
