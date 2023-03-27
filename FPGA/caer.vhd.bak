library ieee.std_logic;
use ieee.std_logic_1164.all;

entity caer is port(
   c:in std_logic_vector(0 to 6);
	posicion: in integer;
	cs: out integer;
	estavivo: out;
end entity;

architecture caer of caer is
begin
    process(c,posicion)
	 if(posicion>0 or posicion=0) then 
	    if(c(posicion)='0')then
		    cs=cs-1;
	 else
       estavivo='0';	 
	 end process;
end architecture;