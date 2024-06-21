library IEEE;
use IEEE.std_logic_1164.all;

entity mux is
    port (a: in std_logic_vector(31 downto 0);
          b: in std_logic_vector(31 downto 0);
          s: in std_logic;
          o: out std_logic_vector(31 downto 0)
    );
end mux;

architecture beh of mux is

begin
    o <= a when s = '0' else b;
end beh;
