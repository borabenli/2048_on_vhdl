LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;
USE ieee.std_logic_unsigned.all;
entity freq_div is
    Port ( clk_in  : in  STD_LOGIC;
           clk_out : out STD_LOGIC);
end freq_div;

architecture Behavioral of freq_div is
    signal counter : STD_LOGIC_VECTOR(20 downto 0) := (others => '0');

begin
    process(clk_in)
    begin
        if rising_edge(clk_in) then
            counter <= counter + 1;
        end if;
    end process;

    clk_out <= counter(20);

end Behavioral;

