PVector origin;
float len;
float mass = 5;
//int num = 5;
int unit = 50;
int count;
int highCount;
int wideCount;
int temp;
int chosen;

Node[] node;
Spring[] spring;

void setup() {
  size(400,400);
  colorMode(HSB,100,100,100);
  wideCount = 2*width / unit - 1;
  highCount = 2*height / unit - 1;
  count = wideCount * highCount;
  node = new Node[count];
  //node = new Node[num];  
  spring = new Spring[count*2];
  chosen = count/2; // + wideCount/2 - 1;
  
  int index = 0;
  //for (int i = 0; i < num; i++){
  //  int s = int(random(50, 150));
  for (int y = 0; y < highCount; y++) {
    for (int x = 0; x < wideCount; x++) {
      node[index++] = new Node(mass, x*unit/2, y*unit/2, 30, unit);
    }
  }
   
  //}
    
  //node[0] = new Node(mass, width/2, height/2, 100);
  //node[1] = new Node(mass, (width/2) - 100, height/2, 75);
  //node[2] = new Node(mass, (width/2) + 100, height/2, 75);
  //node[3] = new Node(mass, (width/2), height/2 + 100, 75);
  //node[4] = new Node(mass, (width/2), height/2 - 100, 75);
  
  index = 0;
  for (int y = 0; y < highCount; y++) {
    for (int x = 0; x < wideCount; x++) {
      if (x == wideCount - 1 || index == count){
             spring[index] = new Spring(node[index], node[index], unit/2);
      }
      else{  spring[index] = new Spring(node[index], node[index+1], unit/2);
      }
      index++;
    }
  }
  
  temp = index;
  index = 0;
  for (int y = 0; y < wideCount; y++) {
    for (int x = 0; x < highCount - 1; x++) {
        spring[temp + index] = new Spring(node[index], node[index + wideCount], unit/2);
      index++;
    }
  }
  
}

int t;
float r = 1;
void draw() {
 
  background(0,0,0);
  
  t = t%180;
  r = abs(cos(t*PI/180))*unit;

  for (int i = 0; i < spring.length - wideCount; i++){
    spring[i].update();
    //spring[i].display();
  }
  
  for (int i = 0; i < node.length; i++){
    if ( i == chosen){
          node[i].location.z = r;
          node[i].update();
          node[i].display();          
    } else{
          node[i].update();
          node[i].display();
    }
  }
  
  t++;
 //saveFrame("output2/2DSpringsquare_####.png");
}