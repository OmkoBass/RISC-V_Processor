LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
 
ENTITY MUX_TB IS
END MUX_TB;
 
ARCHITECTURE behavior OF MUX_TB IS 
 
    COMPONENT MUX
    PORT(
         First : IN  std_logic_vector(63 downto 0);
         Second : IN  std_logic_vector(63 downto 0);
         Sel : IN  std_logic;
         Mux_Out : OUT  std_logic_vector(63 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal First : std_logic_vector(63 downto 0) := (others => '0');
   signal Second : std_logic_vector(63 downto 0) := (others => '0');
   signal Sel : std_logic := '0';

 	--Outputs
   signal Mux_Out : std_logic_vector(63 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: MUX PORT MAP (
          First => First,
          Second => Second,
          Sel => Sel,
          Mux_Out => Mux_Out
        );
   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;
		First <= "0000000000000000000000000000000000000000000000000000000000000001";
		Second <= "0000000000000000000000000000000000000000000000000000000000000010";
		Sel <= '1';
		wait for 100 ns;
		Sel <= '0';
      wait;
   end process;

END;
