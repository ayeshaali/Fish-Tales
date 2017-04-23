class Fish {
  String name;
  PVector location, velocity;
  float maxSpeed;
  float weight;
  color skin, outline;
  int age;
  boolean isAlive; 
  int maxAge, maxWeight;
  float x;
  boolean gender;

  Fish() {
    x = random(1);
    if (x>.5) {
      this.gender = true;
    } else {
      this.gender = false;
    }
    this.maxSpeed=5;
    this.velocity = new PVector(random(-2, 2), random(-2, 2));
    this.location = new PVector(random(0, 600), random(0, 600));
    this.skin=color(random(255), 0, 0);
    this.outline=color(0);
    this.weight = 30;
    this.isAlive = true;
    this.maxAge = 1000;
    this.maxWeight = 150;
  }

  Fish(String name, float h, float w) {
    this.name=name;
    this.maxSpeed=5;
    this.velocity = new PVector(1, -1);
    this.location = new PVector(h, w);
    this.skin=color(0, random(255), 0);
    this.outline=color(0);
    this.weight=30;
    this.isAlive = true;
    this.maxAge = 1000;
  }//fish constructor

  public float getX() {
    return location.x;
  }
  public float getY() {
    return location.y;
  }

  public void update() {
    move();
    show();
    if (isAlive) {
      age++;
      weight+=.008;
      if (age>maxAge || weight>maxWeight || weight<(maxWeight*.1)) {
        isAlive= false;
        velocity.x =0;
        velocity.y = -1;
      }
    }
  }//update

  public void show() {
    fill(skin);
    stroke(outline);
    ellipse(location.x, location.y, weight, weight);
    //EYE & TAIl  
    if (velocity.x>0) {
      if (velocity.y>0) {
        fill(skin);
        triangle(location.x, location.y, (location.x), (location.y-(weight*.75)), (location.x-(weight*.75)), (location.y));
        fill(255); 
        ellipse(location.x+(weight/4), location.y+(weight/4), weight/3, weight/3);
        fill(0);
        ellipse(location.x+(weight/3.5), location.y+(weight/3.5), weight/6, weight/6);
      } else if (velocity.y<0) {
        fill(skin);
        triangle(location.x, location.y, (location.x), (location.y+(weight*.75)), (location.x-(weight*.75)), (location.y));
        fill(255); 
        ellipse(location.x+(weight/4), location.y-(weight/4), weight/3, weight/3);
        fill(0);
        ellipse(location.x+(weight/3.5), location.y-(weight/3.5), weight/6, weight/6);
      }
    } else if (velocity.x<0) {
      if (velocity.y>0) {
        fill(skin);
        triangle(location.x, location.y, (location.x), (location.y-(weight*.75)), (location.x+(weight*.75)), (location.y));
        fill(255); 
        ellipse(location.x-(weight/4), location.y+(weight/4), weight/3, weight/3);
        fill(0);
        ellipse(location.x-(weight/3.5), location.y+(weight/3.5), weight/6, weight/6);
      } else if (velocity.y<0) {
        fill(skin);
        triangle(location.x, location.y, (location.x), (location.y+(weight*.75)), (location.x+(weight*.75)), (location.y));
        fill(255); 
        ellipse(location.x-(weight/4), location.y-(weight/4), weight/3, weight/3);
        fill(0);
        ellipse(location.x-(weight/3.5), location.y-(weight/3.5), weight/6, weight/6);
      }
    } else if (velocity.x==0) {
      fill(255);
      ellipse(location.x, location.y+(weight/4), weight/3, weight/3);
      fill(0);
      ellipse(location.x, location.y+(weight/3.5), weight/6, weight/6);
    }
  } //show() 

  public void move() {
    location.add(velocity);
    if (isAlive) {
      if ((location.x > width-110) || (location.x < 0)) {
        velocity.x = velocity.x * -1;
      }

      if ((location.y > height) || (location.y < 0)) {
        velocity.y = velocity.y * -1;
      }
    } else if (location.y<5) {
      velocity.y = 0;
    }
  }//move()

  public String toString() { 
    return this.name+", "+this.age+" frames old. ";
  }

  public boolean hasCollision(Pellet p) {
    float distance = PVector.sub(p.location, this.location).mag();

    if (isAlive && distance< ((this.weight/2) +(p.weight/2))) {
      if (p.type == 1) {
        weight+= 5;
      } else if (p.type ==2) {
        weight-= 10;
      }
      return true;
    } 

    return false;
  }

  public boolean hasCollisionF(Fish f) {
    float distance = PVector.sub(f.location, this.location).mag();
    if (isAlive && distance< ((this.weight/3) +(f.weight/3))) {
      return true;
    }
    return false;
  }
}