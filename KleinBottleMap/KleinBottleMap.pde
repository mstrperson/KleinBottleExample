ViewPort viewPort;

void setup()
{
  //fullScreen();
  size(1920, 1080);
  viewPort = new ViewPort(new Map("side-a.png", "side-b.png"));
}

void draw()
{
  viewPort.drawViewPort();
}
