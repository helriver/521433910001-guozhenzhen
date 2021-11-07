class Button1{
  Rectangle r;
  String txt;
  boolean clickedOn;
  boolean rolloverOn;

  Button1(int x, int y, int w, int h, String s) {
    r = new Rectangle(x,y,w,h);
    txt = s;
  }
  void display(){
    rectMode(CORNER);
    stroke(0); 
    strokeWeight(5);
    fill(255);
    if (rolloverOn) fill(0.5);
    if (clickedOn) fill(0);
    rect(r.x,r.y,r.width,r.height);
    float b = 0.0;
    if (clickedOn) b = 1;
    else if (rolloverOn) b = 0.2;
    else b = 0;
    fill(b);
    textAlign(CENTER, CENTER);
    textSize(35);
    text(txt,r.x+r.width/2-10,r.y+35);
  }
  
  boolean rollover(int mx, int my) {
    if (r.contains(mx,my)) rolloverOn = true;
    else rolloverOn = false;
    return rolloverOn;
  }

  boolean clicked(int mx, int my) {
    if (r.contains(mx,my)) clickedOn = true;
    return clickedOn;
  }
  
  void released() {
    clickedOn = false;
  }

}

class Button2{
  Rectangle r;
  String txt;
  boolean clickedOn;
  boolean rolloverOn;

  Button2(int x, int y, int w, int h, String s) {
    r = new Rectangle(x,y,w,h);
    txt = s;
  }
  void display(){
    rectMode(CORNER);
    stroke(0); 
    strokeWeight(5);
    fill(255);
    if (rolloverOn) fill(0.5);
    if (clickedOn) fill(0);
    rect(r.x,r.y,r.width,r.height);
    float b = 0.0;
    if (clickedOn)b = 1;
    else if (rolloverOn) b = 0.2;
    else b = 0;
    fill(b);
    textAlign(CENTER, CENTER);
    textSize(35);
    text(txt,r.x+r.width/2-10,r.y+35);
  }
  
  boolean rollover(int mx, int my) {
    if (r.contains(mx,my)) rolloverOn = true;
    else rolloverOn = false;
    return rolloverOn;
  }

  boolean clicked(int mx, int my) {
    if (r.contains(mx,my)) clickedOn = true;
    return clickedOn;
  }
  
  void released() {
    clickedOn = false;
  }

}
