Ball[] tinyBalls; 
int tnb=150;

void setup() {
  size(800, 800);
  background(0);
  initiateData();
}

void initiateData() {
  tinyBalls=new  Ball [tnb];
  for (int i=0; i<tinyBalls.length; i++) {
    float dd=random(80,160);
    tinyBalls[i]=new Ball(random(width), random(height), dd);
  }
}
void draw() {
  fill(0,10);
  noStroke();
  rect(0,0,width,height);
for(int i=0;i<tinyBalls.length;i++){
  tinyBalls[i].mouseAttraction();
  tinyBalls[i].move();
  tinyBalls[i].shakeHand();
  tinyBalls[i].edge();
 }
}

void keyPressed() {
  if (key=='r') {
    initiateData();
  }
}
