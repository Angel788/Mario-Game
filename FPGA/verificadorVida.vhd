library ieee;
use ieee.std_logic_1164.all;

entity verificadorVida is port(
   c: in integer;
	r: in integer;
	nc: out integer;
	nr: out integer;
	estavivo: in std_logic);
end verificadorVida;

architecture verificadorVida of verificadorVida is
begin
   process(estavivo)
	begin
   if(estavivo='0') then
	   nc<=0;
		nr<=0;
	else 
     nc<=c;
	  nr<=r;
	end if;  
	end process;  
end architecture;