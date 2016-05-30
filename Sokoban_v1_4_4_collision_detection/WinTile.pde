class WinTile extends Tile {
  
   color winTileColor = color(255,153,153);
  
  WinTile(float initxPosition, float inityPosition, float inittileWidth, float inittileHeight){
    
    super();
    xPosition = initxPosition;
    yPosition = inityPosition;

    tileWidth = inittileWidth;
    tileHeight = inittileHeight;

    tileColour = winTileColor;
     strokeWeight(3);
 
   }
 
}
