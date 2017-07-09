class Node {
  
  PVector location;
  //PVector vel; //*
  float vel;
  //PVector accel; //*
  float accel;
  float mass;
  
  //Damping
  float damping = 0.99;
  
  
  //Constructor
  Node(float m, float x, float y, float z, int unit_) {
    unit = unit_;
    mass = m;
    location = new PVector(x+unit/2,y+unit/2,z);
    vel = 0;
    accel = 0;
    //vel = new PVector(0,0,0); //*
    //accel = new PVector(0,0,0); //*
  }
  
  
  //void applyForce(PVector force) { //*
    void applyForce(float force){
    //PVector f = force.copy(); //*
    float f = force;
    //f.div(mass); //*
    f = f/mass;
    //accel.add(f); //*
    accel = accel + f;
  }
  
  //Euler integration
  void update(){
    //vel.add(accel); //*
    vel = vel + accel;
    //vel.mult(damping); //*
    vel = vel*damping;
    //location.add(vel); //*
    location.z = location.z + vel;
    //accel.mult(0); //*
    accel = 0;
  }
  
   void display(){
    stroke(0);
    strokeWeight(2);
    fill(map(location.z,unit/2,unit,0,100),100,100);
    rectMode(RADIUS);
    rect(location.x, location.y, location.z/4, location.z/4);
  }
  
}