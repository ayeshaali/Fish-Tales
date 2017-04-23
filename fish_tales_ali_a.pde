/* Project: Fish Tales
 Author: Ayesha Ali
 Notes: The extra credit I did includes 
 -the gender variable to create new fish
 -circular buttons
 -a tail
 -air bubbles occassionally
 
 Also, the clean the tank button is not for cleaning ammonia
 It is for removing any pellets on the screen to keep the fish from dying
 if they hit the bottom of the screen and to remove any dead fish.
 */

ArrayList<Fish> fishList = new ArrayList<Fish>();
ArrayList<Pellet> pelletList = new ArrayList<Pellet>();
int count = 0;
int x = 650;
void setup() {
  size(700, 600);
}

void draw() {
  count++;
  background(113, 244, 255);
  Buttons();

  for (int i=0; i<fishList.size(); i++) {
    fishList.get(i).update();
    for (int p=0; p<pelletList.size(); p++) {
      if (fishList.get(i).hasCollision(pelletList.get(p))) {
        pelletList.remove(p);
      }
    }
  }

  for (int i = 0; i<fishList.size(); i++) {
    Fish f1 = fishList.get(i);

    for (int j = 1+i; j<fishList.size(); j++) {
      Fish f2 = fishList.get(j);
      if (f1.hasCollisionF(f2)) {
        if (f1 instanceof Piranha && f2 instanceof Goldfish) {
          f1.weight+= f2.weight*.25;
          fishList.remove(f2);
          j--;
        } else if (f1 instanceof Goldfish && (f2 instanceof Piranha || f2 instanceof Whale)) {
          f2.weight+= f1.weight*.25;
          fishList.remove(f1);
          i--;
        } else if (f1 instanceof Whale && (f2 instanceof Goldfish || f2 instanceof Piranha)) {
          f1.weight+= f2.weight*.25;   
          fishList.remove(f2);
          j--;
        } else {
          f1.velocity.mult(-1);
          f2.velocity.mult(-1);
          if (f1.gender == true && f2.gender==false || f1.gender == false && f2.gender==true) {
            if (f1 instanceof Goldfish && f2 instanceof Goldfish) {
              fishList.add(new Goldfish());
            } else if (f1 instanceof Piranha && f2 instanceof Piranha) {
              fishList.add(new Piranha());
            } else if (f1 instanceof Whale && f2 instanceof Whale) {
              fishList.add(new Piranha());
            }
          }
        }
      }
    }
  }

  for (int p=0; p<pelletList.size(); p++) {
    pelletList.get(p).update();
  }

  if (count>1000 &&count<1500) {
    fill(113, 244, 255);
    stroke(0);
    ellipse(150, x, 10, 10);
    ellipse(160, x+5, 10, 10);
    ellipse(140, x+5, 10, 10);
    x-=2;
  } else if (count>3000) {
    count=0;
    x=650;
  }
}

void mousePressed() {
  pelletButtons();
  fishButtons();
}

void Buttons() {
  // white box
  fill(255);
  rect(600, 0, 100, 600); 

  //food- green 
  fill(0, 255, 0);
  ellipse(650, 60, 60, 60); 
  fill(0);
  text("Feed", 637, 65);

  //poison- red
  fill(255, 0, 0);
  ellipse(650, 140, 60, 60); 
  fill(0);
  text("Poison", 632, 145);

  //goldfish
  fill(243, 183, 43);
  ellipse(650, 220, 60, 60);
  fill(0);
  text("Goldish", 630, 225);

  //Whale
  fill(25, 25, 112);
  ellipse(650, 300, 60, 60);
  fill(255);
  text("Whale", 632, 305);

  //Piranha
  fill(210, 46, 46);
  ellipse(650, 380, 60, 60);
  fill(255);
  text("Piranha", 631, 385);

  //tap the tank
  fill(0, 0, 255);
  ellipse(650, 460, 60, 60);
  fill(255);
  text("Tap", 640, 458);
  text("the Tank", 627, 470);

  //semi clean the tank
  fill(150);
  ellipse(650, 540, 60, 60);
  fill(0);
  text("Semi Clean", 621, 538);
  text("the Tank", 627, 550);
}


void pelletButtons () {
  if (mouseX>=620 && mouseX<=670) {
    //food button
    if (mouseY >= 30 && mouseY<=90) {
      for (int i=0; i<8; i++) {
        pelletList.add(new Pellet(1));
      }
    }
    //poison putton
    else if (mouseY>=110  && mouseY<=170) {
      for (int i=0; i<8; i++) {
        pelletList.add(new Pellet(2));
      }
    }
    //tap the tank
    else if (mouseY> 430 && mouseY<490) {
      for (int i = 0; i<fishList.size(); i++) {
        if (fishList.get(i).isAlive) {
          fishList.get(i).velocity.mult(-1);
        }
      }
    } 
    //semi clean the tank
    else if (mouseY> 510 && mouseY<570) {
      for (int i=0; i<fishList.size(); i++) {
        if (fishList.get(i).isAlive == false) {
          fishList.remove(i);
        }
      }
      pelletList.clear();
    }
  }
}

void fishButtons() {
  if (mouseX>=620 && mouseX<=670) {
    //goldfish
    if (mouseY>190 && mouseY<250) {
      for (int i=0; i<4; i++) {
        fishList.add(new Goldfish());
      }
    }
    if (mouseY>270 && mouseY<330) {
      for (int i=0; i<4; i++) {
        fishList.add(new Whale());
      }
    }
    if (mouseY>350 && mouseY<410) {
      for (int i=0; i<4; i++) {
        fishList.add(new Piranha());
      }
    }
  }
}