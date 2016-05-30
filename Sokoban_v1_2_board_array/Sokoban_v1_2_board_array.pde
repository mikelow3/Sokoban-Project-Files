// declare a 2d array to hold Tile datatypes
//Board[][] board; 
Player player1;
Board board1;
                          

void setup() {

   size(400,400);
                  
  player1 = new Player(40, 40, 40, 40, 150); 
  board1 = new Board(0, 0, 40, 40, 10, 10, 200);
    
  }


void draw () {

  background(255);

    board1.drawBoard();
    player1.displayTile();
    player1.checkBoundaries(); 
     
   // player1.movePlayer();
}
 
void keyPressed() {
  if (key == CODED) {
    if (keyCode == UP) {
      player1.yPosition -= player1.getHeight();
      println("UP key pressed");
    } else if (keyCode == DOWN) {
      player1.yPosition += player1.getHeight();
       println("DOWN key pressed");
    } else if (keyCode == LEFT) {
      player1.xPosition -= player1.getWidth();
       println("LEFT key pressed");
    } else if (keyCode == RIGHT) {
      player1.xPosition += player1.getWidth();
       println("RIGHT key pressed");
    }  
  } 
}
      
