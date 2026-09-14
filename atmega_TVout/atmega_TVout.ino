byte RXbuffer = 0;

void setup() { 
  Serial.begin(19200);     
  DDRA = 0x00;     
  pinMode(2, INPUT_PULLUP);     
  attachInterrupt(digitalPinToInterrupt(2), DataIn, FALLING); 
  pinMode(3, INPUT_PULLUP);     
  attachInterrupt(digitalPinToInterrupt(3), DataOut, FALLING); 

  }
     
  void loop() {       
    if(Serial.available() > 0 ) {
      RXbuffer = Serial.read();
    }
  }

  void DataIn() {       
    byte value = PINA;             
    Serial.write(value);           
  }
  void DataOut() {
    DDRA = 0xFF;
    PORTA = RXbuffer;
    delayMicroseconds(5);
    DDRA = 0x00;
    RXbuffer = 0;
  }