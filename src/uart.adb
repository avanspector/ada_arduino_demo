with Based; use Based;
with Registers;

package body UART is
   package Reg renames Registers;

   Clock_Frequency : constant := 16000000;
   Baud : constant := 9600;

   procedure Init is
      Baud_Freq : constant := (Clock_Frequency + 8 * Baud) / (16 * Baud) - 1;
   begin
      Reg.UBRR0  := Baud_Freq;
      Reg.UCSR0A := Reg.UCSR0A and +(Reg.U2X0 => Clear, others => Set);
      Reg.UCSR0B := +(Reg.TXEN0 => Set, Reg.RXEN0 => Set, others => Clear);
      Reg.UCSR0C := +(Reg.UCSZ00 => Set, Reg.UCSZ01 => Set, others => Clear);
   end Init;

   procedure Put_Char (C : Character) is
   begin
      while Reg.UCSR0A_Bits (Reg.UDRE0) = Clear loop
         null;
      end loop;
      Reg.UDR0 := Character'Pos (C);
   end Put_Char;

   procedure New_Line is
      LF : constant Character := Character'Val(10);
   begin
      Put_Char (LF);
   end New_Line;

   procedure Put (S : String) is
   begin
      for I in S'Range loop
         Put_Char (S (I));
      end loop;
   end Put;

   procedure Put_Line (S : String) is
   begin
      Put (S);
      New_Line;
   end Put_Line;
end UART;
