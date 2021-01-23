library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.numeric_std.all;

entity Data_Memory is
	Port (
		Address 		 : in std_logic_vector (63 downto 0); -- Address
		Write_Data 	 : in std_logic_vector (63 downto 0); -- Write value to be stored
		Memory_Read  : in std_logic; -- If we want to read from
		Memory_Write : in std_logic; -- If we want to write to
		Read_Data 	 : out std_logic_vector(63 downto 0) -- Out value for write back
	);
end Data_Memory;

architecture Behavioral of Data_Memory is
type Memory is array(7 downto 0) of std_logic_vector(63 downto 0);
signal Data_Memory : Memory;

begin
	Process(Memory_Write, Memory_Read) begin
		if (Memory_Read = '1') then
			Read_Data <= Data_Memory(to_integer(unsigned(Address)));
		if (Memory_Write = '1') then
			Data_Memory(to_integer(unsigned(Address))) <= Write_Data;
		end if;
		end if;
	end Process;
end Behavioral;
