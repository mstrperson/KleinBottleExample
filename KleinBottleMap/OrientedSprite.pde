public class OrientedSprite extends Sprite
{
  Map onMap;
  boolean flip;
  
  public OrientedSprite(float x, float y, Map map)
  {
    super(x, y);
    onMap = map;
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
    if(flip != onMap.flip)
      pos = pos.add(new Vector2(-vel.x, vel.y));
    else
      pos = pos.add(vel);
      
    if(pos.x < 0) pos.x += onMap.size.x;
    else if(pos.x > onMap.size.x) pos.x -= onMap.size.x;
    
    if(pos.y < 0)
    {
      pos.y += onMap.size.y;
      flip = !flip;
    }
    else if(pos.y > onMap.size.y)
    {
      pos.y -= onMap.size.y;
      flip = !flip;
    }  
  }
}
