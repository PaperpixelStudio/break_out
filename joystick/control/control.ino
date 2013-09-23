/*
 Joystick test Sketch
 
 1  2  3  4  5
  6  7  8  9
  
 2 = RIGHT
 3 = LEFT 
 4 = BOTTOM
 5 = UP
 7 = ground
 8 = FIRE
 9 = TRIGGER
 
 
 Reads the digital direction and button state from Atari compatible joystick.
 Some code reused from the Sparkfun joystick shield test sketch.
*/
//Variables for the buttons
char buttonUp=5, buttonDown=4, buttonLeft=3, buttonRight=2;
char buttonFire=8, buttonTrigger=9;

void setup(void)
{

 pinMode(buttonUp, INPUT);
 digitalWrite(buttonUp, HIGH); //Enable the pull-up resistor
pinMode(buttonDown, INPUT);
 digitalWrite(buttonDown, HIGH); //Enable the pull-up resistor

 pinMode(buttonLeft, INPUT);
 digitalWrite(buttonLeft, HIGH); //Enable the pull-up resistor
pinMode(buttonRight, INPUT);
 digitalWrite(buttonRight, HIGH); //Enable the pull-up resistor

 pinMode(buttonFire, INPUT);
 digitalWrite(buttonFire, HIGH); //Enable the pull-up resistor 

 pinMode(buttonTrigger, INPUT);
 digitalWrite(buttonTrigger, HIGH); //Enable the pull-up resistor 

 Serial.begin(9600); //Turn on the Serial Port at 9600 bps
}
void loop(void)
{
 Serial.print(digitalRead(buttonUp)); //Read the value of the button up and print it on the serial port.
 Serial.print(digitalRead(buttonDown)); //Read the value of the button down and print it on the serial port.
 Serial.print(digitalRead(buttonLeft)); //Read the value of the button left and print it on the serial port.
 Serial.print(digitalRead(buttonRight)); //Read the value of the button right and print it on the serial port.
 Serial.print(digitalRead(buttonFire)); //Read the value of the button fire and print it on the serial port.
 Serial.println(digitalRead(buttonTrigger)); //Read the value of the button fire and print it on the serial port.

 //Wait for 100 ms, then go back to the beginning of 'loop' and repeat.
 delay(100);
}
