import pbox2d.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.joints.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.collision.shapes.Shape;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;
import org.jbox2d.dynamics.contacts.*;
import java.util.Iterator;

final int BRICK_WIDTH = 30;
final int BRICK_HEIGHT=50;
final int BALL_SIZE=10;
final int MARGIN=2;
Pad pad;
Ball ball;
Wall wall;
Boundary b1,b2,b3;
PBox2D box2d;


void setup(){
  size(1024,768);
  frameRate(60);
  noStroke();
  box2d = new PBox2D(this);
  box2d.createWorld();
  box2d.setGravity(0,0);
  box2d.world.setContactListener(new CustomListener());
  
  pad = new Pad();
  ball =new Ball();
  wall = new Wall();
  b1 = new Boundary(0,0,1,height*2);
  b2 = new Boundary(width/2,0,width, 1);
  b3 = new Boundary(width,0,1,height*2);
}


void draw(){
  background(0);
  box2d.step();
  
  pad.display();
  wall.act();
  ball.display();
  
}

void displayBoundaries(){
  b1.display();
  b2.display();
  b3.display();
}
void keyPressed(){
 
 
 if(key == ' '){
   ball = new Ball();
 }
  
}
