// globals
final StateContext SC = new StateContext();
PFont frutiger_l;
static final float phi = 1.61803;
static int grx_left, grx_right;
PImage img;

void setup() {
  size(1920, 1080);
  smooth();
  
  // load global fonts, images etc.
  img = loadImage("logo.png");
  grx_right = int(width / phi);
  grx_left = width - grx_right;
  frutiger_l = createFont("FrutigerLTStd-Light", 70, true);
//  String[] fontList = PFont.list();
//  println(fontList);
  
  // set first state - must be done last! (sigh)
  SC.setState(new Practical());
  background(255);
}

void draw() {
  background(255);
  
  SC.run();
}
