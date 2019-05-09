int sensorPin1 = A0;
int sensorPin2 = A1;
int sensorPin3 = A2;
int sensorPin4 = A3;
int PWM1 = 5;
int PWM2 = 6;
int PWM3 = 9;
int PWM4 = 10;
int sensorVal1;
int sensorVal2;
int sensorVal3;
int sensorVal4;
int PWMVal1=20;
int PWMVal2=20;
int PWMVal3=20;
int PWMVal4=20;

//int sensorInput;    //The variable we will use to store the sensor input
double temp1;        //The variable we will use to store temperature in degrees.
double temp2;
double temp3;
double temp4;  

void setup() {
  // put your setup code here, to run once:
  pinMode(sensorPin1, INPUT);
  pinMode(sensorPin2, INPUT);
  pinMode(sensorPin3, INPUT);
  pinMode(sensorPin4, INPUT);
  pinMode(PWM1, OUTPUT);
  pinMode(PWM2, OUTPUT);
  pinMode(PWM3, OUTPUT);
  pinMode(PWM4, OUTPUT);
  Serial.begin(9600);
}

void loop() {
  // put your main code here, to run repeatedly:
  //this code prints sensor value to the console
  sensorVal1 = analogRead(sensorPin1);
  sensorVal2 = analogRead(sensorPin2);
  sensorVal3 = analogRead(sensorPin3);
  sensorVal4 = analogRead(sensorPin4);
/*
  Serial.print("Voltage from the temperature sensor1: ");Serial.println(sensorVal1);
  Serial.print("Voltage from the temperature sensor2: ");Serial.println(sensorVal2);
  Serial.print("Voltage from the temperature sensor3: ");Serial.println(sensorVal3);
  Serial.print("Voltage from the temperature sensor4: ");Serial.println(sensorVal4);
*/
  
  //set upper limit cap on sensor value.   
  if(sensorVal1 >200){
    sensorVal1 = 200;
  }
  
 if(sensorVal2 >200){
    sensorVal2 = 200;
  }
  
  if(sensorVal3 >200){
    sensorVal3 = 200;
  }
  
  if(sensorVal4 >200){
    sensorVal4 = 200;
  }
  //map and assign pwm values to the fan output 0 to 255 corresponds to 0 to 100%
  PWMVal1=map(sensorVal1, 120, 200, 20, 255); // syntax is as follows: map(value;fromLow,fromHigh,toLow,toHigh) 
                                              // 160 approximately 25.68(around 26)                                                                             //Re-maps a number from one range to another. 
                                                                                                                            //That is, a value of fromLow would get mapped to toLow, 
                                                                                                                            //a value of fromHigh to toHigh, values in-between to values in-between, etc.
   //map and assign pwm values to the fan output 0 to 255 corresponds to 0 to 100%
  PWMVal2 = map(sensorVal2, 120, 200, 20, 255); // syntax is as follows: map(value;fromLow,fromHigh,toLow,toHigh) 
                                              // 160 approximately 25.68(around 26)                                                                             //Re-maps a number from one range to another. 
                                                                                                                            //That is, a value of fromLow would get mapped to toLow, 
                                                                                                                            //a value of fromHigh to toHigh, values in-between to values in-between, etc.
  
  
  //map and assign pwm values to the fan output 0 to 255 corresponds to 0 to 100%
  PWMVal3 = map(sensorVal3, 120, 200, 20, 255); // syntax is as follows: map(value;fromLow,fromHigh,toLow,toHigh) 
                                              // 160 approximately 25.68(around 26) 

//                                             //map and assign pwm values to the fan output 0 to 255 corresponds to 0 to 100%
  PWMVal4 = map(sensorVal4, 120, 200, 20, 255); // syntax is as follows: map(value;fromLow,fromHigh,toLow,toHigh) 
//                                              // 160 approximately 25.68(around 26) 
 

//  Serial.print("pwm value Fan 2: ");Serial.println(PWMVal2);
  //set 200 as out cutout or cut in limit where the fan switches from off. 
  if(sensorVal1 <120 ){
    PWMVal1 = 0;
  }
    if(sensorVal2 <120 ){
    PWMVal2 = 0;
  }
  if(sensorVal3 <120 ){
    PWMVal3 = 0;
  }
  if(sensorVal4 <120 ){
    PWMVal4 = 0;
 }
  
  //write the PWM value to the pwm output pin
  analogWrite(PWM1, PWMVal1);
  analogWrite(PWM2, PWMVal2);
  analogWrite(PWM3, PWMVal3);
  analogWrite(PWM4, PWMVal4);
  
    temp1 = (double)sensorVal1 / 1024;       //find percentage of input reading
    temp1 = temp1 * 5;                 //multiply by 5V to get voltage
    temp1 = temp1 - 0.5;               //Subtract the offset 
    temp1 = temp1 * 100;               //Convert to degrees 

  
    temp2 = (double)sensorVal2 / 1024;       //find percentage of input reading
    temp2 = temp2 * 5;                 //multiply by 5V to get voltage
    temp2 = temp2 - 0.5;               //Subtract the offset 
    temp2 = temp2 * 100;               //Convert to degrees 

      temp3 = (double)sensorVal3 / 1024;       //find percentage of input reading
      temp3 = temp3 * 5;                 //multiply by 5V to get voltage
      temp3 = temp3 - 0.5;               //Subtract the offset 
      temp3 = temp3 * 100;               //Convert to degrees 


      temp4 = (double)sensorVal4 / 1024;       //find percentage of input reading
      temp4 = temp4 * 5;                 //multiply by 5V to get voltage
      temp4 = temp4 - 0.5;               //Subtract the offset 
      temp4 = temp4 * 100;               //Convert to degrees 
  
  //these values are what will be sent to the raspberry pi serial 
  Serial.print("temp1:");Serial.println(temp1); 
  Serial.print("temp1:");Serial.println(temp2);   
  Serial.print("temp1:");Serial.println(temp3);  
  Serial.print("temp1:");Serial.println(temp4); 
  Serial.print("pwm1:");Serial.println(PWMVal1);
  Serial.print("pwm2:");Serial.println(PWMVal2);  
  Serial.print("pwm3:");Serial.println(PWMVal3);
  Serial.print("pwm4:");Serial.println(PWMVal4);
delay(4000);

}
