void setup() {
  Serial.begin(9600);

  // PORTA pins 22-29 = 8-bit data bus input
  DDRA = 0x00;

  pinMode(2, INPUT_PULLUP);  // CE
  pinMode(3, INPUT);         // A1
  pinMode(4, INPUT);         // WR
  pinMode(5, INPUT);         // RD

  attachInterrupt(digitalPinToInterrupt(2), dataReady, FALLING);
}

void loop() {
}

void dataReady() {
  bool A1 = digitalRead(3);
  bool WR = digitalRead(4);
  bool RD = digitalRead(5);

  // CE is active and this is a read
  if (RD == LOW && WR == HIGH) {

    byte value = PINA;

    Serial.write(value);
  }
}