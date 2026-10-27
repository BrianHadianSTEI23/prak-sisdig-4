library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity top_module is
	port (
		CLOCK_50 : in  std_logic;
		SW       : in  std_logic_vector(7 downto 0);
		KEY      : in  std_logic_vector(1 downto 0);
		GPIO     : inout std_logic_vector(1 downto 0);
		LEDR     : out std_logic_vector(7 downto 0);
		HEX0     : out std_logic_vector(6 downto 0)
	);
end top_module;

architecture structural of top_module is	
	component uart is
	port(
		i_CLOCK         : in  std_logic;
		i_DATA          : in  std_logic_vector(7 downto 0);
		i_SEND          : in  std_logic;
		i_DISPLAY       : in  std_logic;
		o_TX            : out std_logic;
		i_RX            : in  std_logic;
		i_log_ADDR      : in  std_logic_vector(7 downto 0);
		o_sig_CRRP_DATA : out std_logic;
		o_sig_RX_BUSY   : out std_logic;
		o_sig_TX_BUSY   : out std_logic;
		o_DATA_OUT      : out std_logic_vector(7 downto 0);
		o_hex           : out std_logic_vector(6 downto 0)
	);
	end component;

	signal s_hex : std_logic_vector(6 downto 0);
begin

	u_uart : uart port map(
		i_CLOCK         => CLOCK_50,
		i_DATA          => SW(7 downto 0),
		i_SEND          => KEY(0),
		i_DISPLAY       => KEY(1),
		o_TX            => GPIO(1),
		i_RX            => GPIO(0),
		i_log_ADDR      => SW(7 downto 0),
		o_sig_CRRP_DATA => open,
		o_sig_RX_BUSY   => open,
		o_sig_TX_BUSY   => open,
		o_DATA_OUT      => LEDR(7 downto 0),
		o_hex           => HEX0
	);

end structural;
