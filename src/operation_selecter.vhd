----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    01:06:50 06/06/2025 
-- Design Name: 
-- Module Name:    operation_selecter - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity operation_selecter is
	Port(
		CLK: in std_logic;
		right_clean: in std_logic;
		left_clean: in std_logic;
		up_clean: in std_logic;
		down_clean:in std_logic;
		S0: out std_logic;
		S1: out std_logic
		);

end operation_selecter;

architecture Behavioral of operation_selecter is
	signal left_prev, right_prev , up_prev , down_prev : STD_LOGIC := '0';
   signal left_edge, right_edge , up_edge , down_edge : STD_LOGIC;
	--signal S0_reg, S1_reg : STD_LOGIC := '0';  -- Initialize to known values
	
	
	
begin
    -- Connect internal registers to outputs
   -- S0 <= S0_reg;
   --l S1 <= S1_reg;

	
		
	process(clk)
		begin
        if rising_edge(clk) then
            
            
				
				if (left_clean = '1' and left_prev = '0') then
                S0 <= '0';
					 S1 <= '0';
            elsif (right_clean = '1' and right_prev = '0') then
                S0 <= '1';
					 S1 <= '0';
				elsif (up_clean = '1' and up_prev = '0') then
                S0 <= '0';
					 S1 <= '1';
				elsif (down_clean = '1' and down_prev = '0') then

                S0 <= '1';
					 S1 <= '1';
            end if;
				
				left_prev <= left_clean;
            right_prev <= right_clean;
				up_prev <= up_clean;
            down_prev <= down_clean;
				
        end if;
    end process;
				
					


end Behavioral;

