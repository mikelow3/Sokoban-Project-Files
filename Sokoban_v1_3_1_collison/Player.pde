
class Player extends Tile {
  
  Player(float xPosition, float yPosition, float tileWidth, float tileHeight, color tileColour){
    
    super(xPosition, yPosition, tileWidth, tileHeight, tileColour);
     strokeWeight(3);
 
   }
  
}

  /*
   void checkBoundaries(){
     if (xPosition > width-tileWidth) {
      xPosition = width-tileWidth;
   }
   
    if (xPosition < tileWidth) {
      xPosition *=0;
   }
   
    if(yPosition > height-tileHeight) {
      yPosition = height-tileHeight;
      }
      
    if(yPosition < tileHeight) {
      yPosition *=0;
      }
    }
 */  

 


     
