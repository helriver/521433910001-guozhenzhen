class Button2{
  Rectangle r;
  boolean clickedOn;
  boolean rolloverOn;

  Button2(float x, float y, float w, float h) {
    r = new Rectangle(x,y,w,h);
  }
  void display(){
    noStroke(); 
    fill(255,0);
    rect(r.x,r.y,200,30);
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
