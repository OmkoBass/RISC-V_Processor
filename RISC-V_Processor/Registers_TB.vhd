LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY Registers_TB IS
END Registers_TB;
 
ARCHITECTURE behavior OF Registers_TB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Registers
    PORT(
         Clk : IN  std_logic;
         Reg_Write : IN  std_logic;
         Write_Data : IN  std_logic_vector(63 downto 0);
         Write_Reg : IN  std_logic_vector(4 downto 0);
         Read_Reg_1 : IN  std_logic_vector(4 downto 0);
         Read_Reg_2 : IN  std_logic_vector(4 downto 0);
         Read_Reg_Data_1 : OUT  std_logic_vector(63 downto 0);
         Read_Reg_Data_2 : OUT  std_logic_vector(63 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal Clk : std_logic := '0';
   signal Reg_Write : std_logic := '0';
   signal Write_Data : std_logic_vector(63 downto 0) := (others => '0');
   signal Write_Reg : std_logic_vector(4 downto 0) := (others => '0');
   signal Read_Reg_1 : std_logic_vector(4 downto 0) := (others => '0');
   signal Read_Reg_2 : std_logic_vector(4 downto 0) := (others => '0');

 	--Outputs
   signal Read_Reg_Data_1 : std_logic_vector(63 downto 0);
   signal Read_Reg_Data_2 : std_logic_vector(63 downto 0);

   -- Clock period definitions
   constant Clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Registers PORT MAP (
          Clk => Clk,
          Reg_Write => Reg_Write,
          Write_Data => Write_Data,
          Write_Reg => Write_Reg,
          Read_Reg_1 => Read_Reg_1,
          Read_Reg_2 => Read_Reg_2,
          Read_Reg_Data_1 => Read_Reg_Data_1,
          Read_Reg_Data_2 => Read_Reg_Data_2
        );

   -- Clock process definitions
   Clk_process :process
   begin
		Clk <= '0';
		wait for Clk_period/2;
		Clk <= '1';
		wait for Clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;
		Reg_Write <= '1';
		Write_Data <= "1010101010101010101010101010101010101010101010101010101010101010";
		Write_Reg <= "00000";
      wait for Clk_period*10;
		Write_Data <= "1111111111111111111111111111111111111111111111111111111111111111";
		Write_Reg <= "00001";
		wait for Clk_period*10;
		Reg_Write <= '0';
		Read_Reg_1 <= "00000";
		Read_Reg_2 <= "00001";
      wait;
   end process;

END;
