
class Player extends Tile {
  
 
  color playerColor = color(0,0,255);
  
  Player(float initxPosition, float inityPosition, float inittileWidth, float inittileHeight){
    
    super(); //calls parent constructor
    xPosition = initxPosition;
    yPosition = inityPosition;

    tileWidth = inittileWidth;
    tileHeight = inittileHeight;

    tileColour = playerColor;
    strokeWeight(3);   
   }
   
    
  Boolean checkCollision(Crate t1) { //overloaded method//pass player a crate object to tell if player is bumping a crate//
   /*
      if (xPosition + tileWidth > t1.xPosition &&   //checks rect to rect overlap
      xPosition < t1.xPosition + t1.tileWidth &&
      yPosition + tileHeight > t1.yPosition &&
      yPosition < t1.yPosition + t1.tileHeight) {

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
   */
   
       if (keyCode == DOWN) {
             println("Player key down");
             if(t1.xPosition == xPosition) //checks player/crate are in line
             {
             if (yPosition + tileHeight >= t1.yPosition && t1.yPosition >= yPosition + tileHeight)  //checks player collision with crate//
             {
             println("Player overlap with crate");
             side="down"; //side of impact for moveTile method
             return true;
           }
          }
        }
           
            if (keyCode == UP) {
             println("Player key up");
              if(t1.xPosition == xPosition)
             {
            if (yPosition - tileHeight >= t1.yPosition && t1.yPosition >= yPosition - tileHeight)  
             {
               println("Player overlap with crate");
               side="up";
               return true;
             
             }
           }
         }
           
           if (keyCode == LEFT) {
             println("Player key left");
             if(t1.yPosition == yPosition)
             {            
             if (xPosition - tileWidth >= t1.xPosition && t1.xPosition >= xPosition - tileWidth)
             {
             println("Player overlap with crate");
             side = "left";
             return true;}
             
             }
           }
           
           if (keyCode == RIGHT) {
             println("Player key right");
             if(t1.yPosition == yPosition)
             {
             if (xPosition + tileWidth >= t1.xPosition && t1.xPosition >= xPosition + tileWidth)  
             {
             println("Player overlap with crate");
             side = "right";
             return true;}
             
             }
           }
   return false;
  }
  
  
}

 


     