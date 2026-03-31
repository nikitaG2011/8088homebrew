void setup() {
  DDRB |= (1 << DDB1); // Pin 9 as output

  TCCR1A = (1 << COM1A1) | (1 << WGM11);
  TCCR1B = (1 << WGM13) | (1 << WGM12) | (1 << CS10);

  ICR1 = 5;   // TOP = 5 (6 clock cycles = 2.66MHz)
  OCR1A = 1;  // High for 2 cycles (0,1), Low for 4 (2,3,4,5) = 33.3%
}

void loop() {}