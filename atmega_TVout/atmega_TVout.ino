void setup() {   
  Serial.begin(9600);   
  // PORTA pins 22-29 = 8-bit input   
  DDRA = 0x00;   
  // Interrupt pin 21   
  pinMode(2, INPUT_PULLUP);   // Trigger interrupt when pin 21 goes HIGH -> LOW   
  attachInterrupt(digitalPinToInterrupt(2), dataReady, FALLING); 
  } 
  void loop() {   
    // Nothing needed here 
  } 
  void dataReady() {   
    byte value = PINA;       
    // Read all 8 bits simultaneously   
    Serial.write(value);     
    // Send byte as ASCII 
    }