library ieee.std_logic;
use ieee.std_logic_1164.all;

entity desbordado is port(
   tmaximo: in integer,
   posicion: in integer,
   nuevaposicion: out integer);
end entity;	

architecture desbordado of desbordado is
begin
   with posicion select
	  nuevaposicion<= 0 when posicion>tmaximo,
	  posicion when others;
end architecture;