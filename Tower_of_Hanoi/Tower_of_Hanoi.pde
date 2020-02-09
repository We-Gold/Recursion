int n = 6;

int[] rings = new int[n];

Move[] moves = new Move[(int)(pow(2,n)-1)];

int currentMove = 0;

int step = 0;

void setup() {
  size(800,600);
  
  hanoi(n,0,1,2);
  currentMove = 0;
}

void draw() {
  colorMode(RGB,255,255,255);
  background(255);
  
  stroke(0);
  strokeWeight(10);
  line(width/4,200,width/4,height-100);
  line(2*(width/4),200,2*(width/4),height-100);
  line(3*(width/4),200,3*(width/4),height-100);
  
  fill(0);
  stroke(0);
  strokeWeight(0);
  rectMode(CORNERS);
  rect(0,height-100,width,height);
  
  drawRings();
  
  if(step%30==0 && currentMove < pow(2,n)-1){
    rings[moves[currentMove].ring] = moves[currentMove].target;
    currentMove++;
  }  
  
  step++;
}

void drawRings() {
  int[] pegPos = new int[]{0,0,0};
  
  int w = (width/4) - 20;
  int h = 20;
  
  for(int i = n-1; i >= 0; i--) {
    colorMode(HSB,360,100,100);
    fill(29,100,((50/n)*(n-i-1))+50);
    rectMode(CENTER);
    rect((rings[i]+1)*(width/4),height-(100+(h/2)+(pegPos[rings[i]]*h)),w-((n-i-1)*20),h);
    pegPos[rings[i]]++;
  }
}

void hanoi(int n,int p1,int p2,int p3) {
  if(n > 0) {
    hanoi(n-1,p1,p3,p2);
    moves[currentMove++] = new Move(n-1,p1,p3);
    hanoi(n-1,p2,p1,p3);
  }
}
