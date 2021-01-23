LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY ALU_TB IS
END ALU_TB;
 
ARCHITECTURE behavior OF ALU_TB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT ALU
    PORT(
         Alu_Control : IN  std_logic_vector(3 downto 0);
         Read_1 : IN  std_logic_vector(63 downto 0);
         Read_2 : IN  std_logic_vector(63 downto 0);
         Alu_Result : OUT  std_logic_vector(63 downto 0);
         Is_Zero : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal Alu_Control : std_logic_vector(3 downto 0) := (others => '0');
   signal Read_1 : std_logic_vector(63 downto 0) := (others => '0');
   signal Read_2 : std_logic_vector(63 downto 0) := (others => '0');

 	--Outputs
   signal Alu_Result : std_logic_vector(63 downto 0);
   signal Is_Zero : std_logic;
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: ALU PORT MAP (
          Alu_Control => Alu_Control,
          Read_1 => Read_1,
          Read_2 => Read_2,
          Alu_Result => Alu_Result,
          Is_Zero => Is_Zero
        );

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	
		Alu_Control <= "0010";
		Read_1 <= "0000000000000000000000000000000000000000000000000000000000001010";
		Read_2 <= "0000000000000000000000000000000000000000000000000000000000000101";
		wait for 300 ns;
		Alu_Control <= "1111";
      wait;
   end process;

END;
