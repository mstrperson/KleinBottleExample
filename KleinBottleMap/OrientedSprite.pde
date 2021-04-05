public class OrientedSprite extends Sprite
{
  Map map;
  boolean flip;
  
  public OrientedSprite(int x, int y, Map map)
  {
    super(x, y, random(-5, 5), random(-5, 5));
    this.map = map;
    flip = false;
  }
  
  protected void drawOrientation(float xOff, float yOff, boolean orient)
  {
    Vector2 loc = viewPortLocation();
    fill(200, 10, 10);
    triangle((orient ? width - loc.x : loc.x) + xOff, loc.y-10 + yOff, 
             (orient ? width -loc.x-10 : loc.x+10) + xOff, loc.y + yOff, 
             (orient ? width - loc.x : loc.x) + xOff, loc.y+10 + yOff);
    fill(10, 10, 200);
    triangle((orient ? width - loc.x : loc.x) + xOff, loc.y-10 + yOff, 
             (orient ? width - loc.x+10 : loc.x-10) + xOff, loc.y + yOff, 
             (orient ? width - loc.x : loc.x) + xOff, loc.y+10 + yOff);
  }
  
  public Vector2 viewPortLocation()
  {
    return this.pos.subtract(map.topLeft);
  }
  
  public void drawSprite()
  {
    drawOrientation(-map.size.x, -map.size.y, !flip);
    drawOrientation(0, -map.size.y, !flip);
    drawOrientation(map.size.x, -map.size.y, !flip);
    
    drawOrientation(-map.size.x, 0, flip);
    drawOrientation(0, 0, flip);
    drawOrientation(map.size.x, 0, flip);
    
    drawOrientation(-map.size.x, map.size.y, !flip);
    drawOrientation(0, map.size.y, !flip);
    drawOrientation(map.size.x, map.size.y, !flip);
  }
  
  public void move()
  {
    if(flip != map.flip)
      pos = pos.add(new Vector2(-vel.x, vel.y));
    else
      pos = pos.add(vel);
      
    if(pos.x < 0) pos.x += map.size.x;
    else if(pos.x > map.size.x) pos.x -= map.size.x;
    
    if(pos.y < 0)
    {
      pos.y += map.size.y;
      flip = !flip;
    }
    else if(pos.y > map.size.y)
    {
      pos.y -= map.size.y;
      flip = !flip;
    }  
  }
}
