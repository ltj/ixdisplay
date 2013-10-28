/*
 * Attractor class
 */

class Attractor {

  float mass;
  PVector location;
  float G;

  Attractor(float mass, PVector location, float G) {
    this.mass = mass;
    this.location = location;
    this.G = G;
  }

  Attractor() {
    this(16, new PVector(width/2, height/2), 0.3);
  }

  void display() {
    stroke(0);
    fill(175, 200);
    ellipse(location.x, location.y, mass*2, mass*2);
  }

  PVector attract(Particle p) {
    PVector force = PVector.sub(location, p.location);
    float distance = force.mag();
    distance = constrain(distance,5.0,25.0);
    force.normalize();
    float strength = (G * mass * p.mass) / (distance * distance);
    force.mult(strength);

    return force;
  }
}

