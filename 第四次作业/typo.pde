float Px=0, Py=0, angle=0;
PFont font;
int t=0;
String s = "I’ve seen things you people wouldn’t believe. Attack ships on fire off the shoulder of Orion. I watched c-beams glitter in the darkness near the Tanhauser Gate. All those moments will be lost in time. Like tears, in rain.";
char[] ch = s.toCharArray();

void setup(){
  size(1000,1000);
  background(0);
  font = loadFont("TimesNewRomanPSMT-60.vlw");
}

void draw(){
  fill(0,5);
  rect(0,0,1000,1000);
  frameRate(8);
  float rate;
  char m;
  angle = angle*0.5 + atan2(mouseY - Py, mouseX - Px)*0.5;
  t++;
  m = ch[(t-1)%(s.length())];
  textFont(font);
  rate = dist(mouseX,mouseY,Px,Py);
  //textSize(map(rate,0,800,30,600));
  //pushMatrix();
  translate(mouseX, mouseY);
  rotate(angle);
  textSize(rate*2.5);
  textAlign(LEFT);
  //fill(random(100,255));
  fill(map(rate,0,1200,255,0));
  text(m, 0, 0);
  Px = mouseX;
  Py = mouseY;
}

void keyReleased() {
  if (keyCode == DELETE || keyCode == BACKSPACE) background(0);
}
