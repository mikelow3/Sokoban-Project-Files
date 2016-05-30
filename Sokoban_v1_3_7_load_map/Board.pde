
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

  color playerColor = color(255, 0, 0);
  color wallColor = color(55);
  color crateColor = color(0,255,0);
  color floorColor = color(0,0,255);
  
  Player p1;

  String[] lines;

//  Board(int initWidth, int initHeight, int initCols, int initRows, color initBoardColor) {                                                                                                   
  Board(int initWidth, int initHeight) {                                                                                                   

    // xPosition = initXPos;
    // yPosition = initYPos;

    tileWidth = initWidth;
    tileHeight = initHeight;

    //boardCols = initCols;
    //boardRows = initRows;

    //boardColor = initBoardColor;

    //newBoard = new Tile[boardCols][boardRows]; 
    //loadTiles();

    lines = loadStrings("map.txt");
   // println(lines);
    buildContainer();
    
    loadTiles();
  }

  void buildContainer()
  {
    int cols = 0;
    int rows = 0;
    
    cols = lines.length;
    
    for (int i = 0; i < lines.length; i++)
    { 
         int[] pieces = int(split(lines[i], ',')); 
         rows = pieces.length;
         break;
    }
    
    boardCols = cols;
    boardRows = rows;
    
    newBoard = new Tile[boardCols][boardRows]; 
    
  }

  void loadTiles() {
  println(lines);
    for (int i = 0; i < lines.length; i++)
    { 
      
      
      
      int[] pieces = int(split(lines[i], ',')); 
      //lines = (Tile[]) append(tiles, new Tile(pieces[0], pieces[1], pieces[2], pieces[3]));
      println(pieces);
      for (int j = 0; j < pieces.length; j++)
      {
        int value = pieces[j];
        //  println(value);
        if (value == 1)
        {
        println(value);
//          p1 = new Player(initxPos+j*offset, inityPos+i*offset, tileWidth, tileHeight, playerColor);
//         newBoard[i][j] = p1;
          newBoard[i][j] = new Tile(initxPos+j*offset, inityPos+i*offset, tileWidth, tileHeight, playerColor);
          
        }
        else if (value == 2)
        {
          newBoard[i][j] = new Tile(initxPos+j*offset, inityPos+i*offset, tileWidth, tileHeight, wallColor);
        }
        else if (value == 3)
        {
          newBoard[i][j] = new Tile(initxPos+j*offset, inityPos+i*offset, tileWidth, tileHeight, crateColor);
        }
        else
        {
          newBoard[i][j] = new Tile(initxPos+j*offset, inityPos+i*offset, tileWidth, tileHeight, floorColor);
        }        
      } // End j  
    } // End i
    
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

  
  Player getPlayer()
  {
    return p1;
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

