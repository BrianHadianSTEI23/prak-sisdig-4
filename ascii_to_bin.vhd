

library ieee;
use ieee.std_logic_1164.all;  
use ieee.numeric_std.all;


entity ascii_to_bin is
    port (
        a       : in  unsigned(5 downto 0);
        
        b       : out std_logic_vector(5 downto 0)
    );
end entity ascii_to_bin;


architecture behavioral of ascii_to_bin is 

begin

    b <= std_logic_vector(a);


end architecture behavioral;