library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity AND is
	Port(
		Branch : in std_logic;
		IsZero : in std_logic;
		And_Out: out std_logic;
	);
end AND;

architecture Behavioral of AND is
begin
	And_Out <= Branch AND IsZero;
end Behavioral;
