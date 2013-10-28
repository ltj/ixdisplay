interface DisplayState {
  void run(final StateContext STATE_CONTEXT);
}

public class StateContext {
  private DisplayState state;
  /**
   * Standard constructor
   */
  public StateContext(DisplayState s) {
    setState(s);
  }
  
  public StateContext() {
  }

  public void setState(final DisplayState NEW_STATE) {
    state = NEW_STATE;
  }

  public void run() {
    state.run(this);
  }
}
