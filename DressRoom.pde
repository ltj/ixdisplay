class DressRoom implements DisplayState {
  
  public DressRoom() {
    droom.play();
    droom.jump(0);
  }
  
  @Override
  public void run(final StateContext STATE_CONTEXT) {
    image(droom, 0, 0, 1920, 1080); // video image
    image(label_img, width-230, 150); // logo label
    if(droom.time() == droom.duration())
      next(STATE_CONTEXT);
  }
  
  @Override
  public void next(final StateContext STATE_CONTEXT) {
    STATE_CONTEXT.setState(new Home());
  }
  
}
