public class MapBoundDood extends OrientedSprite
{
  public MapBoundDood(int x, int y, Map map)
  {
    super(x, y, map);
    vel.x = 0;
    vel.y = 0;
  }
  
  void drawSprite()
  {
    Vector2 loc = viewPortLocation();
    println("player loc:  ", loc.x, loc.y);
    fill(0, 100, 200);
    ellipse(loc.x, loc.y, 60, 60);
  }
  
  void move()
  {
    if(keyPressed)
      this.keyboardControl();
      
    this.pos = this.pos.add(vel);  
    map.topLeft = map.topLeft.subtract(vel);
    //map.moveX((int)-this.vel.x);
    //map.moveY((int)-this.vel.y);
    ////super.move();
    
    //println("Position: ",this.pos.x, this.pos.y);
    
    
    //if(this.pos.x < 100 - map.size.x) map.moveX(map.size.x);
    //else if(this.pos.x > map.size.x - 100) map.moveX(-map.size.x);
    
    //if(this.pos.y < 100 - map.size.y)
    //{
    //  map.moveY(map.size.y);
    //  println("shifting map UP");
    //}
    //else if(this.pos.y > map.size.y - 100) 
    //{
    //  map.moveY(-map.size.y);
    //  println("shifting map DOWN");
    //}
    
    Vector2 loc = viewPortLocation();
    if(loc.x < 100)
      map.moveX(100 - (int)loc.x);
    else if(loc.x > width - 100)
      map.moveX((int)loc.x - (width - 100));
      
    if(loc.y < 100)
      map.moveY(100 - (int)loc.y);
    else if(loc.y > height - 100)
      map.moveY((int)loc.y - (height - 100));
  }
}
