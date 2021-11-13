class Button1{
  Triangle r;
  String txt;
  boolean clickedOn;
  boolean rolloverOn;

  Button1(float x, float y, float w, float h) {
    r = new Triangle(x,y,w,h);
  }
  
  void display(){
    noStroke();
    fill(255);
    if (rolloverOn) fill(50);
    if (clickedOn) fill(0);
    triangle(r.x, r.y+ r.height/2, r.x+r.width, r.y,r.x+r.width, r.y+r.height);
    if (clickedOn) fill(0);
    line(mouseX, r.y, mouseX, r.y + r.width);
  }
  
  boolean rollover(float mx, float my) {
    if (r.contains(mx,my)) rolloverOn = true;
    else rolloverOn = false;
    return rolloverOn;
  }

  boolean clicked(float mx, float my) {
    if (r.contains(mx,my)) {clickedOn = true;} else {clickedOn = false;}
    return clickedOn;
  }
  
  void released() {
    clickedOn = false;
  }
}
