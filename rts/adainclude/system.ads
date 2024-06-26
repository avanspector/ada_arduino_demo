package System is
   pragma Pure;
   pragma No_Elaboration_Code_All;

   type Name is (SYSTEM_NAME_GNAT);
   System_Name : constant Name := SYSTEM_NAME_GNAT;

   --  System-Dependent Named Numbers

   Min_Int               : constant := Long_Long_Integer'First;
   Max_Int               : constant := Long_Long_Integer'Last;

   Max_Binary_Modulus    : constant := 2 ** Long_Long_Integer'Size;
   Max_Nonbinary_Modulus : constant := 2 ** Integer'Size - 1;

   Max_Base_Digits       : constant := Long_Long_Float'Digits;
   Max_Digits            : constant := Long_Long_Float'Digits;

   Max_Mantissa          : constant := 63;
   Fine_Delta            : constant := 2.0 ** (-Max_Mantissa);

   Tick                  : constant := 0.0;

   --  Storage-related Declarations

   Storage_Unit : constant := 8;
   Word_Size    : constant := 16;
   Memory_Size  : constant := 2 ** 16;

   type Address is mod Memory_Size;
   Null_Address : constant Address := 0;

   --  Address comparison

   function "<"  (Left, Right : Address) return Boolean
     with Import, Convention => Intrinsic;
   function "<=" (Left, Right : Address) return Boolean
     with Import, Convention => Intrinsic;
   function ">"  (Left, Right : Address) return Boolean
     with Import, Convention => Intrinsic;
   function ">=" (Left, Right : Address) return Boolean
     with Import, Convention => Intrinsic;
   function "="  (Left, Right : Address) return Boolean
     with Import, Convention => Intrinsic;

   --  Other System-Dependent Declarations

   type Bit_Order is (High_Order_First, Low_Order_First);
   Default_Bit_Order : constant Bit_Order :=
     Bit_Order'Val (Standard'Default_Bit_Order);
   pragma Warnings (Off, Default_Bit_Order); -- kill constant condition warning

   --  Priority-related Declarations (RM D.1)

   Max_Priority           : constant Positive := 30;
   Max_Interrupt_Priority : constant Positive := 31;

   subtype Any_Priority       is Integer      range  0 .. 31;
   subtype Priority           is Any_Priority range  0 .. 30;
   subtype Interrupt_Priority is Any_Priority range 31 .. 31;

   Default_Priority : constant Priority := 15;

private

   Run_Time_Name : constant String := "Arduino Run Time";

   --  type Address is mod Memory_Size;
   --  Null_Address : constant Address := 0;

   --------------------------------------
   -- System Implementation Parameters --
   --------------------------------------

   --  These parameters provide information about the target that is used
   --  by the compiler. They are in the private part of System, where they
   --  can be accessed using the special circuitry in the Targparm unit
   --  whose source should be consulted for more detailed descriptions
   --  of the individual switch values.

   Atomic_Sync_Default       : constant Boolean := False;
   Backend_Divide_Checks     : constant Boolean := False;
   Backend_Overflow_Checks   : constant Boolean := True;
   Command_Line_Args         : constant Boolean := False;
   --  Set False if no command line arguments on target. Note that if this
   --  is False in with Configurable_Run_Time_On_Target set to True, then
   --  this causes suppression of generation of the argv/argc variables
   --  used to record command line arguments.

   Configurable_Run_Time     : constant Boolean := True;
   --  Indicates that the system.ads file is for a configurable run-time
   --
   --  In configurable run-time mode, the system run-time may not support
   --  the full Ada language. The effect of setting this switch is to let
   --  the compiler know that it is not surprising (i.e. the system is not
   --  misconfigured) if run-time library units or entities within units are
   --  not present in the run-time.
   --
   --  This has some specific effects as follows
   --
   --    The binder generates the gnat_argc/argv/envp variables in the
   --    binder file instead of being imported from the run-time library.
   --    If Command_Line_Args_On_Target is set to False, then the
   --    generation of these variables is suppressed completely.

   Denorm                    : constant Boolean := True;

   Duration_32_Bits          : constant Boolean := True;
   Duration_Delta_Microseconds : constant       := 1000;
   --  If True, then Duration is represented in 32 bits and the delta
   --  and small values are set to Duration_Delta_Microseconds*(10**(-6))
   --  (i.e. for Duration_Delta_Microseconds = 20000 it is a count in
   --  units of 20 milliseconds.
   --  Duration_Delta_Microseconds must be named integer number.

   Exit_Status_Supported     : constant Boolean := False;
   --  Set False if returning of an exit status is not supported on target.
   --  Note that if this False in with Configurable_Run_Time_On_Target
   --  set to True, then this causes suppression of the gnat_exit_status
   --  variable used to record the exit status.

   Fractional_Fixed_Ops      : constant Boolean := False;
   Frontend_Layout           : constant Boolean := False;
   Machine_Overflows         : constant Boolean := False;
   Machine_Rounds            : constant Boolean := True;
   Preallocated_Stacks       : constant Boolean := False;
   Signed_Zeros              : constant Boolean := True;
   Stack_Check_Default       : constant Boolean := False;
   Stack_Check_Probes        : constant Boolean := False;
   Stack_Check_Limits        : constant Boolean := False;
   Support_Aggregates        : constant Boolean := True;
   Support_Atomic_Primitives : constant Boolean := True;
   Support_Composite_Assign  : constant Boolean := True;
   Support_Composite_Compare : constant Boolean := True;
   Support_Long_Shifts       : constant Boolean := True;
   Always_Compatible_Rep     : constant Boolean := True;
   Suppress_Standard_Library : constant Boolean := True;
   --  If this flag is True, then the standard library is not included by
   --  default in the executable (see unit System.Standard_Library in file
   --  s-stalib.ads for details of what this includes). This is for example
   --  set True for the zero foot print case, where these files should not
   --  be included by default.
   --
   --  This flag has some other related effects:
   --
   --    The generation of global variables in the bind file is suppressed,
   --    with the exception of the priority of the environment task, which
   --    is needed by the Ravenscar run-time.
   --
   --    The generation of exception tables is suppressed for front end
   --    ZCX exception handling (since we assume no exception handling).
   --
   --    The calls to __gnat_initialize and __gnat_finalize are omitted
   --
   --    All finalization and initialization (controlled types) is omitted
   --
   --    The routine __gnat_handler_installed is not imported

   Use_Ada_Main_Program_Name : constant Boolean := False;
   Frontend_Exceptions       : constant Boolean := False;
   ZCX_By_Default            : constant Boolean := True;
   GCC_ZCX_Support           : constant Boolean := False;

end System;
