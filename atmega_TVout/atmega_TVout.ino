#include <TVout.h>
#include <fontALL.h>

TVout TV;

volatile bool ISR = false;

void setup() {

  pinMode(2, INPUT_PULLUP);

  attachInterrupt( digitalPinToInterrupt(2), triggerISR, RISING );

  TV.begin(_NTSC, 184, 72);
  TV.select_font(font6x8);

  TV.println("Text demo");
  TV.println("video output V0.1");
}

void loop() {

  if (ISR) {

    noInterrupts();
    ISR = false;
    interrupts();

    TV.print("isr");
  }
}

void triggerISR() {
  ISR = true;
}
