class Home implements DisplayState {

  ParticleSystem system;
  int time, start;
  int interval, totaltime;
  boolean explode;
  PImage img, bgimg;

  public Home() {
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
         next(STATE_CONTEXT);
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
  }
  
  @Override
  public void next(final StateContext STATE_CONTEXT) {
    STATE_CONTEXT.setState(new Rooms());
  }
  
}

