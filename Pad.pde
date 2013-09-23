class Pad {

  Body body;
  float h, w;
  float x, y;


  public Pad() {
    x = width/2;
    y = height-10;
    BodyDef bd = new BodyDef();
    bd.type=BodyType.KINEMATIC;
    bd.position.set(box2d.coordPixelsToWorld(width/2, y));
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

  void move(int pos) {
    
    if(pos == LEFT && x > 70){
      x-=55;
    }
    if(pos == RIGHT && x < width-70){
     x+=55;
    }
    if(pos == UP && y > ROWS*BRICK_HEIGHT*2){
     y-=55;
     
    }
    if(pos == DOWN && y < height-10){
     y+=55;
    } 

  }
  void move(String st){
    
   if(st.equals("011111")){
    move(UP);
   } 
   if(st.equals("101111")){
    move(DOWN);
   } 
   if(st.equals("110111")){
     move(LEFT);
   }
   if(st.equals("111011")){
    move(RIGHT); 
   }
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
    Vec2 target = box2d.coordPixelsToWorld(x, y);
    Vec2 sub = target.sub(pos);
    body.setLinearVelocity(sub.mulLocal(16)); 
    Vec2 pos2 = box2d.getBodyPixelCoord(body);
    canvas.pushMatrix();
    canvas.translate(pos2.x,pos2.y);
    canvas.rectMode(CENTER);
    canvas.fill(255);
    canvas.rect(0,0,70*2,10*2);
    canvas.popMatrix();
  }
  void display() {
    Vec2 pos = body.getWorldCenter();
    Vec2 target = box2d.coordPixelsToWorld(x, y);
    Vec2 sub = target.sub(pos);
    body.setLinearVelocity(sub.mulLocal(8)); 
    Vec2 pos2 = box2d.getBodyPixelCoord(body);
    pushMatrix();
    translate(pos2.x, pos2.y);
    rectMode(CENTER);
    fill(255);
    
    rect(0, 0, 70*2, 10*2);
    popMatrix();
  }
}

