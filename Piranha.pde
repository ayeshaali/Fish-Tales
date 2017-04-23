class Piranha extends Fish {
  Piranha() {
    super();
    this.maxWeight = 50;
    this.weight = random(maxWeight/10, maxWeight/2);
    this.maxSpeed = 2;
    this.velocity = new PVector(random(-maxSpeed, maxSpeed), random(-maxSpeed, maxSpeed));
    this.maxAge = 10000;
    this.skin = color(random(0, 255), 0, random(0, 255));
  }
}