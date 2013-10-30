class Practical implements DisplayState {

  ParticleSystem system;
  int time, start;
  int interval, totaltime;
  boolean explode;
  PImage img, bgimg;

  public Practical() {
    img = logo_img;
    bgimg = practical_img;
    system = new ParticleSystem(new PVector(grx_right/2-img.width/2, height/2-img.height/2), img, 20);
    time = millis();
    explode = true;
    interval = 10000;
    totaltime = 60000;
    system.display();
    start = millis();
  }

  @Override
  public void run(final StateContext STATE_CONTEXT) {
    
    image(bgimg, 0, 0);
    system.run();

    if (time + interval < millis()) {
      if (explode) {
        if(start + totaltime < millis()) {
         STATE_CONTEXT.setState(new Rooms());
        } 
        system.explode();
        explode = false;
      }
      else {
        system.reassemble();
        explode = true;
      }
      time = millis();
      interval = (int)random(10000, 30000);
    }

//    fill(0);
//    rect(grx_right, 0, width, height);
//    fill(255);
//    textFont(frutiger_l);
//    textAlign(LEFT, TOP);
//    text("Workshop\nopening hours", grx_right + 50, 50);
//    text("Tuesday & Friday\n10:00 - 13:00", grx_right + 50, 290);
//    text("IxD Lab", grx_right + 50, 600);
//    text("itu.dk/ixdlab", grx_right + 50, 970);
  }
}

