#include <xc.h>
#include <stdint.h>

// Define the segment patterns for displaying digits 0-9 on a common-cathode seven-segment display
const uint8_t segmentPatterns[] = {
    0b00111111, // 0
    0b00000110, // 1
    0b01011011, // 2
    0b01001111, // 3
    0b01100110, // 4
    0b01101101, // 5
    0b01111101, // 6
    0b00000111, // 7
    0b01111111, // 8
    0b01101111  // 9
};

void main(void) {
    // Set up your configuration bits here

    TRISB = 0b00111111; // Set PORTB<5:0> as input for five switches (RB0 to RB4)
    TRISC = 0x00;       // Set PORTC as output for seven-segment display

    while (1) {
        // Read the state of the five switches (RB0 to RB4)
        uint8_t binaryInput = PORTB & 0b00011111; // Mask to read only RB0 to RB4

        // Convert binary to decimal
        uint8_t decimalOutput = 0;
        for (int i = 0; i < 5; i++) {
            if (binaryInput & (1 << i)) {
                decimalOutput += (1 << i);
            }
        }

        // Display the decimal value on the seven-segment display
        PORTC = segmentPatterns[decimalOutput];

        // You may need to implement a delay to control the display duration
    }
}

