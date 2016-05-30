
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
  
  Boolean checkCollision(Crate t1) { //overridden method//pass player a crate object to tell if player is bumping a crate
    
       Boolean myResult = checkCollision(t1);  
        return myResult;
      
      /*
      if (xPosition + tileWidth/2 >= t1.xPosition &&   //checks rect to rect overlap
      xPosition <= t1.xPosition + t1.tileWidth/2 &&
      yPosition + tileHeight/2 >= t1.yPosition &&
      yPosition <= t1.yPosition + t1.tileHeight/2) {

        if (keyCode == LEFT) { //assigns side of impact to variable side 
        side="left";  
        println("hit from right side");     
      } else if (keyCode == RIGHT) {
        side="right";
        println("hit from left side");
      } else if (keyCode == UP) {
        side="up";
        println("hit from bottom");
      } else if (keyCode == DOWN) {
        side="down";
        println("hit from top");
      }
      return true;
      }
    return false;
    */
  }
  
  
}

 


     