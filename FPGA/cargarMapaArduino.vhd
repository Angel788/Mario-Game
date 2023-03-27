library ieee;
library work;
use work.mapq.all;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity cargarMapaArduino is port(
       c: integer range 0 to 29;
       key: in std_logic_vector(0 to 2);
		 mapa: in escenario;
		 salidaMapa: out std_logic_vector(0 to 5));
end entity;		 

architecture cargarMapaArduino of cargarMapaArduino is
      signal i: integer:= 0;
begin
    process(c,key)
	 begin
	     if(c<20 and key="000") then
		     salidaMapa<=mapa(c+0);
			elsif(c<20 and key="001") then
		     salidaMapa<=mapa(c+1);
	     elsif(c<20 and key="010") then
		     salidaMapa<=mapa(c+2);
			elsif(c<20 and key="011") then
		     salidaMapa<=mapa(c+3);
	     elsif(c<20 and key="100") then
		     salidaMapa<=mapa(c+4);
			elsif(c<20 and key="101") then
		     salidaMapa<=mapa(c+5);
	     elsif(c<20 and key="110") then
		     salidaMapa<=mapa(c+6);
			elsif(c<20 and key="111") then
			   salidaMapa<=mapa(c+7);
		end if;			
	 end process;
end architecture;