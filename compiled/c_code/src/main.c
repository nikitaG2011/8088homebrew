#include <stdint.h>
#include <stdbool.h>
#include <string.h>

#include "utils.h"

int8_t data = 35;
uint16_t i = 0;

void main() {
    portout(data);
}
