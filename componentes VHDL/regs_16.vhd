library IEEE;
use IEEE.std_logic_1164.all;

entity regs_16 is
    port (
		clk	 : in STD_LOGIC;
		rst	 : in STD_LOGIC;
		we	 : in STD_LOGIC;
		rd	 : in STD_LOGIC_VECTOR (3 downto 0);
		rs	 : in STD_LOGIC_VECTOR (3 downto 0);
		din	 : in STD_LOGIC_VECTOR (7 downto 0);
		dout : out STD_LOGIC_VECTOR (7 downto 0)
    );
end regs_16;

architecture regs_16_architecture of regs_16 is
	signal we_reg1, we_reg2		: STD_LOGIC;
	signal dout_reg1, dout_reg2	: STD_LOGIC_VECTOR(3 downto 0);
begin
	reg1: entity work.regs port map (
		clk	 => clk,
		rst	 => rst,
		we	 => we_reg1,
		rd	 => rd(2 downto 0),
		rs	 => rs(2 downto 0),
		din	 => din,
		dout => dout_reg1
	);

	reg2: entity work.regs port map (
		clk	 => clk,
		rst	 => rst,
		we	 => we_reg2,
		rd	 => rd(2 downto 0),
		rs	 => rs(2 downto 0),
		din	 => din,
		dout => dout_reg2
	);

	dmux: entity work.dmux2_1 port map (
		input => we,
		sel	  => rd(3),
		out_a => we_reg1,
		out_b => we_reg2
	);

	mux: entity work.mux2_4 port map (
	  in_a	 => dout_reg1,
	  in_b	 => dout_reg2,
	  sel	 => rs(3),
	  output => dout
	);
end architecture regs_16_architecture;
