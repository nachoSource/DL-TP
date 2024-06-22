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

    uut: ffd
        port map (d => d, clk => clk, rst => rst, q => q);

    tb: process
    begin
        d <= '1';
        clk <= '0';
        rst <= '0';
        wait for 5 ns;

        clk <= '1';
        wait for 5 ns;

        clk <= '0';
        wait for 5 ns;

        rst <= '1';
        wait;

    end process;

end beh;



