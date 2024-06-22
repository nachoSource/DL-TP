library ieee;
use ieee.std_logic_1164.all;

entity ffd is
    port (d, clk, rst: in std_logic;
          q: out std_logic);
end ffd;

architecture compffd of ffd is
begin
    flipflop: process (clk, rst)
    begin
        if (rst = '1') then
            q <= '0';
        elsif (clk' event and clk='1') then
            q <= d  ;
        end if;
    end process;
end compffd;
