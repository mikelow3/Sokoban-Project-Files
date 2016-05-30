
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
  
  
}

 


     
