class Pad {

  Body body;
  float h, w;


  public Pad() {
    BodyDef bd = new BodyDef();
    bd.type=BodyType.KINEMATIC;
    bd.position.set(box2d.coordPixelsToWorld(width/2, height-30));
    body = box2d.createBody(bd);
    body.setUserData(this);
    PolygonShape ps = new PolygonShape();
    float box2dW = box2d.scalarPixelsToWorld(70);
    float box2dH = box2d.scalarPixelsToWorld(10);
    ps.setAsBox(box2dW, box2dH);
    FixtureDef fd = new FixtureDef();
    fd.shape = ps;
    fd.friction = 0.1;
    fd.restitution = 1.2;
    body.createFixture(fd);
  }

  void move() {
  }
  
  void render(boolean toCanvas){
   if(toCanvas){
    displayToCanvas();
   }else{
     display();
   } 
  }
  void displayToCanvas(){
     Vec2 pos = body.getWorldCenter();
    Vec2 target = box2d.coordPixelsToWorld(mouseX, height-10);
    Vec2 sub = target.sub(pos);
    body.setLinearVelocity(sub.mulLocal(4)); 
    Vec2 pos2 = box2d.getBodyPixelCoord(body);
    canvas.pushMatrix();
    canvas.translate(pos2.x,pos2.y);
    canvas.rectMode(CENTER);
    canvas.fill(255);
    canvas.rect(0,0,70,10);
    canvas.popMatrix();
  }
  void display() {
    Vec2 pos = body.getWorldCenter();
    Vec2 target = box2d.coordPixelsToWorld(mouseX, height-10);
    Vec2 sub = target.sub(pos);
    body.setLinearVelocity(sub.mulLocal(4)); 
    Vec2 pos2 = box2d.getBodyPixelCoord(body);
    pushMatrix();
    translate(pos2.x, pos2.y);
    rectMode(CENTER);
    fill(255);
    
    rect(0, 0, 70, 10);
    popMatrix();
  }
}

