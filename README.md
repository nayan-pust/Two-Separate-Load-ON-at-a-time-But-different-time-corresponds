# Two-Separate-Load-ON-at-a-time-But-different-time-corresponds

# Objective :
The main purpose of this device is to provide its users a hassle free experience. Just install the system once and you are good to go. The device monitors the water level inside your reservoir using Ultrasonic/Sonar sensor & then controls the water pump accordingly.

# Components :
-PIC16F877A Microcontroller - 1 Pc *Ultrasonic Sensor - 1 Pc *5v voltage Regulator (LM7805) - 1 Pc *Crystal oscillator (16 MHz) - 1 *Capacitors (22pF) - 2Pc *Wires *LED - 3 Pc *5v Relay - 1 Pc *9v Battery - 1 Pc *Breadboard *Software Used :

# CIRCUIT Diagram
![image](https://github.com/nayan-pust/Two-Separate-Load-ON-at-a-time-But-different-time-corresponds/assets/114688354/513a38f7-5999-444a-a106-321b4ea5eb63)

# CODE
```ruby
char arraycc[] = { 0xBF, 0x86, 0xDB, 0xCF, 0xE6, 0xED, 0xFD, 0x87, 0xFF, 0xEF };
//char arrayca[] = { 0x40, 0x79, 0x24, 0x30, 0x19, 0x12, 0x02, 0x78, 0x00, 0x10 };



void main() {
    int i;
   int  bt_zero = 0, bt_one = 0, input_value,res,mod,k;
   unsigned char eepromValue;





   TRISB = 0x00;
   TRISC = 0x00;
   TRISD.f0 = 0xff;
   TRISD.f1 = 0xff;
   TRISD.f2 = 0xff;
   TRISD.f3 = 0xff;
   TRISD.f5 = 0x00;
   portb = 0x00;
   portc = 0x00;
   portd.f5=0x00;

   while(1)
   {

   // SECOND CIRCUIT IMPLEMENTATION AND PROVIDE DATA IN SECOND CIRCUIT FROM TO THE FIRST CIRCUIT
       if(portd.f3=0xff)
       {
         if(portd.f1 == 0xff)  // click initialize
       {
          delay_ms(150);
          if(portd.f1 == 0xff)  // click stability check
          {
              bt_zero++;        // digit increment
              if(bt_zero == 10) // after 9, next is 0
              {
                 bt_zero = 0;
              }
          }
       }
       if(portd.f0 == 0xff)
       {
          delay_ms(150);
          if(portd.f0 == 0xff)
          {
              bt_one++;
              if(bt_one == 10)
              {
                 bt_one = 0;
              }
          }
       }
        input_value = (bt_zero * 10 + bt_one); // Calculate the input value
        if(portd.f2==1)
        {


        }




       }



        // FIRST CIRCUIT IMPLEMENTATION BELOW

        if(portd.f1 == 0xff)  // click initialize
       {
          delay_ms(150);
          if(portd.f1 == 0xff)  // click stability check
          {
              bt_zero++;        // digit increment
              if(bt_zero == 10) // after 9, next is 0
              {
                 bt_zero = 0;
              }
          }
       }
       if(portd.f0 == 0xff)
       {
          delay_ms(150);
          if(portd.f0 == 0xff)
          {
              bt_one++;
              if(bt_one == 10)
              {
                 bt_one = 0;
              }
          }
       }
        input_value = (bt_zero * 10 + bt_one); // Calculate the input value




      if(portd.f2==1)
      {
          if (input_value >= 1 && input_value <= 99 ) {

          for( i=input_value;i>0;i--)
          {
                   portd.f5=1;
                   delay_ms(1000);
                    if(portd.f5=1)
                      {



                                   res  = i/10;
                                   mod = i%10;
                                   for(k = 0; k < 50*60; k++)    //for delay provide
                                   {
                                       portc.f0 = 0x00;   // active power for digit left
                                       portb = arrayCC[res]; // provide data for two digit
                                       delay_ms(10);
                                       portc.f0 = 0xff;   // Deactive power for digit right

                                       portc.f1 = 0x00;     // active power for digit right
                                       portb = arrayCC[mod];
                                       delay_ms(10);
                                       portc.f1 = 0xff;      // deactive power for digit left
                                   }

                      }



          }



           portd.f5 = 1; // Activate portd.f4
           Delay_ms(1000);  // Delay based on input in milliseconds
           portd.f5 = 0; // Deactivate portd.f4
            EEPROM_Write(0x80,input_value);

         }


     }

       portc.f0 = 0x00;   // active power for digit left
       portb = arrayCC[bt_zero]; // provide data for left digit
       delay_ms(10);
       portc.f0 = 0xff;   // Deactive power for digit left

       portc.f1 = 0x00;     // active power for second digit
       portb = arrayCC[bt_one];    // provide data for second digit
       delay_ms(10);
       portc.f1 = 0xff;      // deactive power for second digit


     }
}
```

