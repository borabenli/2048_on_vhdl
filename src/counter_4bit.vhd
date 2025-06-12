library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity counter_4bit is
    Port ( 
			clk : in STD_LOGIC;                    -- Board clock input
        count : out STD_LOGIC_VECTOR(3 downto 0)  -- 4-bit counter output
    );
end counter_4bit;


architecture Behavioral of counter_4bit is
    signal counter_reg : UNSIGNED(3 downto 0) := "0000";
begin
    process(clk)
    begin
        if rising_edge(clk) then
            counter_reg <= counter_reg + 1;
        end if;
    end process;
    
    count <= STD_LOGIC_VECTOR(counter_reg);
    
end Behavioral;