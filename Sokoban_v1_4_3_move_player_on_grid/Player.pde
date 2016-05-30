
class Player extends Tile {
  
 
  color playerColor = color(0,0,255);
  
  Player(float initxPosition, float inityPosition, float inittileWidth, float inittileHeight){
    
    super();
    xPosition = initxPosition;
    yPosition = inityPosition;

    tileWidth = inittileWidth;
    tileHeight = inittileHeight;

    tileColour = playerColor;
    strokeWeight(3);
     
     
     
   
   }
  
  /*
    int getMyRow()
    {
      return myRow;
    }
    
    void setMyRow(int newRow)
    {
      myRow = newRow;
    }
  */
 
 /*
  float getplayerxPosition() {  
    return xPosition;
  }

  float getplayeryPosition() {  
    return yPosition;
  }

  void setplayeryPosition(float ypos) {  
    yPosition = ypos;
  }


  float getplayerWidth() {  
    return tileWidth;
  }

  float getplayerHeight() {  
    return tileHeight;
  }
 */ 
  
}

 


     