with Based; use Based;
with UART;

package body Demo is
   procedure Init is
   begin
      UART.Init;
   end Init;

   procedure Run is
   begin
      UART.Put_Line ("Crazy people use ada on arduino!");
   end Run;
end Demo;
