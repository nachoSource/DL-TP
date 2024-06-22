library IEEE;
use IEEE.std_logic_1164.all;

entity ffd_tb is
end ffd_tb;

architecture beh of ffd_tb is

    component ffd
        port (d: in std_logic;
              clk: in std_logic;
              rst: in std_logic;
              q: out std_logic
        );
    end component;

    signal d: std_logic;
    signal clk: std_logic;
    signal rst: std_logic;
    signal q: std_logic;

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



