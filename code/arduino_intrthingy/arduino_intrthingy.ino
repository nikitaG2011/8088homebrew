int DATA[] = {3,4,5,6,7,8,9,10};
int IO_M = 2;


void setup() {
  Serial.begin(9600);
  
  pinMode(IO_M, INPUT_PULLUP);

  for (int n = 0; n < 8; n += 1) {
    pinMode(DATA[n], INPUT);
  }

  attachInterrupt(digitalPinToInterrupt(IO_M),intr, LOW);
}

void loop() {
}

void intr(){
  unsigned int data = 0;
  for (int n = 0; n < 8; n += 1) {
    int bit = digitalRead(DATA[n]) ? 1 : 0;
    Serial.print(bit);
    data = (data << 1) + bit;
  }
}