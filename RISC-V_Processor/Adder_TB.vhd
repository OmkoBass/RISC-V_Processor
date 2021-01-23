LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY Adder_TB IS
END Adder_TB;
 
ARCHITECTURE behavior OF Adder_TB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Adder
    PORT(
         First : IN  std_logic_vector(63 downto 0);
         Second : IN  std_logic_vector(63 downto 0);
         Sum : OUT  std_logic_vector(63 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal First : std_logic_vector(63 downto 0) := (others => '0');
   signal Second : std_logic_vector(63 downto 0) := (others => '0');

 	--Outputs
   signal Sum : std_logic_vector(63 downto 0);
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Adder PORT MAP (
          First => First,
          Second => Second,
          Sum => Sum
        );

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;
		First <= "0000000000000000000000000000000000000000000000000000000000001010";
		Second <= "0000000000000000000000000000000000000000000000000000000000000101";
      wait;
   end process;

END;
