with Ada.Unchecked_Conversion;
with System;

package Based with Pure is
   type    Byte    is mod 2**8;
   subtype Int     is Integer;
   type    UInt    is mod 2**Int'Size;
   subtype Address is System.Address;

   type Bit_State is (Clear, Set);
   for Bit_State use (Clear => 0, Set => 1);

   type Bit_Position_In_Byte is new Byte range 0 .. 7;
   type Bits_In_Byte is array (Bit_Position_In_Byte) of Bit_State
     with Pack, Size => 8;

   function "+" is new Ada.Unchecked_Conversion (Source => Bits_In_Byte,
                                                 Target => Byte);
   function "+" is new Ada.Unchecked_Conversion (Source => Byte,
                                                 Target => Bits_In_Byte);
end Based;
