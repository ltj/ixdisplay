class Horizon {

  float noiset1;
  float noiset2;
  float noiset3;
  float noiset4;

  Horizon() {
    noiset1 = random(0, 1000);
    noiset2 = random(0, 1000);
  }

  void display() {
    float n1 = noise(noiset1);
    float n2 = noise(noiset2);
    float xt = map(n1, 0, 1, 0, displayWidth);
    float xb = map(n2, 0, 1, 0, displayWidth);

    noStroke();
    fill((int) map(n1, 0, 1, 15, 240));
    quad(0, 0, xt, 0, xb, displayHeight, 0, displayHeight);
    fill((int) map(n2, 0, 1, 15, 240));
    quad(xt, 0, displayWidth, 0, displayWidth, displayHeight, xb, displayHeight);
    stroke(240);
    line(xt, 0, xb, displayHeight);
    noiset1 += 0.0008;
    noiset2 += 0.0008;
  }


}

