import java.util.Iterator;

/* 
 * ParticleSystem class
 */
class ParticleSystem {
  
  // tweak stuff
  int attRad = 115; // amount of jitter (dist from center) in attractor position

  // fields
  PImage masterImg;
  ArrayList<Particle> particles;
  int[] ip;
  PVector origin;
  int psize;
  boolean reassembling;
  int idx;
  Attractor a;

  /*
   * ParticleSystem constructor
   * location = upper left corner location of system
   * img = master image to be split into particles
   * psize = particle dimension
   */
  ParticleSystem(PVector location, PImage img, int psize) {
    origin = location.get();
    masterImg = img;
    this.psize = psize;
    reassembling = false;
    idx = 0;
    initialize();
    a = new Attractor(16, new PVector(grx_right/2, height/2), 0.3);
  }

  private void initialize() {
    masterImg.loadPixels();
    // initialize particles
    particles = new ArrayList<Particle>();
    for (int y = 0; y < masterImg.height; y+=psize) {
      for (int x = 0; x < masterImg.width; x+=psize) {
        PImage section = masterImg.get(x, y, psize, psize);
        particles.add(new Particle(new PVector(x + origin.x, y + origin.y), section));
      }
    }
    // initialize ip array (index permutations)
    ip = new int[particles.size()];
    for (int i = 0; i < ip.length; i++) {
      ip[i] = i;
    }
    // make ip a random permutation of itself
    ip = next(ip);
  }

  // run particle system - display and animate
  void run() {
    // display parrticles at origin
    for (int i = idx; i < particles.size(); i++) {
      particles.get(ip[i]).display();
    }
    // animate falling or homing particles
    if (idx != 0) {
      for (int i = 0; i < idx; i++) {
        if (i < idx) {
          if (reassembling) {
            particles.get(ip[i]).home();
          }
          else {
            //particles.get(ip[i]).fall();
            particles.get(ip[i]).attract(a);
          }
        }
      }
    }
    // if previousle reassembling and everything in place its safe to reset state
    if (reassembling && allAtHome()) {
      reassembling = false;
      idx = 0;
      ip = next(ip);
    }
  }

  // display entire system
  void display() {
    Iterator<Particle> it = particles.iterator();
    while (it.hasNext ()) {
      Particle p = it.next();
      p.display();
    }
  }

  // drop n random particles
  void drop(int n) {
    int samples = (n + idx) <= ip.length ? n : ip.length - idx;
    idx += samples;
  }

  // start reassembling
  void reassemble() {
    reassembling = true;
  }

  // return random permutation of int array a
  int[] next(int[] a) {
    int[] b = (int[])a.clone();
    for (int k = b.length - 1; k > 0; k--) {
      int w = (int)Math.floor(Math.random() * (k+1));
      int temp = b[w];
      b[w] = b[k];
      b[k] = temp;
    }
    return b;
  }
  
  // all particles at origin checker
  boolean allAtHome() {
    boolean allhome = true;
    for (int i = 0; i < particles.size(); i++) {
      if (! particles.get(i).atOrigin()) {
        allhome = false;
        break;
      }
    }
    return allhome;
  }
  
  // explosion
  void explode() {
    a.location = new PVector(random(grx_right/2 - attRad, grx_right/2 + attRad), 
                             random(height/2 - attRad, height/2 + attRad));
    a.mass = (int)random(12, 30);
    a.G = random(0.1, 0.8);
    drop(particles.size());
  }
  
}

