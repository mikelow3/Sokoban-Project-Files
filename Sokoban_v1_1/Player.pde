
class Player extends Tile {
  
  Player(float xPosition, float yPosition, float tileWidth, float tileHeight, color tileColour){
    
    super(xPosition, yPosition, tileWidth, tileHeight, tileColour);
     strokeWeight(2);
   //  boolean buttonIsPressed = false;
   //  boolean buttonIsReleased = true;
   }
  
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
  
   
  
 /* 
 void movePlayer() {
  if (keyPressed == true && key == CODED){   // If it's a coded key
  if (keyCode == UP) {
     yPosition -= 40;
     println("UP key pressed");}
   
  if (keyCode == DOWN) {
    yPosition += 40;
     println("DOWN key pressed");}
    
  if (keyCode == LEFT) {
     xPosition -= 40;
     println("UP key pressed");} 
    
  else if (keyCode == RIGHT) {
     xPosition += 40;
     println("RIGHT key pressed");}
          }  
         }
    }       
*/

}
  
 


     