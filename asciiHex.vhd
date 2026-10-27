-- Template kode untuk ASCII - HEX (7 Segments) Converter
-- Kode ASCII yang harus diterjemahkan adalah:
-- angka 0, 1, 2, 3, 4, 5, 6, 7, 8, dan 9.
-- huruf A, B, C, D, E, F, G, H, I, dan J.
-- Tampilan pada HEX (7 Segments) sebagai berikut:
-- 0 -> 0
-- 1 -> 1
-- 2 -> 2
-- 3 -> 3
-- 4 -> 4
-- 5 -> 5
-- 6 -> 6
-- 7 -> 7
-- 8 -> 8
-- 9 -> 9
-- A -> A
-- B -> b
-- C -> c
-- D -> d
-- E -> E
-- F -> F
-- G -> G
-- H -> H
-- I -> I (di sebelah kiri, tidak seperti angka 1)
-- J -> j (tanpa titik)
-- Active-low: '0' = ON, '1' = OFF
-- Segment mapping: bit 6=g, 5=f, 4=e, 3=d, 2=c, 1=b, 0=a

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity asciiHex is
	port (
		i_ascii : in  std_logic_vector(7 downto 0);
		o_hex   : out std_logic_vector(6 downto 0) 
	);
end asciiHex;

architecture behavior of asciiHex is
begin

	process(i_ascii)
	begin
		case i_ascii is
			when x"30" => o_hex <= "1000000"; -- '0': a,b,c,d,e,f
			when x"31" => o_hex <= "1111001"; -- '1': b,c
			when x"32" => o_hex <= "0100100"; -- '2': a,b,d,e,g
			when x"33" => o_hex <= "0110000"; -- '3': a,b,c,d,g
			when x"34" => o_hex <= "0011001"; -- '4': b,c,f,g
			when x"35" => o_hex <= "0010010"; -- '5': a,c,d,f,g
			when x"36" => o_hex <= "0000010"; -- '6': a,c,d,e,f,g
			when x"37" => o_hex <= "1111000"; -- '7': a,b,c
			when x"38" => o_hex <= "0000000"; -- '8': a,b,c,d,e,f,g
			when x"39" => o_hex <= "0010000"; -- '9': a,b,c,d,f,g

			when x"41" => o_hex <= "0001000"; -- 'A': a,b,c,e,f,g
			when x"42" => o_hex <= "0000011"; -- 'b': c,d,e,f,g
			when x"43" => o_hex <= "0100111"; -- 'c': d,e,g
			when x"44" => o_hex <= "0100001"; -- 'd': b,c,d,e,g
			when x"45" => o_hex <= "0000110"; -- 'E': a,d,e,f,g
			when x"46" => o_hex <= "0001110"; -- 'F': a,e,f,g
			when x"47" => o_hex <= "0000010"; -- 'G': a,c,d,e,f,g (or '6' shape)
			when x"48" => o_hex <= "0001001"; -- 'H': b,c,e,f,g
			when x"49" => o_hex <= "1001111"; -- 'I': e,f (left side)
			when x"4A" => o_hex <= "1110001"; -- 'j': b,c,d (without dot)

			when others => o_hex <= "1111111";
		end case;
	end process;
	
end behavior;
