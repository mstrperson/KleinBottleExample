ViewPort viewPort;
int numObjects = 5;
void setup()
{
  fullScreen();
  //size(1920, 1080);
  viewPort = new ViewPort(new Map("side-a.png", "side-b.png"));
  for(int i = 0; i < numObjects; i++)
    viewPort.addSprite(new OrientedSprite((int)random(viewPort.map.size.x), (int)random(viewPort.map.size.y), viewPort.map));
}

void draw()
{
  viewPort.drawViewPort();
}
