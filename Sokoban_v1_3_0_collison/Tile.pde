class Tile {                

  float xPosition;          // declare variable for x position of rectangle
  float yPosition;          // declare variable for y position of rectangle

  float tileWidth;          // declare variable for tile width
  float tileHeight;         // declare variable for tile height

    color tileColour;         // declare tileColour variable 

  boolean buttonIsPressed = false; 
  boolean buttonIsReleased;


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
    if (keyPressed && key == CODED) {   // If it's a coded key
      if (keyCode == UP || keyCode == DOWN || keyCode == LEFT || keyCode == RIGHT) {
        buttonIsPressed = true;
      }
      else {
        buttonIsPressed = false;
      }
    }


    if (buttonIsPressed) {
      if (keyCode == UP) {

        yPosition -= tileHeight;
        println("UP key pressed");
      }
      else if (keyCode == DOWN) {
        yPosition += tileHeight;
        println("DOWN key pressed");
      }
      buttonIsPressed = false;
    }
  }

  /*

   
   buttonIsPressed = true; 
   yPosition -= tileHeight;
   println("UP key pressed");
   } 
   else if (keyCode == DOWN) {
   yPosition += tileHeight;
   println("DOWN key pressed");
   } 
   else if (keyCode == LEFT) {
   xPosition -= tileWidth;
   println("LEFT key pressed");
   } 
   else if (keyCode == RIGHT) {
   xPosition += tileWidth;
   println("RIGHT key pressed");
   }
   */


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
  
   public boolean checkCollision(Crate t1) {
     return true;


 /*
  public boolean checkCollision(Crate t1) { 
    if(xPosition + tileWidth >= t1.xPosition &&
      xPosition <= t1.xPosition + t1.tileWidth &&
      yPosition + tileWidth >= t1.yPosition &&
      yPosition <= t1.yPosition + t1.tileHeight){
        return false;
      }else{
      return true;
      }
      
      
    /*  
     else if(s1 instanceof Wall)
     {
     //rect to rect collision detection to be added
     }
     */
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

