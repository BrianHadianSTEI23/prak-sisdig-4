

library ieee;
use ieee.std_logic_1164.all;  
use ieee.numeric_std.all;


entity bin_to_ascii is
    port (
        a       : in  std_logic_vector(5 downto 0);
        
        b       : out unsigned(5 downto 0)  
    );
end entity bin_to_ascii;


architecture behavioral of bin_to_ascii is 

begin

    b <= unsigned(a);

end architecture behavioral;