abstract class Sprite
{
  protected Vector2 pos;
  protected Vector2 vel;
  
  
  /// Constructors
  public Sprite(float x, float y)
  {
    pos = new Vector2(x, y);
    vel = new Vector2(0, 0);
  }
  
  public Sprite(float x, float y, float dx, float dy)
  {
    pos = new Vector2(x, y);
    vel = new Vector2(dx, dy);
  }
  
  public Sprite(Vector2 s)
  {
    pos = s;
    vel = new Vector2(0, 0);
  }
  
  /// Behaviors
  public void moveTo(Vector2 newPosition)
  {
    pos = newPosition;
  }
  
  public void setVelocity(Vector2 newVelocity)
  {
    vel = newVelocity;
  }
  
  public void move()
  {
    pos = pos.add(vel);
  }
  
  public Vector2 getPosition()
  {
    return pos;
  }
  
  public Vector2 getVelocity()
  {
    return vel;
  }
  
  void keyboardControl()
  {
    switch(keyCode)
    {
      case UP:     vel.y = -5; vel.x = 0;  break;
      case DOWN:   vel.y = 5;  vel.x = 0;  break;
      case LEFT:   vel.y = 0;  vel.x = -5; break;
      case RIGHT:  vel.y = 0;  vel.x = 5;  break;
    }
  }
  
  // make this Sprite move at the speed := |<dx, dy>|
  // directly toward your mouse pofloater!
  void followMouse()
  {
    float speed = vel.mag();//sqrt(vel.x*vel.x + vel.y*vel.y);
    
    Vector2 mLoc = new Vector2(mouseX, mouseY);
    Vector2 mDir = mLoc.subtract(pos);
    
    //float delX = mouseX - pos.x;
    //float delY = mouseY - pos.y;
    
    //float mag = mDir.mag();
    
    pos = pos.add(mDir.unitVector().scale(speed));
    
    //if(delX != 0) pos.x += (delX / mag) * speed;
    //if(delY != 0) pos.y += (delY / mag) * speed;
  }
  
  public float distanceTo(Sprite other)
  {
    Vector2 diff = other.pos.subtract(this.pos);
    return diff.mag();
  }
  
  public abstract void drawSprite();
}
