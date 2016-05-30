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
   
   void displayTile() {      // create tile object (position, height/width, color etc) 

    //rectMode(CENTER);
    strokeWeight(2);
    stroke(0);

    fill(tileColour);
    rect(xPosition, yPosition, tileWidth, tileHeight);
  }
   
 
}
