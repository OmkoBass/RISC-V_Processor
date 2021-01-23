library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Shifter is
	Port (
		Input : in std_logic_vector (63 downto 0);
		Shift_Out : out std_logic_vector (63 downto 0)
	);
end Shifter;

architecture Behavioral of Shifter is
begin
	Process(Input) begin
		-- Shift left
		Shift_Out <= (Input(62 downto 0) & '0');
	end Process;
end Behavioral;
