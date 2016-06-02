
class Board {                

  int tileWidth;          // declare variable for tile width
  int tileHeight;         // declare variable for tile height

  int boardCols;           // declare variable for number of board columns
  int boardRows;           // declare variable for number of board rows

  color boardColor;         // declare tileColour variable 
  Tile newBoard[][];        //Tile array

  int offset = 40;          //offset tiles so they are not drawn on top of each other
  int initxPos = 240;       //initial board xpos
  int inityPos = 150;       //initial board ypos

  int boardWidth;
  int boardHeight;

  Player p1;
  int playerRow;
  int playerCol;

  int crateRow;
  int crateCol;

  boolean state;            //mouse 
  boolean currentState;

  String[] lines;

  //  Board(int initWidth, int initHeight, int initCols, int initRows, color initBoardColor) {                                                                                                   
  Board(int initWidth, int initHeight, String filename) {                                                                                                   
  
    // xPosition = initXPos;
    // yPosition = initYPos;
  
  //will not run the buildBoard or loadTiles methods if exception is found with loading level file//
  try{
    tileWidth = initWidth;
    tileHeight = initHeight;

    //lines = loadStrings("test_crate.txt");
    lines = loadStrings(filename);
    // println(lines);
    buildBoard(); 

    loadTiles();
  }
  catch (NullPointerException errorLoadingRectanglePositionsInSetup) {
  println("File could not be loaded");
    } 
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
      println("Number of Rows: " + rows);
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
      // println(maxRows);
      int[] pieces = int(split(lines[i], ',')); 
      //println(pieces);  
      
      for (int j = 0; j < pieces.length; j++)
      {        
        //println(maxCols);
        int value = pieces[j];        
        //  println(value);
        
        if (value == 0)
        {
          //println(value);
          player1 = new Player(initxPos+j*offset, inityPos+i*offset, tileWidth, tileHeight);
          playerRow = i;
          // println(playerRow);
          playerCol = j;
         //  println(playerCol);
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
    
    // If winner draw message, otherwise do nothing
      if (crate.getWinState() == true){
      textSize(32);
      fill(55);
      textAlign(CENTER);
      text("Level Complete",400,75); 
      }
      
    
  }


  Player getPlayer()
  {
    return player1;
  }

  Crate getCrate()
  {
    return crate;
  }

  //method controls objects moving on the board//
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

          //prevent player from moving off board
          int maxRows = newBoard.length;
         // int maxCols = newBoard[0].length;                 
          if (tempi < 0 || tempi > maxRows){
            return;
         }                    
          
          // Check crate collison
          if(player1.checkCollision(crate)){      
            println("Player and Crate Colliding");
            
             //Tile[][] boardMap = board1.getMap();
            boolean clash = crate.checkCollision(newBoard);
          //crate is up against a wall object, cannot move
          if(clash == true)
            {  
             println("Crate cannot move");
              return;
            }
            else
            {
              //crate can now move, no collision
              crate.moveTile(player1.getCollisionDirection());
              println("Crate moved");
            }
        }                
          
          // Call checkTilePosition method
          int result;
          result=checkTilePosition(tempi, tempj);

          //adjust player based on return value, and then update current postion in this obj
          if (result == 0) { //if Wall object do nothing
           println("Player hits a wall");
           return;          
          }
          else if (result== 1) { //if Floor move player
            player1.setyPosition(player1.getyPosition() - tileHeight);
            playerRow=tempi;
            playerCol=tempj;
            println("board move player");
          }
          else if (result== 2) { //if WinTile move player
            player1.setyPosition(player1.getyPosition() - tileHeight);
            playerRow=tempi;
            playerCol=tempj;
            println("Player is on the win tile");
          }
          else {
            return;
          }       
        } 

        else if (keyCode == DOWN) {          
          // Calculate new position for player (take postion and adjust for direction movement)        
          int tempi; 
          tempi = playerRow+1;
          int tempj;
          tempj = playerCol;

           
          //prevent player from moving off board
          int maxRows = newBoard.length;
         // int maxCols = newBoard[0].length;                 
          if (tempi < 0 || tempi > maxRows-1){
            return;
         }
          
          // Check create collison
          if(player1.checkCollision(crate)){
      
            println("Player and Crate Colliding");
            
             //Tile[][] boardMap = board1.getMap();
            boolean clash = crate.checkCollision(newBoard);
          //crate is up against a wall object, cannot move
          if(clash == true)
            {  
             println("Crate cannot move");
              return;
            }
            else
            {
              crate.moveTile(player1.getCollisionDirection());
              println("Crate moved");           
              
            }
        }                
          
          // Call checkTilePosition
          int result;
          result=checkTilePosition(tempi, tempj);

          //adjust player based on return value, and then update current postion in this obj
          if (result == 0) { //if Wall object do nothing
            return;
          }
          else if (result== 1) { //if Floor move player
            player1.setyPosition(player1.getyPosition() + tileHeight);
            playerRow=tempi;
            playerCol=tempj;
          }
          else if (result== 2) { //if WinTile move player
            player1.setyPosition(player1.getyPosition() + tileHeight);
            playerRow=tempi;
            playerCol=tempj;
          }
          else {
            return;
          }                 
        //  println("DOWN key pressed");
        } 
        
        
        else if (keyCode == LEFT) {
          // Calculate new position for player (take postion and adjust for direction movement)        
          int tempi; 
          tempi = playerRow;
          int tempj;
          tempj = playerCol-1;

          //prevent player from moving off board
         // int maxRows = newBoard.length;
          int maxCols = newBoard[0].length;                 
          if (tempj < 0 || tempj > maxCols-1){
            return;
         }   
         
         // Check create collison
          if(player1.checkCollision(crate)){
      
            println("Player and Crate Colliding");
            
             //Tile[][] boardMap = board1.getMap();
            boolean clash = crate.checkCollision(newBoard);
          //crate is up against a wall object, cannot move
          if(clash == true)
            {  
             println("Crate cannot move");
              return;
            }
            else
            {
              crate.moveTile(player1.getCollisionDirection());
              
              println("Crate moved");
            }
        }                         

          // Call checkTilePosition
          int result;
          result=checkTilePosition(tempi, tempj);

          //adjust player based on return value, and then update current postion in this obj
          if (result == 0) { //if Wall object do nothing
            return;
          }
          else if (result== 1) { //if Floor move player
            player1.setxPosition(player1.getxPosition() - tileHeight);
            playerRow=tempi;
            playerCol=tempj;
          }
          else if (result== 2) { //if WinTile move player
            player1.setxPosition(player1.getxPosition() - tileHeight);
            playerRow=tempi;
            playerCol=tempj;
          }
          else {
            return;
          }       
         // player1.xPosition = player1.xPosition - tileWidth;
         // println("LEFT key pressed");
        } 
        
        
        
        else if (keyCode == RIGHT) {
          // Calculate new position for player (take postion and adjust for direction movement)        
          int tempi; 
          tempi = playerRow;
          int tempj;
          tempj = playerCol+1;

           //prevent player from moving off board
         // int maxRows = newBoard.length;
          int maxCols = newBoard[0].length;                 
          if (tempj < 0 || tempj > maxCols-1){
            return;
         }  
         
         // Check create collison
          if(player1.checkCollision(crate)){
      
            println("Player and Crate Colliding");
            
             //Tile[][] boardMap = board1.getMap();
            boolean clash = crate.checkCollision(newBoard);
          //crate is up against a wall object, cannot move
          if(clash == true)
            {  
             println("Crate cannot move");
              return;
            }
            else
            {
              crate.moveTile(player1.getCollisionDirection());
              println("Crate moved");
            }
        }                

          // Call checkTilePosition
          int result;
          result=checkTilePosition(tempi, tempj);

          //adjust player based on return value, and then update current postion in this obj
          if (result == 0) { //if Wall object do nothing
            return;
          }
          else if (result== 1) { //if Floor move player
            player1.setxPosition(player1.getxPosition() + tileHeight);
            playerRow=tempi;
            playerCol=tempj;
          }
          else if (result== 2) { //if WinTile move player
            player1.setxPosition(player1.getxPosition() + tileHeight);
            playerRow=tempi;
            playerCol=tempj;
            println("your on the win tile");
          }
          else {
            return;
          }          
          //player1.xPosition = player1.xPosition + tileWidth;
         // println("RIGHT key pressed");
        }
        
        else {
          println("Another key pressed");
        }
      }
       
           
      
      currentState = state;
    }
  }

  //pass new player position relative to board array[i][j], check what tile object type player is moving to// 
  int checkTilePosition(int i, int j) { 

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
 
  //return Tile array for player/crate collision detection
  Tile [][] getMap() {
    return newBoard;
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


}
