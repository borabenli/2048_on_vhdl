library IEEE;
use IEEE.STD_LOGIC_1164.ALL;




entity Mux_4x1_with_4_bit_input_output is
    Port ( 
        LEFT : in  STD_LOGIC_VECTOR (3 downto 0);  -- Left input
        RIGHT : in  STD_LOGIC_VECTOR (3 downto 0);  -- Right input
		  UP : in  STD_LOGIC_VECTOR (3 downto 0);  -- Up input
        DOWN : in  STD_LOGIC_VECTOR (3 downto 0);  -- Down input
        S1 : in  STD_LOGIC;  -- Select line 1 (MSB)
        S0 : in  STD_LOGIC;  -- Select line 0 (LSB)
        Y : out STD_LOGIC_VECTOR (3 downto 0)   -- Output
    );
	 
end Mux_4x1_with_4_bit_input_output;

architecture Behavioral of Mux_4x1_with_4_bit_input_output is
signal SEL : STD_LOGIC_VECTOR(1 downto 0);
begin
    SEL <= S1 & S0;  -- Concatenate select signals
    
    process(LEFT, RIGHT, UP, DOWN, SEL)
    begin
        case SEL is
            when "00" => Y <= LEFT;  -- Left
            when "01" => Y <= RIGHT;  -- Right
            when "10" => Y <= UP;  -- Up
            when "11" => Y <= DOWN;  -- Down
            when others => Y <= (others => '0'); -- Default case
        end case;
    end process;
end Behavioral;