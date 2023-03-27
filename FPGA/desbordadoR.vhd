library ieee;
use ieee.std_logic_1164.all;

entity desbordadoR is port(
   r: in integer;
   nr: out integer);
end desbordadoR;

architecture desbordadoR of desbordadoR is
begin
    process(r)
	 begin
    if(r>2) then
	   nr<=2;
	 else nr<=r;
	end if;
   end process;	
end architecture;	
	