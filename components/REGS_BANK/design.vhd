library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity regs is
    Port (clk: in std_logic;
          rst: in std_logic;
          we: in std_logic;
          rd: in std_logic_vector(2 downto 0);
          rs: in std_logic_vector(2 downto 0);
          din: in std_logic_vector(7 downto 0);
          dout: out std_logic_vector(7 downto 0));
end regs;

architecture bhd of regs is
    type registerFile is array(0 to 15) of std_logic_vector(7 downto 0);
    signal registers: registerFile;
begin
    read: process (clk, rst)
    begin
        if (rst = '1') then
            for i in 0 to 15 loop
                registers(i) <= (others => '0');
            end loop;
        elsif (clk'event and clk = '1') then
            if (we = '1') then
                registers(to_integer(unsigned(rd))) <= din;
            end if;
        end if;
        dout <= registers(to_integer(unsigned(rs)));
    end process;
end bhd;
