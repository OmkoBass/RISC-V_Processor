library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity MUX is
	Port(
		First  : in std_logic_vector(63 downto 0);
		Second : in std_logic_vector(63 downto 0);
		Sel 	 : in std_logic;
		Mux_Out: out std_logic_vector(63 downto 0)
	);
end MUX;

architecture Behavioral of MUX is
begin
	Process(First, Second, SEL) begin
		if (Sel = '0') then
			Mux_Out <= First;
		else
			Mux_Out <= Second;
		end if;
	end Process;
end Behavioral;
