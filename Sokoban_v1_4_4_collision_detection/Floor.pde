class Floor extends Tile {
  
  color floorColor = color(255,255,204);
  
  Floor(float initxPosition, float inityPosition, float inittileWidth, float inittileHeight){
    
    super();
    xPosition = initxPosition;
    yPosition = inityPosition;

    tileWidth = inittileWidth;
    tileHeight = inittileHeight;

    tileColour = floorColor;
    strokeWeight(3);
 
   }
  
}
