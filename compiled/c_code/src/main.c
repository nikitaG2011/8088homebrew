#include <stdint.h>
#include <stdbool.h>
#include <string.h>

#include "utils.h"

uint16_t i = 0;

void main() {
    cycle:
    print_char('a');
    delay(50);
    print_char('b');

}
