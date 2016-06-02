class WinTile extends Tile {
  
   color winTileColor1 = color(255,153,153);
   color winTileColor2 = color(255,100,100);
   Boolean isColor;
     
  WinTile(float initxPosition, float inityPosition, float inittileWidth, float inittileHeight){
    
    super();
    xPosition = initxPosition;
    yPosition = inityPosition;

    tileWidth = inittileWidth;
    tileHeight = inittileHeight;

    tileColour = winTileColor1;
    strokeWeight(3);
    
    isColor = true;
    
 
   }
   
   void displayTile() {      // create tile object (position, height/width, color etc) 

    //rectMode(CENTER);
    strokeWeight(2);
    stroke(0);
    
       
    if (isColor == true) {
     fill(winTileColor1);
     isColor = false;
    }else{
    fill(winTileColor2);
     isColor = true;
    } 
    
    rect(xPosition, yPosition, tileWidth, tileHeight);
    }
   
 
}
