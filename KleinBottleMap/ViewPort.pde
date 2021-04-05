public class ViewPort
{
  Map map;
  ArrayList<OrientedSprite> sprites;
  MapBoundDood player;
  
  float x, y;
  
  public ViewPort(Map map, MapBoundDood p)
  {
    player = p;
    this.map = map;
    
    x = width / 2 - map.sideA.width / 2;
    y = height / 2 - map.sideA.height / 2;
  }
  
  public void AddSprite(OrientedSprite sprite)
  {
    sprites.add(sprite);
  }
  
  public void advanceFrame()
  {
    player.move();
    
    for(OrientedSprite sprite : sprites)
    {
      sprite.move();
      sprite.drawSprite();
    }
    
    
  }
}
