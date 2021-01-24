library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity ALU is
	Port (
		Alu_Control     : in std_logic_vector (3 downto 0); -- The operation to be done
		Read_1		: in std_logic_vector (63 downto 0); -- First input
		Read_2		: in std_logic_vector (63 downto 0); -- Second input
		Alu_Result	: out std_logic_vector (63 downto 0); -- Output from ALU
		Is_Zero		: out std_logic -- It will be one if outputt is zero
	);
end ALU;

architecture Behavioral of ALU is
begin
	Process(Read_1, Read_2, Alu_Control) begin
		-- We only have the Add operation so the add code of "0010" is
		-- important, if it's not the add code then we don't care
		if(Alu_Control = "0010") then
			Alu_Result <= Read_1 + Read_2;
			Is_Zero <= '0';
		else
			Alu_Result <= "0000000000000000000000000000000000000000000000000000000000000000";
			Is_Zero <= '1';
		end if;
	end Process;
end Behavioral;
