import org.jbox2d.callbacks.ContactImpulse;
import org.jbox2d.callbacks.ContactListener;
import org.jbox2d.collision.Manifold;
import org.jbox2d.dynamics.contacts.Contact;

class CustomListener implements ContactListener {
  CustomListener() {
  }

  void beginContact(Contact cp) {
    Fixture f1 = cp.getFixtureA();
    Fixture f2 = cp.getFixtureB();
    Body b1 = f1.getBody();
    Body b2 = f2.getBody();
    Object o1 = b1.getUserData();
    Object o2 = b2.getUserData();
    
    if (o1.getClass() == Brick.class) {
      Brick br = (Brick) o1;
     br.hit();
    }else if(o2.getClass() == Brick.class) {
     Brick br = (Brick)o2;
      br.hit(); 
    }
  }

  void endContact(Contact contact) {
  }
  void preSolve(Contact contact, Manifold oldManifold) {
  }
  void postSolve(Contact contact, ContactImpulse impulse) {
  }
}

