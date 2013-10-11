public class StateContext {
  private DisplayState state;
  /**
   * Standard constructor
   */
  public StateContext(DisplayState s) {
    setState(s);
  }

  public void setState(final DisplayState NEW_STATE) {
    state = NEW_STATE;
  }

  public void run() {
    state.run(this);
  }
}

