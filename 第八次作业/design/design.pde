float r = 0, g = 0, b = 0;
float d1 = 10, d2 = 10, d3 = 20, m, px, py;
int flag = 1, flag0 = 0;
Button1 button1;
Button1 button2;
Button1 button3;
Button2 button4;
Button2 button5;
Button2 button6;

void setup(){
  
  size(800,1000);
  background(255);
  fill(20);
  rect(0,0,800,180);
  noStroke();
  fill(255,0,0);
  rect(0,180,800,20);
  fill(255);
  textSize(30);
  text("BRUSH",30,50);
  text("ERASER",30,102.5);
  text("CIRCLE",30,155);
  text("R",530,50);
  text("G",530,102.5);
  text("B",530,155);
  
  noStroke();
  for(int i=570; i<=770; i+=5){
    m=(i-570)/2;
    fill(m,0,0);
    rect(i,22.5,5,35);
    fill(0,m,0);
    rect(i,75,5,35);
    fill(0,0,m);
    rect(i,127.5,5,35);
  }
  
  fill(r,g,b);
  noStroke();
  ellipse(430,90,120,120);
  
  button1 = new Button1(150,22.5,180,30);
  button2 = new Button1(150,75,180,30);
  button3 = new Button1(150,127.5,180,30);
  
  button4 = new Button2(570,22.5,200,30);
  button5 = new Button2(570,75,200,30);
  button6 = new Button2(570,127.5,200,30);
  
}

void draw(){
  
  frameRate(5000);
  
  button1.display();
  button2.display();
  button3.display();
  button4.display();
  button5.display();
  button6.display();
  
  button1.rollover(mouseX,mouseY);
  button2.rollover(mouseX,mouseY);  
  button3.rollover(mouseX,mouseY);
  button4.rollover(mouseX,mouseY);  
  button5.rollover(mouseX,mouseY);
  button6.rollover(mouseX,mouseY);
  
  if(flag == 1){
    fill(255,0,0);
    noStroke();
    rect(0,180,800,20);
    textSize(16);
    noStroke();
    fill(0);
    text("Brush : "+ str(d1)+"    R = "+ str(r)+"  G = "+ str(g)+"  B = "+ str(b), 30, 196);
      
  }else if(flag == 2){
    fill(255,0,0);
    noStroke();
    rect(0,180,800,20);
    textSize(16);
    noStroke();
    fill(0);
    text("Eraser : "+ str(d2)+"    R = "+ str(r)+"  G = "+ str(g)+"  B = "+ str(b), 30, 196);
      
  }else{  
    fill(255,0,0);
    noStroke();
    rect(0,180,800,20);
    textSize(16);
    noStroke();
    fill(0);
    text("Circle : "+ str(d3)+"    R = "+ str(r)+"  G = "+ str(g)+"  B = "+ str(b), 30, 196);
  }
    
  if(mousePressed && mouseY < 200){
    if(button1.clicked(mouseX,mouseY)){
      d1 = map(mouseX, 150, 330, 0, 100);
      flag = 1;
      flag0 = 0;
      
    }else if(button2.clicked(mouseX,mouseY)){
      d2 = map(mouseX, 150, 330, 0, 100);
      flag = 2;
      flag0 = 0;
      
    }else if(button3.clicked(mouseX,mouseY)){
      d3 = map(mouseX, 150, 330, 0, 500);
      flag = 3;
      flag0 = 0;
      
    }else if(button4.clicked(mouseX,mouseY)){
      r = map(mouseX, 570, 770, 0, 255);
      flag0 = 0;
    }else if(button5.clicked(mouseX,mouseY)){
      g = map(mouseX, 570, 770, 0, 255);
      flag0 = 0;
    }else if(button6.clicked(mouseX,mouseY)){
      b = map(mouseX, 570, 770, 0, 255);
      flag0 = 0;
    }
  }else if(mousePressed && mouseY >= 200){
    if(flag == 1){
      if(mouseY-d1/2>180){
        fill(r, g, b);
        noStroke();
        ellipse(mouseX, mouseY, d1, d1);
        if(flag0 != 0){
          strokeWeight(d1);
          stroke(r, g, b);
          line(mouseX, mouseY, px, py);
        }else flag0 = 1;
        px = mouseX;
        py = mouseY;
      }
    }else if(flag == 2){
      if(mouseY-d2/2>180){
        fill(255);
        noStroke();
        ellipse(mouseX, mouseY, d2, d2);
        if(flag0 != 0){
          strokeWeight(d2);
          stroke(255);
          line(mouseX, mouseY, px, py);
        }else flag0 = 1;
        px = mouseX;
        py = mouseY;
      }
    }else{
      if(mouseY-d3/2>180){
        stroke(r, g, b);
        noFill();
        strokeWeight(1);
        ellipse(mouseX, mouseY, d3, d3);}
      }
  }else flag0 = 0;
  fill(r,g,b);
  noStroke();
  ellipse(430,90,120,120);
}

void keyReleased() {
  if (keyCode == DELETE || keyCode == BACKSPACE) {
    fill(255);
    noStroke();
    rect(0,200,800,800);
  }
  if (keyCode == SHIFT) {
    save("pic.jpg");
  }
}
