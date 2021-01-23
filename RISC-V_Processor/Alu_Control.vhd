library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Figure 4.12 Page 501

entity Alu_Control is
	Port (
		Func : in std_logic_vector (3 downto 0); -- To determine the operation
		Alu_OP: in std_logic_vector (1 downto 0); -- OPCode
		Operation: out std_logic_vector (3 downto 0) -- The operation to be done
	);
end Alu_Control;

architecture Behavioral of Alu_Control is
begin
	Operation(0) <= (Alu_OP(1) and (Func(3) or Func(0)));
	Operation(1) <= not(Alu_OP(1)) or not(Func(2));
	Operation(2) <= Alu_OP(0) or (Alu_OP(1) and Func(1));
	Operation(3) <= Alu_OP(0) and not Alu_OP(0);
end Behavioral;
