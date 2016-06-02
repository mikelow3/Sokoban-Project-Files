class WinTile extends Tile {
  
   color winTileColor1 = color(255,153,153);
   color winTileColor2 = color(100,100,100);
   Boolean isColor;
   int counter; //declare counter for switching wintile color
     
  WinTile(float initxPosition, float inityPosition, float inittileWidth, float inittileHeight){
    
    super();
    xPosition = initxPosition;
    yPosition = inityPosition;

    tileWidth = inittileWidth;
    tileHeight = inittileHeight;

    tileColour = winTileColor1;
    strokeWeight(3);
    
    isColor = true;
    counter = 0; //initialise counter at 0
 
   }
   
   void displayTile() {      // create tile object (position, height/width, color etc) 

    //rectMode(CENTER);
    strokeWeight(2);
    stroke(0);
    
    counter = counter + 1; //increment counter by 1
     if (counter == 15){ 
       counter = 0; //reset the counter
       if (isColor == true) //if counter equals 10 then toggle color by boolean value
       isColor = false;
     
     else
       isColor = true;
     }
       
    if (isColor == true) {
     fill(winTileColor1);
   //  isColor = false;
    }else{
    fill(winTileColor2);
   //  isColor = true;
    } 
    
    rect(xPosition, yPosition, tileWidth, tileHeight);
    }
   
 
}
