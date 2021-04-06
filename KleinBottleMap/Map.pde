public class Map
{
  PImage sideA;
  PImage sideB;
  boolean flip;
  
  Vector2 topLeft;
  Vector2 size;
  
  public Map(String fileNameA, String fileNameB)
  {
    flip=false;
    sideA = loadImage(fileNameA);
    sideB = loadImage(fileNameB);
    //sideA.resize(1920, 1080);
    //sideB.resize(1920, 1080);
    topLeft = new Vector2(0, 0);
    size = new Vector2(sideA.width, sideA.height);
  }
  
  void moveX(int dx)
  {
    dx = dx % (int)size.x;
    topLeft.x += dx;
    
    println("TopLeft x: ", topLeft.x, " Size x: ", size.x);
    
    if(topLeft.x >= size.x) topLeft.x -= size.x;
    else if(topLeft.x + size.x <= 0) topLeft.x += size.x;
  }
  
  void moveY(int dy)
  {
    dy = dy % (int)size.y;
    
    topLeft.y += dy;
    
    
    println("TopLeft y: ", topLeft.y, " Size y: ", size.y);
    
    if(topLeft.y >= size.y) 
    {
      topLeft.y -= size.y;
      flip = !flip;
      println("FLIPPED going UP");
    }
    else if(topLeft.y + size.y <= 0)
    { 
      topLeft.y += size.y;
      flip = !flip;
      println("FLIPPED going DOWN");
    }
  }
  
  public void drawMap()
  { 
    image(flip?sideA:sideB, topLeft.x - size.x, topLeft.y - size.y);
    image(flip?sideA:sideB, topLeft.x, topLeft.y - size.y);
    image(flip?sideA:sideB, topLeft.x + size.x, topLeft.y - size.y);
    
    image(flip?sideB:sideA, topLeft.x - size.x, topLeft.y);
    image(flip?sideB:sideA, topLeft.x, topLeft.y);
    image(flip?sideB:sideA, topLeft.x + size.x, topLeft.y);
    
    image(flip?sideA:sideB, topLeft.x - size.x, topLeft.y + size.y);
    image(flip?sideA:sideB, topLeft.x, topLeft.y + size.y);
    image(flip?sideA:sideB, topLeft.x + size.x, topLeft.y + size.y);
  }
   //<>//
}
