library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity PC is
	Port (
		Clk    : in std_logic;
		Reset  : in std_logic;
		PC_In  : in std_logic_vector(63 downto 0);
		PC_Out : out std_logic_vector(63 downto 0)
	);
end PC;

architecture Behavioral of PC is
begin
	Process (CLK) begin
		if (rising_edge(CLK)) then
			if (Reset = '0') then
				PC_Out <= PC_In;
			else
				-- Reset to inital PC address here
				PC_Out <= PC_In;
			end if;
		end if;
	end Process;
end Behavioral;
