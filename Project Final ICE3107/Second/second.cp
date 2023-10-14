#line 1 "C:/Users/rahma/OneDrive/Desktop/Projecttt/second.c"
void main() {
 TRISB = 0xFF;
 TRISC = 0x00;

 while (1) {

 unsigned char binaryInput = PORTB;
 int i;


 unsigned char decimalOutput = 0;
 for(i = 0; i < 8; i++)
 {
 if (binaryInput & (1 << i))
 {
 decimalOutput += (1 << i);
 }
 }
 }
 }
