LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY AND_GATE_TB IS
END AND_GATE_TB;
 
ARCHITECTURE behavior OF AND_GATE_TB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT AND_GATE
    PORT(
         Branch : IN  std_logic;
         IsZero : IN  std_logic;
         And_Out : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal Branch : std_logic := '0';
   signal IsZero : std_logic := '0';

 	--Outputs
   signal And_Out : std_logic;
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: AND_GATE PORT MAP (
          Branch => Branch,
          IsZero => IsZero,
          And_Out => And_Out
        );

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	
		Branch <= '1';
		IsZero <= '1';
		wait for 300 ns;
		Branch <= '0';
      wait;
   end process;

END;
