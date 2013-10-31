class DressRoom implements DisplayState {
  
  public DressRoom() {
    droom.play();
    droom.jump();
  }
  
  @Override
  public void run(final StateContext STATE_CONTEXT) {
    image(droom, 0, 0, 1920, 1080);
    if(droom.time() == droom.duration())
      STATE_CONTEXT.setState(new Home());
  }
  
}
