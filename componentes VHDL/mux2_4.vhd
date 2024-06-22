library IEEE;
use IEEE.std_logic_1164.all;

entity mux2_4 is
	port (
		in_a	: in STD_LOGIC_VECTOR(3 downto 0);
		in_b	: in STD_LOGIC(3 downto 0);
		sel		: in STD_LOGIC;
		output	: out STD_LOGIC_VECTOR(3 downto 0)
	);
end mux2_4;

architecture mux2_4_architecture of mux2_4 is
begin
	output <= (in_a and not sel) or (in_b and sel);
end architecture mux2_4_architecture;
