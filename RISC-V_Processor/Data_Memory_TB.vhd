LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY Data_Memory_TB IS
END Data_Memory_TB;
 
ARCHITECTURE behavior OF Data_Memory_TB IS 
    COMPONENT Data_Memory
    PORT(
         Address : IN  std_logic_vector(63 downto 0);
         Write_Data : IN  std_logic_vector(63 downto 0);
         Memory_Read : IN  std_logic;
         Memory_Write : IN  std_logic;
         Read_Data : OUT  std_logic_vector(63 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal Address : std_logic_vector(63 downto 0) := (others => '0');
   signal Write_Data : std_logic_vector(63 downto 0) := (others => '0');
   signal Memory_Read : std_logic := '0';
   signal Memory_Write : std_logic := '0';

 	--Outputs
   signal Read_Data : std_logic_vector(63 downto 0);
BEGIN
	-- Instantiate the Unit Under Test (UUT)
   uut: Data_Memory PORT MAP (
          Address => Address,
          Write_Data => Write_Data,
          Memory_Read => Memory_Read,
          Memory_Write => Memory_Write,
          Read_Data => Read_Data
        );

   -- Stimulus process
   stim_proc: process
   begin		
      wait for 100 ns;
		Address <= "0000000000000000000000000000000000000000000000000000000000000000";
		Write_Data <= "0000000000000000000000000000000000000000000000000000000000001111";
		Memory_Read <= '1';
		Memory_Write <= '1';
		wait for 100 ns;
      wait;
   end process;

END;
