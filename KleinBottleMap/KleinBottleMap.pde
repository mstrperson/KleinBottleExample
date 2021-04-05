ViewPort viewPort;

void setup()
{
  size(1920, 1080);
  viewPort = new ViewPort(new Map("side-a.png", "side-b.png"));
  for(int i = 0; i < 5; i++)
  {
    viewPort.addSprite(new OrientedSprite((int)random(viewPort.map.size.x), (int)random(viewPort.map.size.y), viewPort.map));
  }
}

void draw()
{
  viewPort.drawViewPort();
}
