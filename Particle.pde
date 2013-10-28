/* 
 * Particle class
 */
class Particle {

  PImage img;

  PVector origin;
  PVector location;
  PVector velocity;
  PVector acceleration;
  PVector gravity;

  float mass;
  float maxspeed;
  float maxforce;

  /*
   * Particle constructor
   * loc = particle location
   * img = particle image
   */
  Particle(PVector loc, PImage img) {
    this.img = img;
    origin = loc.get();
    location = loc.get();
    acceleration = new PVector(0, 0);
    velocity = new PVector(0, 0);
    gravity = new PVector(random(-0.08, 0.08), 0.9);

    mass = 2;
    maxspeed = 12;
    maxforce = 0.2;
  }

  // standard motion model
  void update() {
    velocity.add(acceleration);
    velocity.limit(maxspeed);
    location.add(velocity);
    acceleration.mult(0);
  }

  void applyForce(PVector force) {
    PVector f = PVector.div(force, mass);
    acceleration.add(force);
  }

  // Arrive behaviour when homing (decelerate toward a target vector) 
  void arrive(PVector target) {
    PVector desired = PVector.sub(target, location);

    float d = desired.mag();
    desired.normalize();
    if (d < 110) {
      float m = map(d, 0, 100, 0, maxspeed);
      desired.mult(m);
    } 
    else {
      desired.mult(maxspeed);
    }

    PVector steer = PVector.sub(desired, velocity);
    steer.limit(maxforce);
    applyForce(steer);
  }

  // display particle
  void display() {
    image(img, location.x, location.y);
  }

  // fall action. Drop using gravity
  void fall() {
    applyForce(gravity);
    update();
    display();
    
    // bottom bounds checking  
    if (reachedBottom()) {
      acceleration.set(0, 0, 0);
      velocity.set(0, 0, 0);
      location.y = height - img.height;
    }
  }
  
  void attract(Attractor a) {
    PVector force = a.attract(this);
    applyForce(force);
    update();
    display();
  }

  // home action. Fly back to origin
  void home() {
    arrive(origin);
    update();
    display();
    
    // close to origin nudging
    if (almostOrigin()) {
      location.x = origin.x;
      location.y = origin.y;
    }
  }

  // bottom bounds checker
  boolean reachedBottom() {
    return location.y > (height - img.height);
  }

  // almost origin checker
  boolean almostOrigin() {
    return dist(origin.x, origin.y, location.x, location.y) < 2;
  }
  
  // at origin checker
  boolean atOrigin() {
    return (origin.x == location.x) && (origin.y == location.y);
  }
  
}

