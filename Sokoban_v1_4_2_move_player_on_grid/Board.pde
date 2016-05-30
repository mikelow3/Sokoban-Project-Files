
class Board {                

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

  //color playerColor = color(0,0,255);
  //color wallColor = color(100);
  //color crateColor = color(0,255,0);
  //color floorColor = color(255,255,204);
  //color winTileColor = color(255,153,153);

  Player p1;
  int playerRow;
  int playerCol;

  int crateRow;
  int crateCol;

  boolean state;
  boolean currentState;

  String[] lines;

  //  Board(int initWidth, int initHeight, int initCols, int initRows, color initBoardColor) {                                                                                                   
  Board(int initWidth, int initHeight) {                                                                                                   

    // xPosition = initXPos;
    // yPosition = initYPos;

    tileWidth = initWidth;
    tileHeight = initHeight;

    lines = loadStrings("map.txt");
    // println(lines);
    buildBoard();

    loadTiles();
  }

  void buildBoard()
  {
    int cols = 0;
    int rows = 0;

    cols = lines.length;//number of columns in the map
    println("Number of Columns: " + cols);

    for (int i = 0; i < lines.length; i++) //runs once to determine cols and rows
    { 
      int[] pieces = int(split(lines[i], ',')); 
      rows = pieces.length; //number of rows in the map
      println("Number of Columns: " + rows);
      break;
    }

    boardCols = cols;
    boardRows = rows;

    newBoard = new Tile[boardCols][boardRows];
  }

  void loadTiles() {
    //  println(lines);
    for (int i = 0; i < lines.length; i++)
    {        

      
      int[] pieces = int(split(lines[i], ',')); 

      //println(pieces);      
      for (int j = 0; j < pieces.length; j++)
      {
        int value = pieces[j];
        //  println(value);
        if (value == 0)
        {
          //println(value);
          player1 = new Player(initxPos+j*offset, inityPos+i*offset, tileWidth, tileHeight);
          playerRow = i;
          // println(playerRow);
          playerCol = j;
          // println(playerCol);
          // Floor tile, idea is that player shall sit on top of board
          newBoard[i][j] = new Floor(initxPos+j*offset, inityPos+i*offset, tileWidth, tileHeight);
        }
        else if (value == 1)
        {
          newBoard[i][j] = new Wall(initxPos+j*offset, inityPos+i*offset, tileWidth, tileHeight);
        }
        else if (value == 2)
        {
          crate = new Crate(initxPos+j*offset, inityPos+i*offset, tileWidth, tileHeight);
          crateRow = i;
          //  println(crateRow);
          crateCol = j;
          //  println(crateCol);
          // Floor tile, idea is that crate shall sit on top of board
          newBoard[i][j] = new Floor(initxPos+j*offset, inityPos+i*offset, tileWidth, tileHeight);
        }

        else if (value == 3)
        {
          newBoard[i][j] = new WinTile(initxPos+j*offset, inityPos+i*offset, tileWidth, tileHeight);
        }

        else
        {
          newBoard[i][j] = new Floor(initxPos+j*offset, inityPos+i*offset, tileWidth, tileHeight);
        }
      } // End of loop j
    } // End of loop i
  }


  void drawBoard() {
    for (int i = 0; i < boardCols; i ++) {
      for (int j = 0; j < boardRows; j ++) {
        newBoard[i][j].displayTile();
      }
    }
    player1.displayTile();
    crate.displayTile();
  }


  Player getPlayer()
  {
    return player1;
  }

  Crate getCrate()
  {
    return crate;
  }


  void moveTileObject() {
    state = keyPressed;

    if (state != currentState) {
      if (keyPressed != false) {
        if (keyCode == UP) {

                      
          // Calculate new position for player (take postion and adjust for direction movement)        
          int tempi; 
          tempi = playerRow-1;
          int tempj;
          tempj = playerCol;

          // Get current max and min number of rows and cols of array 
          // Check that new pos does not go outwith the boundaries of the array
          // If they do, return          

          // Check if I am bumping into the crate

          // Call checkTilePosition
          int result;
          result=checkTilePosition(tempi, tempj);

          //adjust player based on return value, and then update current postion in this obj
          if (result == 0) {
            return;
          }
          else if (result== 1) {
            player1.setyPosition(player1.getyPosition() - tileHeight);
            playerRow=tempi;
            playerCol=tempj;
          }
          else if (result== 2) {
            player1.setyPosition(player1.getyPosition() - tileHeight);
            playerRow=tempi;
            playerCol=tempj;
          }
          else {
            return;
          }

          //  checkTilePosition(playerRow, playerCol);

          // If true adjust player x and y and then update current postion in this obj
          // player1.yPosition = player1.yPosition - tileHeight;
          // playerRow = i;
          //  playerCol = j;

          // If false do nothing

          // Moving foward add in collison detection, somehow!! 

          println("UP key pressed");
        } 

        else if (keyCode == DOWN) {
          player1.yPosition = player1.yPosition + tileHeight;
          println("DOWN key pressed");
        } 
        else if (keyCode == LEFT) {
          player1.xPosition = player1.xPosition - tileWidth;
          println("LEFT key pressed");
        } 
        else if (keyCode == RIGHT) {
          player1.xPosition = player1.xPosition + tileWidth;
          println("RIGHT key pressed");
        } 
        else {
          println("Another key pressed");
        }
      }
      currentState = state;
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

  int getTileWidth() {  
    return tileWidth;
  }

  int getTileHeight() {  
    return tileHeight;
  }


  int checkTilePosition(int i, int j) { //pass new player position relative to board array[i][j], check what tile object type player is moving to// 

    Tile tile = newBoard[i][j];

    if (tile instanceof Wall) {
      return 0;
    } 
    else if (tile instanceof Floor) {
      return 1;
    }
    else if (tile instanceof WinTile) {
      return 2;
    }
    else {
      return 0;
    }
  }
}
