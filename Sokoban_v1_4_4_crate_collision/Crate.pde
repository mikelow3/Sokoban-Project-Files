
class Crate extends Tile {
  
  color crateColor = color(0,255,0);  
  
  Crate(float initxPosition, float inityPosition, float inittileWidth, float inittileHeight){
    
    super();
    xPosition = initxPosition;
    yPosition = inityPosition;

    tileWidth = inittileWidth;
    tileHeight = inittileHeight;

    tileColour = crateColor;
    strokeWeight(3);
   
   }
    
 
 
  }
  
  