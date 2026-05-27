#include <TVout.h>
#include <fontALL.h>

TVout TV;

volatile byte rxChar = 0;
volatile bool charReady = false;

void setup() {

  // 8-bit data bus

  pinMode(3, INPUT);
  pinMode(4, INPUT);
  pinMode(5, INPUT);
  pinMode(6, INPUT);

  pinMode(8, INPUT);
  pinMode(10, INPUT);
  pinMode(11, INPUT);
  pinMode(12, INPUT);

  // STROBE interrupt pin
  pinMode(2, INPUT);

  attachInterrupt(
    digitalPinToInterrupt(2),
    dataInterrupt,
    HIGH
  );

  TV.begin(_NTSC, 184, 72);
  TV.select_font(font6x8);
  TV.println("video output V1.0");
}

void loop() {

  if (charReady) {

    noInterrupts();

    byte c = rxChar;
    charReady = false;

    interrupts();

    TV.print((char)c);
  }
}

void dataInterrupt() {

  rxChar = 0;

  rxChar |= digitalRead(3)  << 0;
  rxChar |= digitalRead(4)  << 1;
  rxChar |= digitalRead(5)  << 2;
  rxChar |= digitalRead(6)  << 3;

  rxChar |= digitalRead(8)  << 4;
  rxChar |= digitalRead(10) << 5;
  rxChar |= digitalRead(11) << 6;
  rxChar |= digitalRead(12) << 7;

  charReady = true;
}