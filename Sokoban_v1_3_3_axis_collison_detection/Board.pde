
class Board {                

  float xPosition;          // declare variable for x position of rectangle
  float yPosition;          // declare variable for y position of rectangle

  float boardWidth;          // declare variable for tile width
  float boardHeight;         // declare variable for tile height

  int boardCols;           // declare variable for number of board columns
  int boardRows;           // declare variable for number of board rows
  
  color boardColor;         // declare tileColour variable 
  Tile newBoard[][];
  
  int offset = 40;

  Board(float initXPos, float initYPos, float initWidth, float initHeight, int initCols, int initRows, color initColor) {     
                                                                                                            

    xPosition = initXPos;
    yPosition = initYPos;

    boardWidth = initWidth;
    boardHeight = initHeight;
    
    boardCols = initCols;
    boardRows = initRows;
         
    boardColor = initColor;
    
    newBoard = new Tile[boardCols][boardRows]; 
    loadTiles();
  }

  void loadTiles() {
   for (int i=0; i < boardCols; i ++) {
       for (int j=0; j < boardRows; j ++){
           
  // initialise each Tile object using the number of columns and rows stored in the array's  
   newBoard[i][j] = new Tile(i*offset,j*offset,boardWidth,boardHeight,boardColor);   
      }                                         
     } 
    
  }

/*
  void displayBoard() {      // create board object (position, height/width, color etc) 
    
    //rectMode(CENTER);
    strokeWeight(2);
    stroke(0);
    fill(boardColor);
    rect(xPosition, yPosition, boardWidth, boardHeight);
  }
*/
  
   void drawBoard(){
      for (int i = 0; i < boardCols; i ++) {
        for (int j = 0; j < boardRows; j ++){
          newBoard[i][j].displayTile();
          }
       }
    }


     float getxPosition() {  
      return xPosition;
     }
    
    float getyPosition() {  
      return yPosition;
     }

    float getWidth() {  
      return boardWidth;
     }
     
    float getHeight() {  
      return boardHeight;
     }
  }
  
 