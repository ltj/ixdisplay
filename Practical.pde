class Practical implements DisplayState {
  
  public Practical() {
  }
  
  @Override
  public void run(final StateContext STATE_CONTEXT) {
    fill(0);
    rect(grx_right, 0, width, height);
    fill(255);
    textFont(frutiger_l);
    textAlign(LEFT, TOP);
    text("Workshop\nopening hours", grx_right + 50, 50);
    text("Tuesday & Friday\n10:00 - 13:00", grx_right + 50, 400);
  }
  
}
