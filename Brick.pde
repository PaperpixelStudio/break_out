class Brick {
  float x, y;
  float w, h;
  int life;
  boolean hit=false;

  Body b;

  public Brick(float _x, float _y) {
    x =_x;
    y = _y; 
    life = 1;
    w=BRICK_WIDTH;
    h=BRICK_HEIGHT;
    setupBody();
    b.setUserData(this);
  }
 
  void setupBody() {
    BodyDef bd = new BodyDef();
    bd.type = BodyType.STATIC;
    bd.position.set(box2d.coordPixelsToWorld(x, y));
    b = box2d.createBody(bd);
    PolygonShape ps = new PolygonShape();
    float box2dW = box2d.scalarPixelsToWorld(w/2);
    float box2dH = box2d.scalarPixelsToWorld(h/2);
    ps.setAsBox(box2dW,box2dH);
    
    b.createFixture(ps,1);
  }

  void killBody(){
   box2d.destroyBody(b); 
  }
  
  void display() {
    Vec2 pos = box2d.getBodyPixelCoord(b);
    pushMatrix();
    translate(pos.x,pos.y);
    rectMode(CENTER);
    
    noStroke();
    rect(0,0,w,h);
    popMatrix();
  }
  
  void hit(){
    life--;
  }
  boolean isDead(){
   return life <= 0; 
  }
  void explode() {
  }
}

