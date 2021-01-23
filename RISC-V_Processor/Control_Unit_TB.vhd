LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY Control_Unit_TB IS
END Control_Unit_TB;
 
ARCHITECTURE behavior OF Control_Unit_TB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Control_Unit
    PORT(
         Instruction : IN  std_logic_vector(6 downto 0);
         Branch : OUT  std_logic;
         Reg_Write : OUT  std_logic;
         Memory_Write : OUT  std_logic;
         Memory_Read : OUT  std_logic;
         Memory_To_Reg : OUT  std_logic;
         Alu_OP : OUT  std_logic_vector(1 downto 0);
         Alu_Src : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal Instruction : std_logic_vector(6 downto 0) := (others => '0');

 	--Outputs
   signal Branch : std_logic;
   signal Reg_Write : std_logic;
   signal Memory_Write : std_logic;
   signal Memory_Read : std_logic;
   signal Memory_To_Reg : std_logic;
   signal Alu_OP : std_logic_vector(1 downto 0);
   signal Alu_Src : std_logic;
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Control_Unit PORT MAP (
          Instruction => Instruction,
          Branch => Branch,
          Reg_Write => Reg_Write,
          Memory_Write => Memory_Write,
          Memory_Read => Memory_Read,
          Memory_To_Reg => Memory_To_Reg,
          Alu_OP => Alu_OP,
          Alu_Src => Alu_Src
        );

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	
		Instruction <= "0000000";
		wait for 300 ns;
		Instruction <= "0000011";
      wait;
   end process;

END;
