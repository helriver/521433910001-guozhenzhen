float a;
float inc;
float r;
float d=3;
int frame = 20;
float x1, y1, x2, y2, x3, y3, x4, y4;

void setup()
{
  size(700, 700);
  noFill();
  x1 = -(width/2) + frame;
  y1 = -(height/2) + frame;
  x2 = (width/2) - frame;
  y2 = y1;
  x3 = x2;
  y3 = (height/2) - frame;
  x4 = x1;
  y4 = y3;
  r = ((x2 - x1) - d) / (x2 - x1);
  inc = 0.1;
  background(0);
}

void draw(){
  if (mousePressed){
    float rx1, rx2, rx3, rx4, ry1, ry2, ry3, ry4;
    if (abs(x2 - x1) > 2)
    {
      float col = (a * 65) % 255;
      rx1 = x1 * cos(a) - y1 * sin(a) + (width/2);
      ry1 = x1 * sin(a) + y1 * cos(a) + (height/2);
      rx2 = x2 * cos(a) - y2 * sin(a) + (width/2);
      ry2 = x2 * sin(a) + y2 * cos(a) + (height/2);
      rx3 = x3 * cos(a) - y3 * sin(a) + (width/2);
      ry3 = x3 * sin(a) + y3 * cos(a) + (height/2);
      rx4 = x4 * cos(a) - y4 * sin(a) + (width/2);
      ry4 = x4 * sin(a) + y4 * cos(a) + (height/2);
      stroke(255-col, 127.5, col);
      quad(rx1, ry1, rx2, ry2, rx3, ry3, rx4, ry4);
      a = a + inc;
      x1 = x1 * r;
      y1 = y1 * r;
      x2 = x2 * r;
      y2 = y2 * r;
      x3 = x3 * r;
      y3 = y3 * r;
      x4 = x4 * r;
      y4 = y4 * r;
    }
  }
}
