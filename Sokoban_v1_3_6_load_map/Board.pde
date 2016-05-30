
class Board {                

  // int xPosition;          // declare variable for x position of rectangle
  // int yPosition;          // declare variable for y position of rectangle

  int tileWidth;          // declare variable for tile width
  int tileHeight;         // declare variable for tile height

  int boardCols;           // declare variable for number of board columns
  int boardRows;           // declare variable for number of board rows

  color boardColor;         // declare tileColour variable 
  Tile newBoard[][];

  int offset = 40;
  int initxPos = 200;
  int inityPos = 100;

  int boardWidth;
  int boardHeight;

  String[] lines;

  Board(int initWidth, int initHeight, int initCols, int initRows, color initBoardColor) {                                                                                                   

    // xPosition = initXPos;
    // yPosition = initYPos;

    tileWidth = initWidth;
    tileHeight = initHeight;

    boardCols = initCols;
    boardRows = initRows;

    boardColor = initBoardColor;

    newBoard = new Tile[boardCols][boardRows]; 
    loadTiles();

    lines = loadStrings("map.txt");
  }

  void loadTiles() {
    
    for(int i = 0; i < lines.length; i++){ 
      int[] pieces = int(split(lines[i], ';')); 
      lines = (Tile[]) append(tiles, new Tile(pieces[0], pieces[1], pieces[2], pieces[3]));
  } 





    for (int i=0; i < boardCols; i ++) {
      for (int j=0; j < boardRows; j ++) {

        // initialise each Tile object using the number of columns and rows stored in the array's  
        newBoard[i][j] = new Tile(initxPos+i*offset, inityPos+j*offset, tileWidth, tileHeight, boardColor);
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

  void drawBoard() {
    for (int i = 0; i < boardCols; i ++) {
      for (int j = 0; j < boardRows; j ++) {
        newBoard[i][j].displayTile();
      }
    }
  }

  void display()
  {
    if (boardColor == 0)
    {
      //new Player;
    }
    if (boardColor == 1)
    {
      //new Wall;
    }
    if (boardColor == 2)
    {
      //new Crate;
    }
    if (boardColor == 3)
    {
      //new Floor;
    }
  }



  int getboardWidth() { 
    boardWidth = initxPos + boardCols*tileWidth;
    return boardWidth;
  }

  int getboardHeight() { 
    boardHeight = inityPos + boardRows*tileHeight;
    return boardHeight;
  }

  int boardXpos() {
    return initxPos;
  }

  int boardYpos() {
    return inityPos;
  }

  float getTileWidth() {  
    return tileWidth;
  }

  float getTileHeight() {  
    return tileHeight;
  }
}