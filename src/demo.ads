package Demo is
   procedure Init
     with Export, Convention => C, Link_Name => "demo_init";
   procedure Run
     with Export, Convention => C, Link_Name => "demo_run";
end Demo;
