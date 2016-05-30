class Tile {                

  float xPosition;          // declare variable for x position of rectangle
  float yPosition;          // declare variable for y position of rectangle

  float tileWidth;          // declare variable for tile width
  float tileHeight;         // declare variable for tile height

  color tileColour;         // declare tileColour variable 


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
