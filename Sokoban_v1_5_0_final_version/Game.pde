/*
class Game {
  
  Button startGame; 
  Button exitLevel;
  Button resetLevel;
  Button nextLevel;
  
  Game(){
    
  //start menu
  startGame  = new Button(200, color(150,150,0), 0, 100, 425, 100, 50, "Start Game");
  exitLevel  = new Button(200, color(150,150,0), 0, 100, 425, 100, 50, "Main Menu");
  resetLevel = new Button(200, color(150,150,0), 0, 100, 425, 100, 50, "Reset Level");
  
  nextLevel  = new Button(200, color(150,150,0), 0, 100, 425, 100, 50, "Next Level"); 
  //only activated once current level is complete
  
  }
  
 void mainScreen_header() {                               
  rectMode(CENTER);
  textSize(40);
  fill(200);
  text("Sokoban", 500, 100);
  textAlign(CENTER); 
 }


void main_Screen() {
  background(200);
  
  state = 0;
  header();
  startGame.drawButton();
  startGame.overButton();
  startGame.pressedButton();
    if (startGame.pressedButton()) {
     state = 1;
    }
  }
 
  
  void level1() {
   background(200);
  
  state = 1;
  header();
  mainScreen.drawButton();
  mainScreen.overButton();
  mainScreen.pressedButton();
    if (exitLevel.pressedButton()) {
    state = 0; 
    }
   
}
  
  
 
  
  
}

*/