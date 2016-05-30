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


  Tile(float initialXPos, float initialYPos, float initialWidth, float initialHeight, color initialTileColour) {     // class constructor and arguments for creating the 
    // tile object as local variables

    xPosition = initialXPos;
    yPosition = initialYPos;

    tileWidth = initialWidth;
    tileHeight = initialHeight;

    tileColour = initialTileColour;
  }

  void displayTile() {      // create tile object (position, height/width, color etc) 

    //rectMode(CENTER);
    strokeWeight(2);
    stroke(0);

    fill(tileColour);
    rect(xPosition, yPosition, tileWidth, tileHeight);
  }


  void moveTileObject() {
    state = keyPressed;

    if (state != currentState) {
      if (keyPressed != false) {
        if (keyCode == UP) {
          yPosition = yPosition - tileHeight;
          println("UP key pressed");
        } else if (keyCode == DOWN) {
          yPosition = yPosition + tileHeight;
          println("DOWN key pressed");
        } else if (keyCode == LEFT) {
          xPosition = xPosition - tileWidth;
          println("LEFT key pressed");
        } else if (keyCode == RIGHT) {
          xPosition = xPosition + tileWidth;
          println("RIGHT key pressed");
        } else {
          println("Another key pressed");
        }
      }
      currentState = state;
    }
  }


  void checkBoundaries() {
    if (xPosition > width-tileWidth) {
      xPosition = width-tileWidth;
    }
    if (xPosition < tileWidth) {
      xPosition *=0;
    }
    if (yPosition > height-tileHeight) {
      yPosition = height-tileHeight;
    }
    if (yPosition < tileHeight) {
      yPosition *=0;
    }
  }
  
   

 
  boolean checkCollision(Crate t1) { 
    if(xPosition + tileWidth >= t1.xPosition &&
      xPosition <= t1.xPosition + t1.tileWidth &&
      yPosition + tileWidth >= t1.yPosition &&
      yPosition <= t1.yPosition + t1.tileHeight){
        println("collision");
        return true;
        }else{
        println("no collision");
        return false;
      }
  }
      
    
      
    //boolean  checkCollision(Wall t1){
    //}
      
    


  float getxPosition() {  
    return xPosition;
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

