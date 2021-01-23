LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY Shifter_TB IS
END Shifter_TB;
 
ARCHITECTURE behavior OF Shifter_TB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Shifter
    PORT(
         Input : IN  std_logic_vector(63 downto 0);
         Shift_Out : OUT  std_logic_vector(63 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal Input : std_logic_vector(63 downto 0) := (others => '0');

 	--Outputs
   signal Shift_Out : std_logic_vector(63 downto 0);
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Shifter PORT MAP (
          Input => Input,
          Shift_Out => Shift_Out
        );

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	
		Input <= "0000000000000000000000000000000000000000000000000000000000000001";
      wait;
   end process;

END;
