import pbox2d.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.joints.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.collision.shapes.Shape;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;
import org.jbox2d.dynamics.contacts.*;
import java.util.Iterator;
import codeanticode.syphon.*;

SyphonServer server;

final int BRICK_WIDTH = 30;
final int BRICK_HEIGHT=50;
final int BALL_SIZE=10;
final int MARGIN=2;

PGraphics canvas;
Pad pad;
Ball ball;
Wall wall;
Boundary b1,b2,b3;
PBox2D box2d;
boolean toCanvas = true;


void setup(){
  size(1024,768, P2D);
  canvas = createGraphics(width, height,P2D);
  // frameRate(60);
  canvas.noStroke();
  canvas.background(0);
  box2d = new PBox2D(this);
  box2d.createWorld();
  box2d.setGravity(0,0);
  box2d.world.setContactListener(new CustomListener());
  server = new SyphonServer(this, "Break Out");
  
  pad = new Pad();
  ball =new Ball();
  wall = new Wall();
  b1 = new Boundary(0,0,1,height*2);
  b2 = new Boundary(width/2,0,width, 1);
  b3 = new Boundary(width,0,1,height*2);
}


void draw(){
  
  box2d.step();
  if(toCanvas){
    
    canvas.beginDraw();
    canvas.background(0);
  }else{
    background(0);
  }  
   wall.act(toCanvas);
  pad.render(toCanvas);
  ball.render(toCanvas);
  if(toCanvas){
    canvas.endDraw();
    //image(canvas,0,0);
    server.sendImage(canvas);
  }
}

void displayBoundaries(){
  /*
  b1.display();
  b2.display();
  b3.display();
  */
}
void keyPressed(){
 
 
 if(key == ' '){
   ball = new Ball();
 }
  
}
