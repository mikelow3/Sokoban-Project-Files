
class Crate extends Tile {

  color crateColor = color(0, 255, 0);  

  Crate(float initxPosition, float inityPosition, float inittileWidth, float inittileHeight) {

    super();
    xPosition = initxPosition;
    yPosition = inityPosition;

    tileWidth = inittileWidth;
    tileHeight = inittileHeight;

    tileColour = crateColor;
    strokeWeight(3);
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
             println("crate overlap");
             return true;}
             
             }
           }
           println("crate not overlapping with wall");
        }
        
        if (t instanceof WinTile)
        {
           if (keyCode == DOWN) {
           if(t.xPosition == xPosition)
             {
             if (yPosition + tileHeight >= t.yPosition + t.tileHeight && t.yPosition + t.tileHeight >= yPosition + tileHeight)  
             {
             println("crate overlaps wintile");
             return true;
           }
          }
         }
           
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
           println("crate not overlapping with wintile");
        }       
      }
   }
   return false;
   
}

}
