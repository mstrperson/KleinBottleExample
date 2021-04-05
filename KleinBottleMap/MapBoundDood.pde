public class MapBoundDood extends OrientedSprite
{
  public MapBoundDood(float x, float y, Map map)
  {
    super(x, y, map);
  }
  
  void drawSprite()
  {
    Vector2 loc = viewPortLocation();
    
    fill(0, 100, 200);
    ellipse(loc.x, loc.y, 30, 30);
  }
  
  void move()
  {
    if(keyPressed)
      this.keyboardControl();
      
    super.move();
    
    Vector2 loc = viewPortLocation();
    if(loc.x < 100)
    {
      map.moveX
    }
  }
}
