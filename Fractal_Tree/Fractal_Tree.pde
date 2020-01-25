float angle = 0;
float step = 1;

void setup() {
  size(800,800);
}

void draw() {
  background(0);
  stroke(255);
  
  push();
  translate(200,350);
  branch(toRadians(30),100);
  pop();
  
  push();
  translate(600,350);
  branch(toRadians(45),100);
  pop();
  
  push();
  translate(200,700);
  branch(toRadians(angle),100);
  pop();
  
  angle+=step;
  
  push();
  translate(600,700);
  branch(toRadians(15),100);
  pop();
}

float toRadians(float angle) {
  return PI*(angle/180);
}

void branch(float angle,float len){
  if(len<=2){
    return;
  }
  
  line(0,0,0,-len);
  
  push();
  translate(0,-len);
  rotate(angle);
  branch(angle,len*0.67);
  pop();
  
  push();
  translate(0,-len);
  rotate(-angle);
  branch(-angle,len*0.67);
  pop();
}
