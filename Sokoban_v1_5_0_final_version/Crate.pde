
class Crate extends Tile {

  color crateColor = color(0, 255, 0);  

  //variable to hold win state
  Boolean winState;


  Crate(float initxPosition, float inityPosition, float inittileWidth, float inittileHeight) {

    super(); //calls parent constructor
    xPosition = initxPosition;
    yPosition = inityPosition;

    tileWidth = inittileWidth;
    tileHeight = inittileHeight;

    tileColour = crateColor;
    strokeWeight(3);
    winState = false;
  }



 //method for checking crate object colliding with walls
 //pass in board and assign to variable myMap
  boolean  checkCollision(Tile[][] myMap) { //passing by reference//overloaded method//

  //loop through board array determining position of objects, i.e. Walls and Win Tile
    for (int i=0; i< myMap.length; i++)
    {
      Tile [] temptile = myMap[i];

      for (int j=0; j< temptile.length; j++)
      {
        Tile t = temptile[j];
        println(i+" : " + j);
        
        //check when crate overlaps a wall  
        if (t instanceof Wall)
        {
         
           if (keyCode == DOWN) {
             if(t.xPosition == xPosition) //checks wall/crate are in line
             {
             if (t.yPosition >= yPosition && yPosition + tileHeight >= t.yPosition) //checks crate/wall are overlapping
             {
             println("crate overlap with wall");
             return true;} 
             
             }
           }
           
            if (keyCode == UP) {
             if(t.xPosition == xPosition)
             {
             if (t.yPosition + tileHeight >= yPosition && yPosition >= t.yPosition + t.tileHeight)  
             {
             println("crate overlap with wall");
             return true;}
             
             }
           }
           
           if (keyCode == LEFT) {
             if(t.yPosition == yPosition)
             {
             if (t.xPosition + t.tileWidth >= xPosition && xPosition + tileWidth >= t.xPosition)  
             {
             println("crate overlap wall");
             return true;}
             
             }
           }
           
           if (keyCode == RIGHT) {
             if(t.yPosition == yPosition)
             {
             if (t.xPosition >= xPosition && xPosition + tileWidth >= t.xPosition)  
             {
             println("crate overlap wall");
             return true;}
             
             }
           }
           println("crate not overlapping with wall");
        }
        
        //check when crate is pushed onto the wintile//
        if (t instanceof WinTile)
        {
            //this stops the crate moving off the wintile for all key strokes
           if(xPosition == t.xPosition && yPosition == t.yPosition){
             println("crate on top of wintile");
             return true;             
           }
           
          //check for move onto wintile and set the winner flag but do not return true to stop the move          
          if (keyCode == DOWN) {
           if(t.xPosition == xPosition)
             {
             if (t.yPosition >= yPosition && yPosition + tileHeight >= t.yPosition)            
             {
             println("crate overlaps wintile"); 
             winState = true;       
              }
             }
           }
         
                      
            if (keyCode == UP) {
             if(t.xPosition == xPosition)
             {
             if (t.yPosition + tileHeight >= yPosition && yPosition >= t.yPosition + t.tileHeight)  
             {
             println("crate overlaps wintile");
             winState = true;
           }
          }
         }
           
           if (keyCode == LEFT) {
             if(t.yPosition == yPosition)
             {
             if (t.xPosition + t.tileWidth >= xPosition && xPosition + tileWidth >= t.xPosition)  
             {
             println("crate overlap with wintile");
             winState = true;
           }             
          }
         }
           
           if (keyCode == RIGHT) {
             if(t.yPosition == yPosition)
             {
             if (t.xPosition >= xPosition && xPosition + tileWidth >= t.xPosition)  
             {
             println("crate overlap with wintile");
             winState = true;
           }            
          }
         }
        
        
           println("crate not overlapping with wintile");
        }       
      }
   }
   return false;
   
}

  
  //get win state, return either true or false
  Boolean getWinState(){
   return winState; 
  }

}