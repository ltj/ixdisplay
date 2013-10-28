class Practical implements DisplayState {

  ParticleSystem system;
  int time;
  int interval;
  boolean explode;

  public Practical() {
    println(grx_right + " " + grx_left);
    println((grx_right/2-img.width/2) + " " + (height/2-img.height/2));
    system = new ParticleSystem(new PVector(grx_right/2-img.width/2, height/2-img.height/2), img, 20);
    time = millis();
    explode = true;
    interval = 10000;
    system.display();
  }

  @Override
  public void run(final StateContext STATE_CONTEXT) {
    system.run();

    if (time + interval < millis()) {
      if (explode) {
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

    fill(0);
    rect(grx_right, 0, width, height);
    fill(255);
    textFont(frutiger_l);
    textAlign(LEFT, TOP);
    text("Workshop\nopening hours", grx_right + 50, 50);
    text("Tuesday & Friday\n10:00 - 13:00", grx_right + 50, 290);
    text("IxD Lab", grx_right + 50, 600);
    text("itu.dk/ixdlab", grx_right + 50, 970);
  }
}

