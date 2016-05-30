
class Crate extends Tile {

  color crateColor = color(0, 255, 0);  

  Crate(float initxPosition, float inityPosition, float inittileWidth, float inittileHeight) {

    super();
    xPosition = initxPosition;
    yPosition = inityPosition;

    tileWidth = inittileWidth;
    tileHeight = inittileHeight;

    tileColour = crateColor;
    strokeWeight(3);
  }


   boolean  checkCollision(Tile[][] myMap) { //overloaded method//pass in board object 

    for (int i=0; i< myMap.length; i++)
    {
      Tile [] temptile = myMap[i];

      for (int j=0; i< temptile.length; i++)
      {
        Tile t = temptile[j];

        if (t instanceof Wall)
        {
          // Check for collison 
           Boolean myResult = checkCollision(t);
            // If myResult is a clash return true;
            if (myResult == true);
              return true;
         }
      }
    }
    return false; // no clashes found
  }
 
}