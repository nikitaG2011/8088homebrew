void setup() {
  pinMode(9, OUTPUT);  // OC1A

  TCCR1A = 0;
  TCCR1B = 0;
  TCNT1  = 0;

  // Fast PWM, mode 14
  TCCR1A |= (1 << WGM11);
  TCCR1B |= (1 << WGM13) | (1 << WGM12);

  // OC1A non-inverting
  TCCR1A |= (1 << COM1A1);

  // 1 MHz clock
  ICR1 = 15;

  // ~33% duty cycle
  OCR1A = 5;

  // No prescaler
  TCCR1B |= (1 << CS10);
}

void loop() {}
// connect shmitt inverter to pin 9