class Wall {

  ArrayList<Brick> bricks;
  PVector position;

  public Wall() {
    setup();
  }


  private void setup() {
    bricks = new ArrayList<Brick>();
    for (int i = 0; i <= width-BRICK_WIDTH/2; i+=BRICK_WIDTH+MARGIN) {
      for (int j = 0; j < 200; j+=BRICK_HEIGHT + MARGIN) {
        Brick b = new Brick(i+BRICK_WIDTH/2, j+BRICK_HEIGHT/2);
        bricks.add(b);
      }
    }
  }
  void act() {
    checkBricks();
    display();
  }
  void checkBricks() {
    Iterator<Brick> it = bricks.iterator();
    while (it.hasNext ()) {
      Brick b = it.next();
      if (b.isDead()) {
        b.killBody();
        it.remove();
      }
    }
  }

  void reset() {
    bricks = null;
    setup();
  }

  void display() {
    colorMode(HSB);
    fill(frameCount%255, 200, 200);
    for (Brick b:bricks) {

      b.display();
    }
  }

  void check() {
  }
}

