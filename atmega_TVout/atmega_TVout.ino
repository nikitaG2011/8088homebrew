volatile byte rxChar = 0;
volatile bool charReady = false;

void setup() {
  Serial.begin(9600);
  // 8-bit data bus

  pinMode(3, INPUT);
  pinMode(4, INPUT);
  pinMode(5, INPUT);
  pinMode(6, INPUT);

  pinMode(7, INPUT);
  pinMode(8, INPUT);
  pinMode(9, INPUT);
  pinMode(10, INPUT);

  // STROBE interrupt pin
  pinMode(2, INPUT);

  attachInterrupt(
    digitalPinToInterrupt(2),
    dataInterrupt,
    RISING
  );
  Serial.print("text output V1.0");
  Serial.println("");


}

void loop() {

  if (charReady) {

    noInterrupts();

    byte c = rxChar;
    charReady = false;

    interrupts();

    Serial.print((char)c);
  }
}

void dataInterrupt() {

  rxChar = 0;

  rxChar |= digitalRead(3)  << 0;
  rxChar |= digitalRead(4)  << 1;
  rxChar |= digitalRead(5)  << 2;
  rxChar |= digitalRead(6)  << 3;

  rxChar |= digitalRead(7)  << 4;
  rxChar |= digitalRead(8) << 5;
  rxChar |= digitalRead(9) << 6;
  rxChar |= digitalRead(10) << 7;

  charReady = true;
}