float h = 0;
float s = 50;

void setup() {
  size(600,600);
}

void draw() {
  background(0);
  
  colorMode(HSB, 100);
  fill(h%100,s,100);
  
  h+=0.5;
  
  translate(width/2,height/2);
  carpet(width);
}

void carpet(float len) {
  if(len <= 5){
    return;
  }
  
  float third = len/3;
  
  rectMode(CENTER);
  
  rect(0,0,third,third);
  
  for(int r = -1; r <= 1; r++){
    for(int c = -1; c <= 1; c++){
      if(r != 0 || c != 0){
        push();
        translate(third*r,third*c);
        carpet(third);
        pop();
      }
    }
  }
}
