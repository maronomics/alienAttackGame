/*
1474 lines
 
 SPLASH SCREEN
 -- Game Logo
 -- Animated background
 -- Animated Ships (not done yet)
 -- Animated Defender (not done yet)
 -- Add method to add and remove the Alien Ships and Defender from Splash after gameState change
 -- Buttons For GAME MODES
 -- LEADER BOARD button
 
 GAME MODE: ARCADE
 
 -- Untimed Game 
 -- Multiple Alien Ships drop from top
 -- Random coloured Alien Ships
 -- Score goes up with the hit
 -- Game ends with a miss
 -- Score displayed after the game end
 -- Level goes up with the number of Alien Ships hit
 -- Game difficulty goes up with the number of levels(more Alien Ships Spawned & faster)
 
 
 GAME MODE: INVADERS
 
 -- Untimed Game
 -- 2d Array of Alien Ships 5x5 
 -- new move method for these Alien Ships
 -- random Coloured Alien Ships
 -- reSpawn after all the Alien Ships in Array are dead
 -- Shot the defender -points with yellow bullets from invaders.
 
 -- 1 Big Alien Ship hover at the top
 -- new class to add this ship
 -- new design for this ship
 -- new move method(hover over the alien grid)
 -- Shot the defender, red bullets - defender life with hit
 -- when defender directly under or 15+left and 15+right
 -- Score goes up ten points on hit
 -- Never Dies
 
 -- Defender has 3 lives
 -- shots fly slower
 -- counter for lives
 -- heart shape images to display lives
 
 -- Score goes up 5 points by hitting the invaders
 
 -- Game ends 
 
 -- if all the defender lives are gone
 -- invaders reach the defender
 
 -- Score displayed after game end
 
 
 GAME MODE: TIMER
 
 -- 30 Second Game  --- use swing timer in eclipse(not done yet)
 -- Multiple Alien Ships drop from top
 -- Random coloured Alien Ships
 -- Score goes up with hit
 -- Game ends with a miss
 -- Game ends after 30 seconds
 -- Score displayed after game end
 
 
 GAME OVER SCREEN or function?
 -- Display current Score
 -- Display highscore
 -- Button to go back to splash Screen
 or restart current mode game 
 */




//// UNUSED CODE FOR SPAWNING ALIENS
//// Enum Sets implemented instead of if else statements
/*  
 if(arcLevel <= 5){
 if(millis() - initialTimeAdd > intervalAdd){
 initialTimeAdd = millis();
 intervalAdd = int(random(600,800));
 index = int(random(0,4));
 Aliens.add(new alien(drawAliens[index], index, random(width),0));
 }
 }
 else if(arcLevel <=10){
 if(millis() - initialTimeAdd > intervalAdd){
 initialTimeAdd = millis();
 intervalAdd = int(random(600,800));
 for(int i = 0; i < 2; i++){
 index = int(random(0,4));
 Aliens.add(new alien(drawAliens[index], index, random(width),0));
 }
 }      
 }
 else if(arcLevel <=15){
 if(millis() - initialTimeAdd > intervalAdd){
 initialTimeAdd = millis();
 intervalAdd = int(random(800,1000));
 for(int i =0; i < 3; i++){
 index = int(random(0,4));
 Aliens.add(new alien(drawAliens[index], index, random(width),0));
 }
 }      
 }
 else if(arcLevel <=25){
 if(millis() - initialTimeAdd > intervalAdd){
 initialTimeAdd = millis();
 intervalAdd = int(random(1000,1200));
 for(int i =0; i < 4; i++){
 index = int(random(0,4));
 Aliens.add(new alien(drawAliens[index], index, random(width),0));
 }
 }      
 }
 else if(arcLevel > 25){
 if(millis() - initialTimeAdd > intervalAdd){
 initialTimeAdd = millis();
 intervalAdd = int(random(1000,1200));
 for(int i =0; i < 6; i++){
 index = int(random(0,4));
 Aliens.add(new alien(drawAliens[index], index, random(width),0));
 }
 }      
 } 
 */
