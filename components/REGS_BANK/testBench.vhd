library IEEE;
use IEEE.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_textio.all;
use std.textio.all;

entity regs_tb is
end regs_tb;

architecture beh of regs_tb is

    component regs
        port (clk: in std_logic;
              rst: in std_logic;
              we: in std_logic;
              rd: in std_logic_vector(2 downto 0);
              rs: in std_logic_vector(2 downto 0);
              din: in std_logic_vector(7 downto 0);
              dout: out std_logic_vector(7 downto 0)
        );
    end component;

    signal clk: std_logic := '0';
    signal rst: std_logic := '0';
    signal we: std_logic := '0';
    signal rd: std_logic_vector(2 downto 0) := "000";
    signal rs: std_logic_vector(2 downto 0) := "000";
    signal din: std_logic_vector(7 downto 0) := "00000000";
    signal dout: std_logic_vector(7 downto 0);

    constant clk_period: time := 10 ns;

    function to_bitstring(slv: std_logic_vector) return string is
        variable result: string(1 to slv'length);
    begin
        for i in slv'range loop
            if slv(i) = '1' then
                result(result'length - i) := '1';
            else
                result(result'length - i) := '0';
            end if;
        end loop;
        return result;
    end function;
begin

    uut: regs
        port map (clk => clk,
                  rst => rst,
                  we => we,
                  rd => rd,
                  rs => rs,
                  din => din,
                  dout => dout);

    clk_process: process
    begin
        while true loop
            clk <= '0';
            wait for clk_period / 2;
            clk <= '1';
            wait for clk_period / 2;
        end loop;
    end process;

    tb: process
    begin
        rst <= '1';
        wait for clk_period;
        rst <= '0';
        wait for clk_period;

        we <= '1';
        rd <= "101";
        din <= "10101010";
        wait for clk_period;

        we <= '0';
        wait for clk_period;

        rs <= "101";
        wait for clk_period;

        assert dout = "10101010"
            report "Test failed: dout /= 10101010"
            severity error;

        wait;
    end process;

    monitor: process
        variable v_line: line;
    begin
        wait for 5 ns;
        while true loop
            wait for clk_period;
            write(v_line, string'("Time: "));
            write(v_line, now, right, 20);
            write(v_line, string'(" ns, dout: ") & to_bitstring(dout));
            writeline(output, v_line);
        end loop;
    end process;

end beh;
