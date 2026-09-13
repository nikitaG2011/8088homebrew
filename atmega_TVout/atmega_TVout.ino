volatile byte receivedByte = 0;
volatile bool charAvailable = false;

void setup() {
  Serial.begin(9600);

  // PORTA = 8-bit bidirectional bus
  DDRA = 0x00;

  // A1 = register select
  pinMode(3, INPUT_PULLUP);   // RD
  pinMode(4, INPUT_PULLUP);   // WR
  pinMode(5, INPUT_PULLUP);   // A1
}

void loop() {

  // Receive character from PC
  if (Serial.available()) {
    receivedByte = Serial.read();
    charAvailable = true;
  }

  // ----------------------------
  // 80C88 READ
  // ----------------------------

  if (digitalRead(3) == LOW) {       // RD\ active

    if (digitalRead(5) == HIGH) {
      // A1 = 1 -> STATUS REGISTER

      DDRA = 0xFF;

      if (charAvailable)
        PORTA = 0x01;
      else
        PORTA = 0x00;
    }
    else {
      // A1 = 0 -> DATA REGISTER

      DDRA = 0xFF;
      PORTA = receivedByte;
    }

    // Wait for RD\ to finish
    while (digitalRead(3) == LOW) {
    }

    // Release bus
    DDRA = 0x00;
  }
}