Map map;

void setup()
{
  size(1280, 720);
  map = new Map("side-a.png", "side-b.png");
}

void draw()
{
  map.drawMap();
}
