class Ball {
  float bX;
  float bY;
  float bD;
  color c=255;
  boolean shakeHand;
  float speedX, speedY;
  Ball(float bX_, float bY_, float bD_) {
    bX=bX_;
    bY=bY_;
    bD=bD_;
    speedX=random(-10, 10);
    speedY=random(-10, 10);
  }
  void move() {
    bX=bX+speedX;
    bY=bY+speedY;
  }
  void edge() {
    if (bX>width-bD/2) {
      speedX=-speedX;
    }
    if (bX<bD/2) {
      speedX=-speedX;
    }
    if (bY>height-bD/2) {
      speedY=-speedY;
    }
    if (bY<+bD/2) {
      speedY=-speedY;
    }
  }
  void shakeHand() {
    for (Ball b : tinyBalls) {
      if (b!=this) {
        float rR=b.bD/2+this.bD/2;
        float d=dist(b.bX, b.bY, this.bX, this.bY);
        if (d<rR) {
          float w=map(d,0,rR,0,5);
          float a=map(dist(b.bX,b.bY,mouseX,mouseY),50,100,1600,0);
          strokeWeight(w);
          stroke(200,a);
          line(b.bX, b.bY, bX, bY);
          fill(0);
          noStroke();
          ellipse(b.bX,b.bY,w,w);
        }
      }
    }
  }
  void mouseAttraction(){
    if (mousePressed){
      for (Ball b : tinyBalls) {
        b.bX += 10*(mouseX-b.bX)/abs(mouseX-b.bX);
        b.bY += 10*(mouseY-b.bY)/abs(mouseY-b.bY);
      }
    }
  }
}
