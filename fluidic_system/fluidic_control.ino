// constants won't change. They're used here to
// set pin numbers:
const int buttonPin = 8;     // the number of the pushbutton pin
const int ledPin =  13;      // the number of the LED pin - RED LED 
int pinLedStart=12;          //Declare pin 12 for controlling the GREEN LED   12= Green LED(Feeding Pumps)
int pinPump=9;              //Declare pin 9 for controlling the pump
int pump2 =6;
int pump3=5;
int pump4=3;
int pump5=11;
int pump6=10;

// variables will change:
int buttonState = 0;         // variable for reading the pushbutton status
int ledState = LOW;         // the current state of the output pin
int Greenled = LOW;
//int buttonState;             // the current reading from the input pin
int lastButtonState = LOW;   // the previous reading from the input pin
int pumpOn = LOW;     //for washing pumps 
int pumpOn1 = LOW;    //for feeding pumps

void setup() {
  pinMode(buttonPin, INPUT);
  pinMode(ledPin, OUTPUT);       //Red LED
  pinMode(pinLedStart, OUTPUT);   //Green LED
  pinMode(pinPump, OUTPUT);
  pinMode(pump2, OUTPUT);
  pinMode(pump3, OUTPUT);
  pinMode(pump4, OUTPUT);
  pinMode(pump5, OUTPUT);
  pinMode(pump6, OUTPUT);

  // set initial LED state
  digitalWrite(ledPin, ledState);
  digitalWrite(pinLedStart, Greenled);
  digitalWrite(pinPump,pumpOn); 
  digitalWrite(pump2,pumpOn);
  digitalWrite(pump3,pumpOn);
  digitalWrite(pump4,pumpOn1);
  digitalWrite(pump5,pumpOn1);
  digitalWrite(pump6,pumpOn1);
}

void loop() {
  // Washing Pumps***************************************************************
  buttonState = digitalRead(buttonPin);
   if (buttonState == HIGH) {
    // turn LED on:
   digitalWrite(ledPin, HIGH);     //turning on RED LED
   pumpOn=HIGH;                    //turning the pump on
                                   //turning on Washing pumps 
   digitalWrite(pump6,pumpOn);     //turning on pump 6= pin 10
   digitalWrite(pump2,pumpOn);       //turning on pump 2= pin 6
   digitalWrite(pump4,pumpOn);       //turning on pump 4= pin 3
      
    delay (60000);                  //Keeps pumps running for 1 min 

      // turn LED off:
    digitalWrite(ledPin, LOW);
    pumpOn=LOW;        //turning the pump off
   //turning off Washing pumps 
   digitalWrite(pump6,pumpOn);     //turning off pump 6= pin 10
   digitalWrite(pump2,pumpOn);       //turning off pump 2= pin 6
   digitalWrite(pump4,pumpOn);       //turning off pump 4= pin 3

   delay (2000);                    //Turns off pumps for 2 seconds
//Feeding Pumps*******************************************************************
   digitalWrite(pinLedStart, HIGH);    //turning on GREEN LED
    pumpOn1=HIGH;        //turning the pump on
   //turning on Washing pumps 
   digitalWrite(pinPump,pumpOn1);     //turning on pump = pin 9
   digitalWrite(pump3,pumpOn1);       //turning on pump 3= pin 5
   digitalWrite(pump5,pumpOn1);       //turning on pump 5= pin 11

   delay (60000);                  //Keeps pumps running for 1 min 

  digitalWrite(pinLedStart, LOW);
    pumpOn1=LOW;        //turning the pump off
   //turning off Washing pumps 
   digitalWrite(pinPump,pumpOn1);     //turning on pump = pin 9
   digitalWrite(pump3,pumpOn1);       //turning on pump 3= pin 5
   digitalWrite(pump5,pumpOn1);       //turning on pump 5= pin 11

   delay (2000);                    //Turns off pumps for 2 seconds
     } 
  }
