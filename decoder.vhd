library IEEE;
use IEEE.std_logic_1164.all;


entity decoder is
	port (
		input    : in  std_logic_vector(7 downto 0);
		bus_sel  : out std_logic_vector(1 downto 0);
		alu_op   : out std_logic_vector(2 downto 0);
		reg_a_we : out std_logic;
        	out_we   : out std_logic;
       	 	reg_we   : out std_logic;
	);
end decoder;

architecture decoder_architecture of decoder is
begin
	with input select                         
	        bus_sel <= "10" when "01",
	                   "00" when "02",
	                   "00" when "03",
	                   "00" when "04",
	                   "01" when "05",
	                   "00" when "10",
	                   "00" when "11",
	                   "00" when "12",
	                   "00" when "13",
	                   "00" when "14",
	                   "00" when "20",
	                   "00" when "21",
	                   "00" when others;

	with input select
		alu_op <= "000" when "01",
	                  "000" when "02",
	                  "000" when "03",
	                  "000" when "04",
	                  "000" when "05",
	                  "010" when "10",
	                  "011" when "11",
	                  "100" when "12",
	                  "101" when "13",
	                  "110" when "14",
	                  "001" when "20",
	                  "111" when "21",
	                  "000" when others;

	with input select
	        reg_a_we <= "0" when "01",
	                    "0" when "02",
	                    "0" when "03",
	                    "1" when "04",
	                    "1" when "05",
	                    "0" when "10",
	                    "0" when "11",
	                    "0" when "12",
	                    "0" when "13",
	                    "0" when "14",
	                    "0" when "20",
	                    "0" when "21",
	                    "0" when others;

	with input select
	        out_we <= "0" when "01",
	                  "1" when "02",
	                  "0" when "03",
	                  "0" when "04",
	                  "0" when "05",
	                  "0" when "10",
	                  "0" when "11",
	                  "0" when "12",
	                  "0" when "13",
	                  "0" when "14",
	                  "0" when "20",
	                  "0" when "21",
	                  "0" when others;

	with input select
	        reg_we <= "1" when "01",
	                  "0" when "02",
	                  "1" when "03",
	                  "0" when "04",
	                  "0" when "05",
	                  "1" when "10",
	                  "1" when "11",
	                  "1" when "12",
	                  "1" when "13",
	                  "1" when "14",
	                  "1" when "20",
	                  "1" when "21",
	                  "1" when others;
	
end architecture decoder_architecture;
