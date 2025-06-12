library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity debouncer is
    Port ( clk       : in  STD_LOGIC;
           noisy_in  : in  STD_LOGIC;
           clean_out : out STD_LOGIC);
			  
end debouncer;

architecture Behavioral of debouncer is
    signal shift_reg : STD_LOGIC_VECTOR(3 downto 0) := (others => '0');
begin
    process(clk)
    begin
        if rising_edge(clk) then
            shift_reg <= shift_reg(2 downto 0) & noisy_in;
        end if;
    end process;
    
    clean_out <= shift_reg(3) and shift_reg(2) and shift_reg(1) and shift_reg(0);
end Behavioral;