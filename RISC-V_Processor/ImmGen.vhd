library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- ImmGen checks the MSB bit
-- If it's unsigned we add 0
-- If it's signed we add 1

entity ImmGen is
	Port (
		Input : in std_logic_vector (31 downto 0);
		Generated: out std_logic_vector (63 downto 0)
	);
end ImmGen;

architecture Behavioral of ImmGen is
begin
	Process(Input) begin
		if (Input(31) = '0') then
			Generated <= "00000000000000000000000000000000" & Input;
		else
			Generated <= "11111111111111111111111111111111" & Input;
		end if;
	end Process;
end Behavioral;
