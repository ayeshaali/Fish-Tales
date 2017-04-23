class Whale extends Fish {
  Whale() {
    super();
    this.maxWeight = 100;
    this.weight = random(maxWeight/10, maxWeight/2);
    this.maxSpeed = 1;
    this.velocity = new PVector(random(-maxSpeed, maxSpeed), random(-maxSpeed, maxSpeed));
    this.maxAge = 30000;
    this.skin = color(random(0, 200));
  }
}