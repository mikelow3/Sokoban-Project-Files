class Wall extends Tile {
  
   color wallColor = color(100);
  
  Wall(float initxPosition, float inityPosition, float inittileWidth, float inittileHeight){
    
    super();
    xPosition = initxPosition;
    yPosition = inityPosition;

    tileWidth = inittileWidth;
    tileHeight = inittileHeight;

    tileColour = wallColor;
     strokeWeight(3);
 
   }
 
}