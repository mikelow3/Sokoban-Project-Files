
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
    
    /* 
    if(player1.checkCollision(crate)){
      
       Tile[][] boardMap = board1.getMap();
      boolean clash = crate.checkCollision(boardMap);
      //crate is up against a wall object, cannot move
      if(clash == false)
        {  
      println("moving both player and crate");
      //else player can move the crate
       board1.moveTileObject();
      crate.moveTile(player1.getCollisionDirection());
     // board1.moveTileObject(); 
        }
     else{
     println("not moving anything");
     }     
    }
    else{
      */
   board1.moveTileObject();
  
 // println("only moving player"); 
    //}
} 
