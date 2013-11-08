class Rooms implements DisplayState {

  int start, totaltime, time, interval;
  Point[] lbpos = {
    new Point(404, 647), new Point(586, 962), new Point(1071, 962), 
    new Point(1294, 577)
  };
  Point[] dbpos = {
    new Point(1125, 647), new Point(1249, 433), new Point(1493, 433), 
    new Point(1569, 565)
  };
  ArrayList<Ball> balls = new ArrayList<Ball>();
  color c_lab = color(0x38, 0x69, 0xF0);
  color c_dirty = color(0xCF, 0x28, 0xD5);

  public Rooms() {
    totaltime = 120000;
    interval = 1000;
    start = millis();
    time = millis();
  }

  private class Ball {
    int wpindex;
    Point[] waypoints;
    Motion m;
    color c;
    float size;
    boolean isDead = false;

    Ball(Point[] waypoints, color c, Point start) {
      wpindex = 0;
      this.waypoints = waypoints;
      m = new Motion(start.getX(), start.getY(), 4, 4);
      m.Const = 30;
      this.c = c;
      size = random(5, 24);
    }

    void display() {
      stroke(255);
      fill(c);
      ellipse(m.getX(), m.getY(), size, size);
    }

    void update() {
      if (wpindex < waypoints.length) {
        m.followTo(waypoints[wpindex].getX(), waypoints[wpindex].getY());
        m.move();
        if (m.getDistanceTo(waypoints[wpindex].getX(), waypoints[wpindex].getY()) < 2) {
          m.setX(waypoints[wpindex].getX());
          m.setY(waypoints[wpindex].getY());
          wpindex++;
        }
      }
      else {
        isDead = true;
      }
    }

    void run() {
      update();
      display();
    }
  }

  @Override
    public void run(final StateContext STATE_CONTEXT) {
    image( rooms_img, 0, 0);

    for (int i = balls.size()-1; i >= 0; i--) {
      Ball b = balls.get(i);
      b.run();
      if (b.isDead) balls.remove(i);
    }

    if (time + interval < millis()) {
      balls.add(new Ball(lbpos, c_lab, new Point(343, 647)));
      balls.add(new Ball(dbpos, c_dirty, new Point(925, 647)));
      time = millis();
      interval = (int)random(500, 5000);
    }

    if (start + totaltime < millis()) {
      next(STATE_CONTEXT);
    }
  }

  @Override
    public void next(final StateContext STATE_CONTEXT) {
    STATE_CONTEXT.setState(new DressRoom());
  }
}

