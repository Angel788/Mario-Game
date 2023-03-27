library ieee;
use ieee.std_logic_1164.all;

entity desbordado is port(
   posicion: in integer;
   nuevaposicion: out integer);
end entity;	

architecture desbordado of desbordado is
begin
   process(posicion)
	begin
	    if(posicion>19) then
		   nuevaposicion<=0;
		 else  
		    nuevaposicion<=posicion;
		 end if;
	end process;
end architecture;