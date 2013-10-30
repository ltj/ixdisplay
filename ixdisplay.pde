// globals
final StateContext SC = new StateContext();
PFont frutiger_l;
static final float phi = 1.61803;
static int grx_left, grx_right;
PImage logo_img, rooms_img, practical_img;

void setup() {
  size(1920, 1080);
  smooth();
  
  // load global fonts, images etc.
  logo_img = loadImage("logo.png");
  rooms_img = loadImage("rooms-page.png");
  practical_img = loadImage("practical-page.png");
  grx_right = int(width / phi);
  grx_left = width - grx_right;
  frutiger_l = createFont("FrutigerLTStd-Light", 70, true);
//  String[] fontList = PFont.list();
//  println(fontList);
  
  // set first state - must be done last! (sigh)
  SC.setState(new Practical());
  background(255);
  println(grx_right);
}

void draw() {
  background(255);
  
  SC.run();
}
