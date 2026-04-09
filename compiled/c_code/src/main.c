#include <stdint.h>
#include <stdbool.h>
#include <string.h>

#include "utils.h"
#include "text_lcd.h"


void lcd_init()
{
    delay(20000);
    text_lcd_function_set();
    delay(4000);
    text_lcd_function_set();
    delay(100);
    text_lcd_function_set();
    delay(40);
    text_lcd_function_set();
    delay(40);
    text_lcd_display_ctrl(false, false, false);
    delay(40);
    text_lcd_clear_display();
    delay(40);
    text_lcd_return_home();
    delay(1500);
    text_lcd_entry_mode_set(true, false);
    delay(40);
    text_lcd_display_ctrl(true, false, false);
    delay(40);
}

void main()
{
    lcd_init();
    char buffer[16] = "Hello World!";
    text_lcd_send_text_at(4, 1, buffer);
}
