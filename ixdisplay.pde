import seltar.motion.*;
import processing.video.*;

// globals
final StateContext SC = new StateContext();
static final float phi = 1.61803;
static int grx_left, grx_right;
PImage logo_img, rooms_img, practical_img, label_img;
Movie droom;

void setup() {
  size(1920, 1080);
  smooth();
  
  // load global fonts, images etc.
  logo_img = loadImage("logo.png");
  rooms_img = loadImage("rooms-page-2.png");
  practical_img = loadImage("practical-page.png");
  label_img = loadImage("label.png");
  droom = new Movie(this, "dressroom.mp4");
  grx_right = int(width / phi);
  grx_left = width - grx_right;
  
  // set first state - must be done last! (sigh)
  SC.setState(new Home());
  background(255);
  println(grx_right);
}

void draw() {
  background(255);
  
  SC.run();
}

void movieEvent(Movie m) {
  m.read();
}

void keyPressed() {
  if(key == 'n') {
    SC.next();
  }
}
  
