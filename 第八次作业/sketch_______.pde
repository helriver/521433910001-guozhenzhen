int generate = 0;
int line = 9;
int sum = 15;
Button1 button1;
Button2 button2;

void setup(){
  size(1000,1000);
  background(255);
  button1 = new Button1(50,80,180,80,"line +");
  button2 = new Button2(50,180,180,80,"line -");
}

void draw(){
  button1.display();
  button2.display();
  button1.rollover(mouseX,mouseY);
  button2.rollover(mouseX,mouseY);
  if (mousePressed){
    if (button1.clicked(mouseX,mouseY)) {
      line += 1;
      if(line >= 100){line = 99;}
      button1.clickedOn = false;
    }else if (button2.clicked(mouseX,mouseY)) {
      line -= 1;
      if(line <= 2){line = 3;}
      button2.clickedOn = false;
    }
    fill(255);
    noStroke();
    rect(0,0,1000,1000);
    float a, b, min, col;
    float[] x;
    x = new float[100];
    float[] y;
    y = new float[100];
    boolean[] t;
    t = new boolean[10000];
    int m1, n1, m2, n2;
    boolean bool;

    x[0] = 0;
    x[line] = 1000;
    y[0] = 0;
    y[line] = 1000;
    for(int i=0; i<line-1; i++){
      a=random(1000);
      strokeWeight(random(5)+3);
      stroke(0);
      line(a,0,a,1000);
      x[i+1] = a;
      b=random(1000);
      line(0,b,1000,b);
      y[i+1] = b;
    }
  
    for(int i=1; i<line-1; i++){
      for(int j=i; j<line; j++){
        if(x[j]-x[i-1]<20){x[j]+=15;}
        if(y[j]-y[i-1]<20){y[j]+=15;}
        if(x[j] < x[i]){
          min = x[j];
          x[j] = x[i];
          x[i] = min;
        }
        if(y[j] < y[i]){
          min = y[j];
          y[j] = y[i];
          y[i] = min;
        }
      }
    }
    if(x[line-1]>1000){x[line-1]=1000;}
    if(y[line-1]>1000){y[line-1]=1000;}

    for(int i=0; i<(line+1)*(line+1); i++){ t[i]=true; }
    
    for(int i=0; i<sum; i++){
      bool=true;
      m1=int(random(line)); n1=int(random(line));
      m2=m1+1+int(random(line-m1)); n2=n1+1+int(random(line-n1));
      outer:
      for(int j=m1; j<=m2; j++){
        for(int k=n1; k<=n2; k++){
            if(t[k*10+j]==false){
              bool=false;
              break outer;
            }  
        }
      }
      if(bool==true && x[m2]-x[m1]<=618 && y[n2]-y[n1]<=618){
        col = random(5); 
        if( 0<=col & col<3 ){fill(255,0,0);}
        else if( 3<=col & col<3.7 ){fill(255,235,0);}
        else if( 3.7<=col & col<4.5){fill(0,0,255);}
        else{fill(180);}
        stroke(0);
        strokeWeight(random(5)+3);
        rect(x[m1], y[n1], x[m2]-x[m1], y[n2]-y[n1]);
        for(int j=m1+1; j<m2; j++){
          for(int k=n1+1; k<n2; k++){
            t[k*10+j]=false;
          }
        }
      }
      else{ i -= 1; }
    }
    generate += 1;
    textSize(30);
    fill(0);
    text("GENERATE : "+str(generate),140,50);
   }
}
