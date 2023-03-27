library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity mandarPosicionArduino is port(
       posicion: integer range 0 to 2;
		 posicionBinario: out std_logic_vector(0 to 1));
end entity;

architecture mandarPosicionArduino of mandarPosicionArduino is
begin
     with posicion select
	     posicionBinario<="00" when 0,
		  "01" when 1,
		  "10" when 2,
		  "11" when others;
end architecture;