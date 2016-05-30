
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
  
  Boolean checkCollision(Crate t1) { //overloaded method//pass player a crate object to tell if player is bumping a crate//
   
      if (xPosition + tileWidth/2 >= t1.xPosition &&   //checks rect to rect overlap
      xPosition <= t1.xPosition + t1.tileWidth/2 &&
      yPosition + tileHeight/2 >= t1.yPosition &&
      yPosition <= t1.yPosition + t1.tileHeight/2) {

        if (keyCode == LEFT) { //assigns side of impact to variable side 
        side="left";  
        println("player hit from right side");     
      } else if (keyCode == RIGHT) {
        side="right";
        println("player hit from left side");
      } else if (keyCode == UP) {
        side="up";
        println("player hit from bottom");
      } else if (keyCode == DOWN) {
        side="down";
        println("player hit from top");
      }
      return true;
      }
    return false;
   
  }
  
  
}

 


     
