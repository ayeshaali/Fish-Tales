class Pellet {
  PVector location, velocity;
  float weight;
  color hue;
  int type; //poisonous or no; 1 is food, 2 is poison

  Pellet(int t) {
    this.velocity = new PVector(0, 1);
    this.location = new PVector(random(width-100), 0);
    this.weight = 4;
    type = t;
    if (type ==1) { // food green.
      hue = color(0, 255, 0);
    } else { //poison red.
      hue = color(255, 0, 0);
    }
  }  

  void update() {
    show();
    if (location.y<599) {
      move();
    }
  }

  void move() {
    location.add(velocity);
  }

  void show() {
    fill(hue);
    ellipse(location.x, location.y, weight, weight);
  }
}