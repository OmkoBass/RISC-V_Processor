library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity Adder is
	Port (
		First	 : in std_logic_vector(63 downto 0);
		Second : in std_logic_vector(63 downto 0);
		Sum	 : out std_logic_vector(63 downto 0)
	);
end Adder;

architecture Behavioral of Adder is
begin
	Sum <= First + Second;
end Behavioral;
