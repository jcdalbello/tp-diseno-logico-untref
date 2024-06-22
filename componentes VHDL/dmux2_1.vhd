library IEEE;
use IEEE.std_logic_1164.all;

entity dmux2_1 is
	port (
		input	: in STD_LOGIC;
		sel		: in STD_LOGIC;
		out_a	: out STD_LOGIC;
		out_b	: out STD_LOGIC
	);
end dmux2_1;

architecture dmux2_1_architecture of dmux2_1 is
begin
    out_a <= input and not sel;
    out_b <= input and sel;
end architecture dmux2_1_architecture;
