
class Crate extends Tile {

  color crateColor = color(0, 255, 0);  

  //variable to hold win state
  Boolean winState;


  Crate(float initxPosition, float inityPosition, float inittileWidth, float inittileHeight) {

    super();
    xPosition = initxPosition;
    yPosition = inityPosition;

    tileWidth = inittileWidth;
    tileHeight = inittileHeight;

    tileColour = crateColor;
    strokeWeight(3);
    winState = false;
  }

  
  //get win state, either true or false
  Boolean getWinState(){
   return winState; 
  }


 //method for checking crate object colliding with walls
  boolean  checkCollision(Tile[][] myMap) { //passing by reference//overloaded method//

    for (int i=0; i< myMap.length; i++)
    {
      Tile [] temptile = myMap[i];

      for (int j=0; j< temptile.length; j++)
      {
        Tile t = temptile[j];
        println(i+" : " + j);
        
        //check when crate overlaps a wall  
        if (t instanceof Wall)
        {
         
           if (keyCode == DOWN) {
             if(t.xPosition == xPosition)
             {
             if (t.yPosition >= yPosition && yPosition + tileHeight >= t.yPosition)  
             {
             println("crate overlap with wall");
             return true;}
             
             }
           }
           
            if (keyCode == UP) {
             if(t.xPosition == xPosition)
             {
             if (t.yPosition + tileHeight >= yPosition && yPosition >= t.yPosition + t.tileHeight)  
             {
             println("crate overlap with wall");
             return true;}
             
             }
           }
           
           if (keyCode == LEFT) {
             if(t.yPosition == yPosition)
             {
             if (t.xPosition + t.tileWidth >= xPosition && xPosition + tileWidth >= t.xPosition)  
             {
             println("crate overlap wall");
             return true;}
             
             }
           }
           
           if (keyCode == RIGHT) {
             if(t.yPosition == yPosition)
             {
             if (t.xPosition >= xPosition && xPosition + tileWidth >= t.xPosition)  
             {
             println("crate overlap wall");
             return true;}
             
             }
           }
           println("crate not overlapping with wall");
        }
        
        //check when crate is pushed onto the wintile//
        if (t instanceof WinTile)
        {
            //this stops the crate moving off the wintile for all key strokes
           if(xPosition == t.xPosition && yPosition == t.yPosition){
             println("crate on top of wintile");
             return true;             
           }
           
           // Rebuild this using logic below and if overlap set win state true, otherwise set false
           
           // This code shall check for movement onto wintile and shall set the winner flag but not return true to block the move
           
                
          if (keyCode == DOWN) {
           if(t.xPosition == xPosition)
             {
             if (t.yPosition >= yPosition && yPosition + tileHeight >= t.yPosition)            
             {
             println("crate overlaps wintile"); 
             winState = true;       
              }
             }
           }
         
           /*
           
            if (keyCode == UP) {
             if(t.xPosition == xPosition)
             {
             if (yPosition - tileHeight >= t.yPosition - t.tileHeight && t.yPosition - t.tileHeight >= yPosition - tileHeight)  
             {
             println("crate overlaps wintile");
             return true;
           }
          }
         }
           
           if (keyCode == LEFT) {
             if(t.yPosition == yPosition)
             {
             if (xPosition + t.tileWidth >= t.xPosition + t.tileHeight && t.xPosition + t.tileWidth >= xPosition + tileWidth)  
             {
             println("crate overlap with wintile");
             return true;
           }             
          }
         }
           
           if (keyCode == RIGHT) {
             if(t.yPosition == yPosition)
             {
             if (xPosition - t.tileWidth >= t.xPosition - t.tileHeight && t.xPosition - t.tileWidth >= xPosition - tileWidth)  
             {
             println("crate overlap with wintile");
             return true;
           }            
          }
         }
        */ 
        
           println("crate not overlapping with wintile");
        }       
      }
   }
   return false;
   
}

}
