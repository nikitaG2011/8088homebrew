void setup() { 
  Serial.begin(19200);     
  DDRA = 0x00;     
  pinMode(2, INPUT_PULLUP);     
  attachInterrupt(digitalPinToInterrupt(2), DataIn, FALLING); 


  }
     
  void loop() {       
  }

  void DataIn() {       
    byte value = PINA;             
    Serial.write(value);           
  }
