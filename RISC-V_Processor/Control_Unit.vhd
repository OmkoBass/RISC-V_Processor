library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Based on Figure 4.18 Table

entity Control_Unit is
	Port (
		Instruction 	: in std_logic_vector(6 downto 0);
		Branch 			: out std_logic; -- If branch taken then 1
		Reg_Write		: out std_logic; -- If we write something to registers
		Memory_Write	: out std_logic; -- If we write something to memory
		Memory_Read		: out std_logic; -- If we're reading from memory
		Memory_To_Reg	: out std_logic; -- Load
		Alu_OP 			: out std_logic_vector(1 downto 0); -- Operation for Alu
		Alu_Src			: out std_logic -- Signal that tells if something is gonna come from register or ImmGen
	);
end Control_Unit;

architecture Behavioral of Control_Unit is
begin
	Process(Instruction) begin
		if (Instruction = "0000000") then
			Branch <= '0'; 
			Reg_Write <= '1'; 
			Memory_Write <= '0'; 
			Memory_Read <= '0'; 
			Memory_To_Reg <= '0'; 
			Alu_OP <= "10"; 
			Alu_Src <= '0'; 
		elsif (Instruction = "0000011") then
			Branch <= '0';
			Reg_Write <= '1';
			Memory_Write <= '0';
			Memory_Read <= '1';
			Memory_To_Reg <= '1';
			Alu_OP <= "00";
			Alu_Src <= '1';
		elsif (Instruction = "0100011") then
			Branch <= '0';
			Reg_Write <= '0';
			Memory_Write <= '1';
			Memory_Read <= '0';
			Memory_To_Reg <= 'X';
			Alu_OP <= "00";
			Alu_Src <= '1';
		else
			Branch <= '0';
			Reg_Write <= '0';
			Memory_Write <= '0';
			Memory_Read <= '0';
			Memory_To_Reg <= '0';
			Alu_OP <= "00";
			Alu_Src <= '0';
		end if;
	end Process;
end Behavioral;
