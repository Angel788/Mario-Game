library ieee;
use ieee.std_logic_1164.all;

entity caer is port(
   c:in std_logic_vector(0 to 5);
	posicion: in integer;
	ds: out std_logic_vector(0 to 2);
	rn: out integer;
	estavivo: out std_logic);
end entity;

architecture caer of caer is
begin
    process(c,posicion)
	 begin
	 if(posicion>0 or posicion=0) then 
	    if(c(2-posicion)='0')then
		    rn<=posicion-1;
		  else rn<=posicion;	 
		  end if;
		 --if(2-posicion=0)then 
	    --   ds<="000";
		 --elsif(2-posicion=1)then
	    --   ds<="100";
		--elsif(2-posicion=2)then
	    --   ds<="010";
		--end if;	 
	 else
       estavivo<='0';
	   end if;	 
	 end process;
end architecture;