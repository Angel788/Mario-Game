library ieee;
library work;
use work.mapq.all;
use work.all;
use ieee.std_logic_1164.all;


entity Juego is port( 
       multiplexorArduino: in std_logic_vector(0 to 2);
		 display: out std_logic_vector(0 to 2);
		 salidaArduino: out std_logic_vector(0 to 5));
end entity;

architecture Juego of Juego is 
   signal cc: integer :=0;
	signal maxC:integer:=19;
	signal consumirMemoria: std_logic;
	signal cargadoo: std_logic;
	signal mapaa:escenario;
	signal mapaTuberiass:escenarioTuberias;
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
		 display => display,
		 salidaMapa => salidaArduino
	 );
end architecture;		 