library ieee;
library work;
use work.mapq.all;
use ieee.std_logic_1164.all;



entity cargarMapaArduino is port(
       c: in integer;
       key: in std_logic_vector(0 to 2);
		 mapa: in escenario;
		 display: out std_logic_vector(0 to 2);
		 salidaMapa: out std_logic_vector(0 to 5));
end entity;		 

architecture cargarMapaArduino of cargarMapaArduino is
      signal i: integer:= 0;
begin
    process(c,key)
	 begin
	     if(c<20 and key="000") then
		     salidaMapa<=mapa(c+0);
			  display<="000";
			elsif(c<20 and key="001") then
		     salidaMapa<=mapa(c+1);
			  display<="101";
	     elsif(c<20 and key="010") then
		     salidaMapa<=mapa(c+2);
			  display<="010";
			elsif(c<20 and key="011") then
		     salidaMapa<=mapa(c+3);
			  display<="011";
	     elsif(c<20 and key="100") then
		     salidaMapa<=mapa(c+4);
			  display<="100";
			elsif(c<20 and key="101") then
		     salidaMapa<=mapa(c+5);
			  display<="101";
	     elsif(c<20 and key="110") then
		     salidaMapa<=mapa(c+6);
			  display<="110";
			elsif(c<20 and key="111") then
		     salidaMapa<=mapa(c+7);
			  display<="111";
			  else
			  display<="000";
			  salidaMapa<=mapa(0);
		end if;			
	 end process;
end architecture;