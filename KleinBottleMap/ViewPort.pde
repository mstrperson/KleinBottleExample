public class ViewPort
{
  Map map;
  ArrayList<OrientedSprite> sprites;
  MapBoundDood player;
  
  int x, y;
  
  public ViewPort(Map map)
  {
    player = new MapBoundDood((int)map.size.x / 2, (int)map.size.y / 2, map);
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
    
    map.drawMap();
    
    player.drawSprite();
    
    for(OrientedSprite sprite : sprites)
    {
      sprite.move();
      sprite.drawSprite();
    }
    
    
  }
}
