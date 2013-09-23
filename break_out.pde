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
import processing.serial.*;

SyphonServer server;
Serial port;
int val;

final int BRICK_WIDTH = 30;
final int BRICK_HEIGHT=50;
final int BALL_SIZE=10;
final int MARGIN=2;
final int ROWS=4;

PGraphics canvas;
Pad pad;
Ball ball;
Wall wall;
Boundary b1,b2,b3;
PBox2D box2d;
boolean toCanvas = false;


void setup(){
  size(1024,768, P2D);
  canvas = createGraphics(width, height,P2D);
  // frameRate(60);
  canvas.noStroke();
  canvas.background(0);
  box2d = new PBox2D(this);
  box2d.createWorld();
  box2d.setGravity(random(-.1,.1),0);
  box2d.world.setContactListener(new CustomListener());
  server = new SyphonServer(this, "Break Out");
  
  pad = new Pad();
  ball =new Ball();
  wall = new Wall();
  b1 = new Boundary(0,0,1,height*2);
  b2 = new Boundary(width/2,0,width, 1);
  b3 = new Boundary(width,0,1,height*2);
  
  
  
  println(Serial.list());
  String name = Serial.list()[4];
  port = new Serial(this,name,9600);
  port.clear();
  String st = port.readStringUntil(10);
}


void draw(){
  while(port.available()>0){
   String st = port.readStringUntil(10); 
   if(st != null){
     st = trim(st);
     if(st.equals("111110") || st.equals("111101")){
       println(st);
       ball.killBody();
       ball = new Ball();
     }else{
      pad.move(st);
     } 
    
   }
  }
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
   ball.killBody();
   ball = new Ball();
 }
 
 if(key == CODED){
  switch(keyCode){
   case UP:
   case DOWN:
   case RIGHT:
   case LEFT:{
     pad.move(keyCode);
    break; 
   }
  } 
 }
  
}
