library ieee;
use ieee.std_logic_1164.all;

package mapq is 
   type escenario  is array(0 to 40) of std_logic_vector(0 to 5);
	type escenarioTuberias is array(0 to 40) of std_logic_vector(0 to 3);
end package;
