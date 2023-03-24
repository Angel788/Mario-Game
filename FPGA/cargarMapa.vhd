library ieee;
library work;
use work.mapq.all;
use ieee.std_logic_1164.all;

--package escenario is 
--   type escenario  is array(0 to 40) of std_logic_vector(0 to 5);
--	type escenarioTuberias is array(0 to 40) of std_logic_vector(0 to 3);
--end package;

entity cargarMapa is 
	port(
   estacargado: in std_logic;
	mapaCargado: out escenario;
	mapatuberias: out escenarioTuberias;
	cargado: out std_logic);
	end entity;

architecture cargarMapa of cargarMapa is
   signal mapa: escenario;    
   signal i: integer := 20;	
begin
		              mapa(0)<="101000";
                    mapa(1)<="111100";
                    mapa(2)<="001000";
                    mapa(3)<="011000";
                    mapa(4)<="010000";
                    mapa(5)<="001000";
                    mapa(6)<="001000";
                    mapa(7)<="001000";
                    mapa(8)<="011000";
                    mapa(9)<="111000";
                    mapa(10)<="101100";
                    mapa(11)<="011000";
                    mapa(12)<="011000";
                    mapa(13)<="001000";
                    mapa(14)<="011000";
                    mapa(15)<="011000";
                    mapa(16)<="111000";
                    mapa(17)<="110100";
                    mapa(18)<="100000";
                    mapa(19)<="001000";
						  mapa(20)<="000000";
                    mapa(21)<="000000";
                    mapa(22)<="000000";
                    mapa(23)<="000000";
                    mapa(24)<="000000";
                    mapa(25)<="000000";
                    mapa(26)<="000000";
                    mapa(27)<="000000";
						  mapa(28)<="000000";
						  mapaCargado<=mapa;
end architecture;	