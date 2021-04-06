public class ViewPort
{
  Map map;
  ArrayList<OrientedSprite> sprites;
  MapBoundDood player;
  
  int x, y;
  
  public ViewPort(Map map)
  {
    player = new MapBoundDood(width/2, height / 2, map);
    this.map = map;
    sprites = new ArrayList<OrientedSprite>();
    x = width / 2 - map.sideA.width / 2;
    y = height / 2 - map.sideA.height / 2;
  }
  
  public void addSprite(OrientedSprite sprite)
  {
    sprites.add(sprite);
  }
  
  public void drawViewPort()
  {
    player.move();
    
    if(map.topLeft.x >= map.size.x) 
    {
      map.topLeft.x -= map.size.x;
      player.pos.x += map.size.x;
      for(OrientedSprite sprite : sprites)
        sprite.pos.x += map.size.x;
    }
    else if(map.topLeft.x + map.size.x <= 0) 
    {
      map.topLeft.x += map.size.x;
      player.pos.x -= map.size.x;
      for(OrientedSprite sprite : sprites)
        sprite.pos.x -= map.size.x;
    }
    
    if(map.topLeft.y >= map.size.y) 
    {
      map.flip = !map.flip;
      map.topLeft.y -= map.size.y;
      player.pos.y += map.size.y;
      for(OrientedSprite sprite : sprites)
        sprite.pos.y += map.size.y;
    }
    else if(map.topLeft.y + map.size.y <= 0) 
    {
      map.flip = !map.flip;
      map.topLeft.y += map.size.y;
      player.pos.y -= map.size.y;
      for(OrientedSprite sprite : sprites)
        sprite.pos.y -= map.size.y;
    }
    
    map.drawMap();
    
    player.drawSprite();
    
    for(OrientedSprite sprite : sprites)
    {
      sprite.move();
      sprite.drawSprite();
    }
    
    
  }
}
