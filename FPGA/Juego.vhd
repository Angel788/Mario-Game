library ieee;
library work;
use work.mapq.all;
use work.all;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity Juego is port( 
       multiplexorArduino: in std_logic_vector(0 to 2);
		 display: out std_logic_vector(0 to 2);
		 salidaArduino: out std_logic_vector(0 to 5);
		 posicionMario:out std_logic_vector(0 to 1);
		 pushbtn: in std_logic_vector(0 to 1);
		 clk: in std_logic);
end entity;

architecture Juego of Juego is 
	signal maxC:integer:=19;
	signal consumirMemoria: std_logic;
	signal cargadoo: std_logic;
	signal mapaa:escenario;
	signal mapaTuberiass:escenarioTuberias;
	signal posicionR,nposicionR:integer range -1 to 3:=0;
	signal cc,ncc: integer range 0 to 29:=0;
	signal sigueVivo: std_logic:='1';
	signal mapaVector: std_logic_vector(0 to 5);
	signal reset: std_logic;
	signal debouncerM1,debouncerM2: std_logic;
	signal timeout_cycles : positive:=50000000;
   signal counter : integer range 0 to timeout_cycles - 1;
begin
    cMapa:cargarMapa
	 port map(
	 estacargado => consumirMemoria,
	 mapaCargado =>mapaa,
	 mapatuberias => mapaTuberiass,
	 cargado => cargadoo
	 );
	 cMapaArduino: cargarMapaArduino
	 port map(
	    c=> cc,
		 key=> multiplexorArduino,
		 mapa=> mapaa,
		 salidaMapa => salidaArduino
	 );
	 mPosicionArduino:mandarPosicionArduino
	 port map(
	     posicion=>posicionR,
		  posicionBinario=>posicionMario
	 );
	 debounce1:debouncer
    port map(
	     clk => clk,
		  rst => '0',
		  switch=> pushbtn(0),
		 switch_debounced =>debouncerM1
	 );
    debounce2:debouncer
    port map(
	     clk => clk,
		  rst => '0',
		  switch=> pushbtn(1),
		  switch_debounced =>debouncerM2
	 );
	 ccaer:caer
	 port map(
        c=> mapaa(cc),
		  posicion => posicionR,
		  ds=> display,
	     rn => nposicionR,
	     estavivo=> siguevivo	  
	 );
	 dddesbordado:desbordado
	 port map(
	   posicion => cc,
		nuevaposicion => ncc
	 );
	 process(clk,debouncerM1,debouncerM2,ncc,nposicionR)
	     begin
		     if(clk'event and clk='1')then
			          if(nposicionR/=posicionR) then
						     posicionR<=nposicionR;
						 end if;
						 if(nposicionR=-1) then
						     posicionR<=0;
						 end if;
						 if(posicionR>2) then
						    posicionR<=2;
						 end if;	 
				       if(ncc/=cc) then 
						      cc<=ncc;
					    end if;		 
			          if counter < timeout_cycles - 1 then
                    counter <= counter + 1;
                  else
		               if(debouncerM1='1' and debouncerM2='0') then
				             cc<=cc+1;
				         elsif(debouncerM1='0' and debouncerM2='1')then
				             cc<=cc+1;
					          posicionR<=posicionR+1;
				         end if;
							counter<=0;
						end if;	
			 end if;	 
	 end process;
end architecture;		 