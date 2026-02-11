int DATA[] = {10,9,8,7,6,5,4,3};
int adata[] = {0,0,0,0,0,0,0,0};
int IO_M = 2;


void setup() {
  Serial.begin(19200);
  
  pinMode(IO_M, INPUT_PULLUP);

  for (int n = 0; n < 8; n += 1) {
    pinMode(DATA[n], INPUT);
  }

  attachInterrupt(digitalPinToInterrupt(IO_M),intr, LOW);
}

void loop() {
}

void intr(){
  for (int n = 0; n < 8; n += 1) {
    adata[n] = digitalRead(DATA[n]);
  }
  for (int n = 0; n < 8; n += 1) {
    Serial.print(adata[n]);
  }
  
}