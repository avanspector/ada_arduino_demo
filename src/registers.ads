with Based; use Based;

package Registers is
   UCSR0A : Byte
     with Volatile, Address => 16#C0#;
   UCSR0A_Bits : Bits_In_Byte
     with Volatile, Address => UCSR0A'Address;

   UCSR0B : Byte
     with Volatile, Address => 16#C1#;
   UCSR0B_Bits : Bits_In_Byte
     with Volatile, Address => UCSR0B'Address;

   UCSR0C : Byte
     with Volatile, Address => 16#C2#;
   UCSR0C_Bits : Bits_In_Byte
     with Volatile, Address => UCSR0C'Address;

   UBRR0 : Uint
     with Volatile, Address => 16#C4#;

   UBRR0L : Byte
     with Volatile, Address => 16#C4#;
   UBRR0L_Bits : Bits_In_Byte
     with Volatile, Address => UBRR0L'Address;

   UBRR0H : Byte
     with Volatile, Address => 16#C5#;
   UBRR0H_Bits : Bits_In_Byte
     with Volatile, Address => UBRR0H'Address;

   UDR0 : Byte
     with Volatile, Address => 16#C6#;
   UDR0_Bits : Bits_In_Byte
     with Volatile, Address => UDR0'Address;

   U2X0   : constant Bit_Position_In_Byte := 1;
   UCSZ00 : constant Bit_Position_In_Byte := 1;
   UCSZ01 : constant Bit_Position_In_Byte := 2;
   DOR0   : constant Bit_Position_In_Byte := 3;
   TXEN0  : constant Bit_Position_In_Byte := 3;
   RXEN0  : constant Bit_Position_In_Byte := 4;
   FE0    : constant Bit_Position_In_Byte := 4;
   UDRE0  : constant Bit_Position_In_Byte := 5;
   RXC0   : constant Bit_Position_In_Byte := 7;
end Registers;
