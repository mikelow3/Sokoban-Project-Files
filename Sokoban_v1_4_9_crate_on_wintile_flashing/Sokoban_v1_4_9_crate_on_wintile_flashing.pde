 
Player player1;
Board board1;
Crate crate;
                         

void setup() {

   size(800,600);
                  
   board1 = new Board(40, 40, "test_crate.txt");
   player1 = board1.getPlayer(); 
   crate = board1.getCrate();
     
 
    
  }


void draw () {

  background(200);

    board1.drawBoard();    
    board1.moveTileObject();
   
} 
