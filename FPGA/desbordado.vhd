library ieee;
use ieee.std_logic_1164.all;

entity desbordado is port(
   tmaximo: in integer;
   posicion: in integer;
   nuevaposicion: out integer);
end entity;	

architecture desbordado of desbordado is
begin
   process(posicion)
	begin
	    if(posicion>tmaximo) then
		   nuevaposicion<=0;
		  end if;
	end process;
end architecture;