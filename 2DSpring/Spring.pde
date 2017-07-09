class Spring {
  
  //Location
  PVector anchor;
  
  //Rest length
  float len;
  float k = 0.1;
  
  
  Node a;
  Node b;
  
  //Constructor
  Spring(Node a_, Node b_, int l){
    a = a_;
    b = b_;
    len = l;
  }
  
  
  //Spring force
  void update(){
    //Vector pointing from anchor to node location
    //PVector force = PVector.sub(a.location, b.location); //*
    float force = (a.location.z - b.location.z);
    //float d = force.mag(); //*
    float d = abs(force);
    float stretch = d - len;
    
    //force.normalize();
    force = force/stretch;
    //force.mult(-1 * k * stretch);
    force = force * -1 * k * stretch;
    a.applyForce(force);
    //force.mult(-1);
    force = force * -1;
    b.applyForce(force);
  }

  void display() { 
    strokeWeight(2);
    stroke(0,0,100);
    line(a.location.x, a.location.y, b.location.x, b.location.y);
  }
} 