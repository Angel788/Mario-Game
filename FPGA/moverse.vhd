library ieee;
library work;
use work.mapq.all;
use ieee.std_logic_1164.all;

entity moverse is port(
    mapa: in escenario;
    c: in integer;
	 r: in integer;
	 nc: out integer;
	 nr: out integer;
	 pbtn: in std_logic_vector(0 to 1));
end entity;

architecture moverse of moverse is
   signal mapaVector: std_logic_vector(0 to 5); 
begin
   process(pbtn)
	begin
	    if(pbtn="10") then
		    nc<=c+1;
		 elsif(pbtn="01" and r<2)then
	       nc<=c+1;
			 mapaVector<=mapa(c-1);
	          if(mapaVector(r)='0') then
                nr<=r+1;
				  end if;	 
		 else
	       nc<=c;
			 nr<=r;
       end if;			 
	end process;
end architecture;