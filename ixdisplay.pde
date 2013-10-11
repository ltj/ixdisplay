final StateContext SC = new StateContext(new Practical());
PFont frutiger_l;
static final float phi = 1.61803;
int grx_left, grx_right;

void setup() {
  size(1920, 1280, P3D);
  grx_right = int(width / phi);
  grx_left = width - grx_left;
//  String[] fontList = PFont.list();
//  println(fontList);
  frutiger_l = createFont("FrutigerLTStd-Light", 70, true);
}

void draw() {
  background(255);
  
  SC.run();
}
