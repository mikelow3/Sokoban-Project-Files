class Tile {                

  float xPosition;          // declare variable for x position of rectangle
  float yPosition;          // declare variable for y position of rectangle

  float tileWidth;          // declare variable for tile width
  float tileHeight;         // declare variable for tile height

  color tileColour;         // declare tileColour variable 

  // boolean buttonIsPressed = false; 
  // boolean buttonIsReleased = false;
  boolean state;
  boolean currentState;
  String side;
  String collison;

/*
  Tile(float initialXPos, float initialYPos, float initialWidth, float initialHeight, color initialTileColour) {    // class constructor and arguments for creating the 
    // tile object as local variables

    xPosition = initialXPos;
    yPosition = initialYPos;

    tileWidth = initialWidth;
    tileHeight = initialHeight;

    tileColour = initialTileColour;
  }
 */

  Tile() {
   xPosition = 0;
   yPosition = 0;         

   tileWidth = 0;         
   tileHeight = 0;         

   tileColour = 0;        
  }

  void displayTile() {      // create tile object (position, height/width, color etc) 

    //rectMode(CENTER);
    strokeWeight(2);
    stroke(0);

    fill(tileColour);
    rect(xPosition, yPosition, tileWidth, tileHeight);
  }


  Boolean checkCollision(Crate t1) { 
    if (xPosition + tileWidth/2 >= t1.xPosition &&   //checks rect to rect overlap
      xPosition <= t1.xPosition + t1.tileWidth/2 &&
      yPosition + tileHeight/2 >= t1.yPosition &&
      yPosition <= t1.yPosition + t1.tileHeight/2) {

        if (keyCode == LEFT) { //assigns side of impact (x or y) to variable side 
        //hit from left side
        side="left";
        println(side);
      } else if (keyCode == RIGHT) {
        //hit from right side
        side="right";
        println(side);
      } else if (keyCode == UP) {
        //hit from bottom
        side="up";
        println(side);
      } else if (keyCode == DOWN) {
        //hit from top
        side="down";
        println(side);
      }
      return true;
      }
    return false;
  }
 


  void moveTile(String side) {
    if (side == "left") {
      xPosition = xPosition - tileWidth;
    }
    if (side == "right") {
      xPosition = xPosition + tileWidth;
    }
    if (side == "up") {
      yPosition = yPosition - tileHeight;
    }
    if (side == "down"){
      yPosition = yPosition + tileHeight;
    }
   // println(side);
  }

  String getCollisionDirection() {
    return side;
  }



  //boolean  checkCollision(Wall t1){
  //}


void setxPosition(float xpos) {  
    xPosition = xpos;
  }

  float getxPosition() {  
    return xPosition;
  }
  
  void setyPosition(float ypos) {  
    yPosition = ypos;
  }

  float getyPosition() {  
    return yPosition;
  }

  float getWidth() {  
    return tileWidth;
  }

  float getHeight() {  
    return tileHeight;
  }

  
}