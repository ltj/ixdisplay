class Rooms implements DisplayState {
  
  int start, totaltime;
  
  public Rooms() {
    totaltime = 60000;
    start = millis();
  }
  
  @Override
  public void run(final StateContext STATE_CONTEXT) {
    image( rooms_img, 0, 0);
    
    if(start + totaltime < millis()) {
      STATE_CONTEXT.setState(new Practical());
    }
   
  }
  
  private void display() {
  }
  
  private void update() {
  }
  
}
