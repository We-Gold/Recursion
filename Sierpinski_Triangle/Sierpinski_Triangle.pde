float h = 0;
float s = 50;

void setup() {
  size(600,600);
}

void draw() {
  background(0);
  fill(255);
  noStroke();
  
  colorMode(HSB, 100);
  fill(h%100,s,100);
  
  h+=0.5;
  
  translate(width/2,height-100);
  
  float w = width-100;
  
  PVector p1 = new PVector(-(w/2),0);
  PVector p2 = new PVector((w/2),0);
  PVector p3 = new PVector(0,-equilateralHeight(w));
  
  tri(p1,p2,p3);
}

float equilateralHeight(float w){
  return (w*sqrt(3))/2;
}

PVector midpoint(PVector p1, PVector p2) {
  return new PVector(lerp(p1.x,p2.x,0.5),lerp(p1.y,p2.y,0.5));
}

void tri(PVector p1, PVector p2, PVector p3) {
  if(dist(p1.x,p1.y,p2.x,p2.y) <= 5)
    return;
    
  PVector m1 = midpoint(p1,p2);
  PVector m2 = midpoint(p2,p3);
  PVector m3 = midpoint(p1,p3);
  
  triangle(m1.x,m1.y,m2.x,m2.y,m3.x,m3.y);
  
  tri(m2,m3,p3);
  tri(p1,m1,m3);
  tri(m1,p2,m2);
}
