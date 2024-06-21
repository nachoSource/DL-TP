library IEEE;
use IEEE.std_logic_1164.all;

entity mux_tb is
end mux_tb;

architecture beh of mux_tb is

    component mux
        port (a: in std_logic_vector(31 downto 0);
              b: in std_logic_vector(31 downto 0);
              s: in std_logic;
              o: out std_logic_vector(31 downto 0)
        );
    end component;

    signal a: std_logic_vector(31 downto 0);
    signal b: std_logic_vector(31 downto 0);
    signal s: std_logic;
    signal o: std_logic_vector(31 downto 0);

begin

    uut: mux
        port map (a => a, b => b, s => s, o => o);

    tb: process
    begin
        a <= x"87654321";
        b <= x"12345678";
        s <= '0';
        wait for 10 ns;

        s <= '1';
        wait for 10 ns;
        wait;

    end process;

end beh;



