// declare a 2d array to hold Tile datatypes
Tile[][] board; 
Player player1;

// initialise global variables for the number of columns and rows required for the board
//int tilesOnBoard = 10;                             
int cols = 10;
int rows = 10;

// initialise global variables for tile width, height and tile colour
float tileW = 40;                             
float tileH = 40;

// declare varibales for board colour
int tileFiller = 200;
//int currentFiller = 0;

//float xPos;                                     
//float yPos;                                  

void setup() {

   size(400,400);
  // background(255);
  // initialise the array to hold Tile objects - number of columns and rows on the board
  board = new Tile[cols][rows];                  
  player1 = new Player(40, 40, 40, 40, 150); 
    
// nested for loop used to store number of columns and rows in the arrays 
// conditional statement to start first loop with white tile
    for (int i=0; i < cols; i ++) {
       for (int j=0; j < rows; j ++){
           
// initialise each Tile object using the number of columns and rows stored in the array's  
    board[i][j] = new Tile(i*40,j*40,tileW,tileH,tileFiller);   
       }                                         
  
    }
  }


void draw () {

  background(255);

  for (int i = 0; i < cols; i ++) {
    for (int j = 0; j < rows; j ++)
    board[i][j].displayTile();
    }
    
    player1.displayTile();
       
   // player1.movePlayer();
}
 
void keyPressed() {
  if (key == CODED) {
    if (keyCode == UP) {
      player1.yPosition -= 40;
      println("UP key pressed");
    } else if (keyCode == DOWN) {
      player1.yPosition += 40;
       println("DOWN key pressed");
    } else if (keyCode == LEFT) {
      player1.xPosition -= 40;
       println("LEFT key pressed");
    } else if (keyCode == RIGHT) {
      player1.xPosition += 40;
       println("RIGHT key pressed");
    }  
  } 
}
      