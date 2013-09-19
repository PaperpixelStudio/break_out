class Ball {

  Body body;
  public Ball() {
    float x=random(width);
    float y = random(250, height/2);

    BodyDef bd = new BodyDef();
    bd.type=BodyType.DYNAMIC;
    bd.position.set(box2d.coordPixelsToWorld(x, y));
    bd.bullet = true;
    body = box2d.createBody(bd);
    CircleShape cs = new CircleShape();
    cs.m_radius = box2d.scalarPixelsToWorld(BALL_SIZE);
    FixtureDef fd = new FixtureDef();
    fd.shape = cs;
    fd.friction = 0.0;
    fd.restitution = 1;
    body.setLinearVelocity(new Vec2(0, -20));
    body.createFixture(fd);
    body.setUserData(this);
  } 

  void killBody() {
    box2d.destroyBody(body);
  }

  boolean done() {
    Vec2 pos = box2d.getBodyPixelCoord(body);
    if (pos.y>height+BALL_SIZE) {
      killBody();
      return true;
    }
    return false;
  }

  void render() {
    display();
  }
  void render(boolean toCanvas) {
    if (toCanvas) {
      displayToCanvas();
    }
    else {
      display();
    }
  }
  void displayToCanvas() {
    Vec2 pos = box2d.getBodyPixelCoord(body);
    canvas.pushMatrix();
    canvas.translate(pos.x, pos.y);
    canvas.fill(255);
    canvas.noStroke();
    canvas.ellipse(0, 0, BALL_SIZE, BALL_SIZE);
    canvas.popMatrix();
  }
  void display() {
    Vec2 pos = box2d.getBodyPixelCoord(body);
    pushMatrix();
    translate(pos.x, pos.y);
    fill(255);
    noStroke();
    ellipse(0, 0, BALL_SIZE, BALL_SIZE);
    popMatrix();
  }
}

