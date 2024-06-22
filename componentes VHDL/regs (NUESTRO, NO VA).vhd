library IEEE;
use IEEE.std_logic_1164.all;

entity regs is 
	Port (
		clk  : in STD_LOGIC; 
		rst  : in STD_LOGIC; 
		we   : in STD_LOGIC; 
		rd   : in STD_LOGIC_VECTOR (3 downto 0); 
		rs   : in STD_LOGIC_VECTOR (3 downto 0); 
		din  : in STD_LOGIC_VECTOR (7 downto 0);
		dout : out STD_LOGIC_VECTOR (7 downto 0)
	); 
end regs; 

architecture architecture_regs of regs is

	-- Constante para la cantidad de registros
	constant CANT_REGISTROS : integer := 16;
    
	-- Crear un nuevo tipo de dato que represente un arreglo de vectores, en el que cada vector funciona como un registro
	type tipo_registros is array(CANT_REGISTROS-1 downto 0) of std_logic_vector(7 downto 0);
   	
	-- Crea una señal registros que funcione a modo de conjunto de registros
	signal registros : tipo_registros;

begin
	-- Proceso para modificar el contenido de los registros
	process (clk, rst)
	begin
    	-- Si rst=1, asignar "00000000" a cada registro a modo de reseteo
		if rst = '1' then
			for i in 0 to CANT_REGISTROS - 1 loop	-- recorre los "registros" del arreglo
				registros(i) <= "00000000";
			end loop;
		
        -- Cuando ocurra un flanco ascendente y la flag we esta activa, guardar los datos de la entrada din en el registo rd
		elsif (clk'event and clk='1') and we = '1' then
			registros(rd) <= din;
		end if;
	end process;

	-- Enviar a la salida dout del banco lo que esta guardado en el registro rs
	dout <= registros(rs); 

end architecture architecture_regs;
