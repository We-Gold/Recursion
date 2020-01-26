float branches = 0;
float frames = 0;
float step = 1;

void setup() {
  size(800,500);
}

void draw() {
  background(0);
  stroke(255);
  
  push();
  translate(600,400);
  multiAngleBranch(toRadians(25),toRadians(100),100);
  pop();
  
  push();
  translate(200,400);
  polyBranch(toRadians(30),branches%6,100);
  pop();
  
  if(frames%30==0)
    branches+=step;
  frames++;
}

float toRadians(float angle) {
  return PI*(angle/180);
}

void polyBranch(float angle,float branches,float len){
  if(len<=branches*2){
    return;
  }
  
  line(0,0,0,-len);
  
  for(int i = (int)(-1*(branches/2)); i <= (int)(branches/2); i++){
    if(!(i==0 && branches%2==0)) {
      push();
      translate(0,-len);
      rotate(angle*i);
      polyBranch(angle,branches,len*0.67);
      pop(); 
    }
  }
}

void multiAngleBranch(float angle1, float angle2,float len){
  if(len<=1){
    return;
  }
  
  line(0,0,0,-len);
  
  push();
  translate(0,-len);
  rotate(angle1);
  multiAngleBranch(angle1,angle2,len*0.67);
  pop();
  
  push();
  translate(0,-len);
  rotate(-angle2);
  multiAngleBranch(-angle1,-angle2,len*0.67);
  pop();
}
