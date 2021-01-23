LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY ImmGen_TB IS
END ImmGen_TB;
 
ARCHITECTURE behavior OF ImmGen_TB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT ImmGen
    PORT(
         Input : IN  std_logic_vector(31 downto 0);
         Generated : OUT  std_logic_vector(63 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal Input : std_logic_vector(31 downto 0) := (others => '0');

 	--Outputs
   signal Generated : std_logic_vector(63 downto 0);
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: ImmGen PORT MAP (
          Input => Input,
          Generated => Generated
        );

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	
		Input <= "00000000000000000000000000000010";
		wait for 100 ns;
		Input <= "10000000000000000000000000000101";
      wait;
   end process;

END;
