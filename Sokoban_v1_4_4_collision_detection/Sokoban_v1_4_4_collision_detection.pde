// declare a 2d array to hold Tile datatypes
//Board[][] board; 
Player player1;
Board board1;
Crate crate;

                          

void setup() {

   size(800,600);
                  
  //player1 = new Player(0, 0, 40, 40); 
  //board1 = new Board(40, 40, 4, 8, 200);
   board1 = new Board(40, 40);
  
  //crate1 = new Crate(0, 0, 40, 40, 0);
   player1 = board1.getPlayer(); 
   crate = board1.getCrate();
    
    
    
  }


void draw () {

  background(255);

    board1.drawBoard();
    board1.moveTileObject();     
    
              
    
   // player1.moveTileObject();
   // player1.checkCollision(crate); 
      
     
    if(player1.checkCollision(crate)){
      crate.moveTile(player1.getCollisionDirection());
    }
   
} 
