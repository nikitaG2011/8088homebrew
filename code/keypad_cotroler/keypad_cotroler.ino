/* @file keypad decoder
|| @version 1.0
*/
#include <Keypad.h>

const byte ROWS = 4; //four rows
const byte COLS = 4; //four columns
//define the cymbols on the buttons of the keypads
char hexaKeys[ROWS][COLS] = {
  {0x1,0x2,0x3,0xA},
  {0x4,0x5,0x6,0xB},
  {0x7,0x8,0x9,0xC},
  {0xF,16,0xE,0xD}
};
byte rowPins[ROWS] = {3, 2, 1, 0}; //connect to the row pinouts of the keypad
byte colPins[COLS] = {7, 6, 5, 4}; //connect to the column pinouts of the keypad

//initialize an instance of class NewKeypad
Keypad customKeypad = Keypad( makeKeymap(hexaKeys), rowPins, colPins, ROWS, COLS); 

void setup(){
  DDRB = B00001111; 
}
  
void loop(){
  int customKey = customKeypad.getKey();
  
  if (customKey){
    PORTB = customKey;

    
  }
}
