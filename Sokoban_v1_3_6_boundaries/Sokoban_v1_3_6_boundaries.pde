// declare a 2d array to hold Tile datatypes
//Board[][] board; 
Player player1;
Board board1;
Crate crate1;
                          

void setup() {

   size(800,600);
                  
  player1 = new Player(200, 100, 40, 40, color(255,0,0)); 
  board1 = new Board(0, 0, 40, 40, 10, 10, 200);
  crate1 = new Crate(width/2, height/2, 40, 40, color(0,0,255));
    
  }


void draw () {

  background(255);

    board1.drawBoard();
    player1.checkBoundaries();
    crate1.checkBoundaries();
    player1.displayTile();
    crate1.displayTile();
    player1.moveTileObject();
    
    crate1.displayTile();
    
   // player1.checkCollision(crate1);  
  
  
   if(player1.checkCollision(crate1)){
      crate1.moveTile(player1.getCollisionDirection());
    }
   
} 


 
/* 
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
*/     