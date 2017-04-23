class Goldfish extends Fish {
  Goldfish() {
    super();
    this.maxWeight = 30;
    this.weight = random(maxWeight/10,maxWeight/2);
    this.maxSpeed = 3;
    this.velocity = new PVector(random(-maxSpeed, maxSpeed), random(-maxSpeed, maxSpeed));
    this.maxAge = 20000;
    this.skin = color(242, random(43, 200), 43);
  }
}