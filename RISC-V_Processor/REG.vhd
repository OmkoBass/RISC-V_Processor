library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity REG is
	Port (
		Clk 				 : in std_logic;
		Reg_Write 		 : in std_logic; -- If we should write to reg
		Write_Data 		 : in std_logic_vector (63 downto 0); -- The data that should be written in
		Write_Reg 		 : in std_logic_vector (4 downto 0); -- In which register to write
		Read_Reg_1 		 : in std_logic_vector (4 downto 0); -- Which register to read from
		Read_Reg_2 		 : in std_logic_vector (4 downto 0); -- Which register to read from
		Read_Reg_Data_1 : out std_logic_vector (63 downto 0); -- Value from read register
		Read_Reg_Data_2 : out std_logic_vector (63 downto 0) -- Value from read register
	);
end REG;

architecture Behavioral of REG is
type regFile is array (7 downto 0) of std_logic_vector(63 downto 0);
signal registers : regFile;

begin
	Process(CLK) begin
		if (rising_edge(CLK)) then
			-- Write to register
			if (Reg_Write = '1') then
				registers(to_integer(unsigned(Write_Reg))) <= Write_Data;
				
				if (Read_Reg_1 = Write_Reg) then
					Read_Reg_Data_1 <= Write_Data;
				elsif (Read_Reg_2 = Write_Reg) then
					Read_Reg_Data_2 <= Write_Data;
				end if;
			else
				-- If we won't write to them then just 
				-- read from registers and output them
				Read_Reg_Data_1 <= registers(to_integer(unisgned(Read_Reg_1)));
				Read_Reg_Data_2 <= registers(to_integer(unisgned(Read_Reg_2)));
			end if;
		end if;
	end Process;
end Behavioral;
