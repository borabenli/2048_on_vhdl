library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity signal_register_final is
    Port ( 
        clk : in STD_LOGIC;
        rst_n : in STD_LOGIC;
        button_left : in STD_LOGIC;
        button_right : in STD_LOGIC;
        button_up : in STD_LOGIC;
        button_down : in STD_LOGIC;
        signal_0 : in STD_LOGIC_VECTOR (3 downto 0);
        signal_1 : in STD_LOGIC_VECTOR (3 downto 0);
        signal_2 : in STD_LOGIC_VECTOR (3 downto 0);
        signal_3 : in STD_LOGIC_VECTOR (3 downto 0);
        signal_4 : in STD_LOGIC_VECTOR (3 downto 0);
        signal_5 : in STD_LOGIC_VECTOR (3 downto 0);
        signal_6 : in STD_LOGIC_VECTOR (3 downto 0);
        signal_7 : in STD_LOGIC_VECTOR (3 downto 0);
        signal_8 : in STD_LOGIC_VECTOR (3 downto 0);
        signal_9 : in STD_LOGIC_VECTOR (3 downto 0);
        signal_10 : in STD_LOGIC_VECTOR (3 downto 0);
        signal_11 : in STD_LOGIC_VECTOR (3 downto 0);
        signal_12 : in STD_LOGIC_VECTOR (3 downto 0);
        signal_13 : in STD_LOGIC_VECTOR (3 downto 0);
        signal_14 : in STD_LOGIC_VECTOR (3 downto 0);
        signal_15 : in STD_LOGIC_VECTOR (3 downto 0);
        reg_signal_0 : out STD_LOGIC_VECTOR (3 downto 0);
        reg_signal_1 : out STD_LOGIC_VECTOR (3 downto 0);
        reg_signal_2 : out STD_LOGIC_VECTOR (3 downto 0);
        reg_signal_3 : out STD_LOGIC_VECTOR (3 downto 0);
        reg_signal_4 : out STD_LOGIC_VECTOR (3 downto 0);
        reg_signal_5 : out STD_LOGIC_VECTOR (3 downto 0);
        reg_signal_6 : out STD_LOGIC_VECTOR (3 downto 0);
        reg_signal_7 : out STD_LOGIC_VECTOR (3 downto 0);
        reg_signal_8 : out STD_LOGIC_VECTOR (3 downto 0);
        reg_signal_9 : out STD_LOGIC_VECTOR (3 downto 0);
        reg_signal_10 : out STD_LOGIC_VECTOR (3 downto 0);
        reg_signal_11 : out STD_LOGIC_VECTOR (3 downto 0);
        reg_signal_12 : out STD_LOGIC_VECTOR (3 downto 0);
        reg_signal_13 : out STD_LOGIC_VECTOR (3 downto 0);
        reg_signal_14 : out STD_LOGIC_VECTOR (3 downto 0);
        reg_signal_15 : out STD_LOGIC_VECTOR (3 downto 0)
    );
end signal_register_final;

architecture Behavioral of signal_register_final is
   
    signal button_left_prev, button_right_prev, button_up_prev, button_down_prev : STD_LOGIC := '1';
    

    signal reg_signal_0_int : STD_LOGIC_VECTOR (3 downto 0) := (others => '0');
    signal reg_signal_1_int : STD_LOGIC_VECTOR (3 downto 0) := (others => '0');
    signal reg_signal_2_int : STD_LOGIC_VECTOR (3 downto 0) := (others => '0');
    signal reg_signal_3_int : STD_LOGIC_VECTOR (3 downto 0) := (others => '0');
    signal reg_signal_4_int : STD_LOGIC_VECTOR (3 downto 0) := (others => '0');	
    signal reg_signal_5_int : STD_LOGIC_VECTOR (3 downto 0) := (others => '0');
    signal reg_signal_6_int : STD_LOGIC_VECTOR (3 downto 0) := (others => '0');
    signal reg_signal_7_int : STD_LOGIC_VECTOR (3 downto 0) := (others => '0');
    signal reg_signal_8_int : STD_LOGIC_VECTOR (3 downto 0) := (others => '0');
    signal reg_signal_9_int : STD_LOGIC_VECTOR (3 downto 0) := (others => '0');
    signal reg_signal_10_int : STD_LOGIC_VECTOR (3 downto 0) := (others => '0');
    signal reg_signal_11_int : STD_LOGIC_VECTOR (3 downto 0) := (others => '0');
    signal reg_signal_12_int : STD_LOGIC_VECTOR (3 downto 0) := (others => '0');
    signal reg_signal_13_int : STD_LOGIC_VECTOR (3 downto 0) := (others => '0');
    signal reg_signal_14_int : STD_LOGIC_VECTOR (3 downto 0) := (others => '0');
    signal reg_signal_15_int : STD_LOGIC_VECTOR (3 downto 0) := (others => '0');

begin
    
 
    main_process : process(clk, rst_n)
    begin
        if rst_n = '1' then
            
            button_left_prev <= '1';
            button_right_prev <= '1';
            button_up_prev <= '1';
            button_down_prev <= '1';
            
          
            reg_signal_0_int <= "0001";
            reg_signal_1_int <= (others => '0');
            reg_signal_2_int <= (others => '0');
            reg_signal_3_int <= (others => '0');
            reg_signal_4_int <= (others => '0');
            reg_signal_5_int <= (others => '0');
            reg_signal_6_int <= (others => '0');
            reg_signal_7_int <= (others => '0');
            reg_signal_8_int <= (others => '0');
            reg_signal_9_int <= (others => '0');
            reg_signal_10_int <= (others => '0');
            reg_signal_11_int <= (others => '0');
            reg_signal_12_int <= (others => '0');
            reg_signal_13_int <= (others => '0');
            reg_signal_14_int <= (others => '0');
            reg_signal_15_int <= (others => '0');
            
        elsif rising_edge(clk) then
    
            button_left_prev <= button_left;
            button_right_prev <= button_right;
            button_up_prev <= button_up;
            button_down_prev <= button_down;
            

            if (button_left = '0' and button_left_prev = '1') or
               (button_right = '0' and button_right_prev= '1') or
               ( button_up= '0' and button_up_prev= '1') or
               ( button_down = '0' and button_down_prev= '1') then
                reg_signal_0_int <= signal_0;
                reg_signal_1_int <= signal_1;
                reg_signal_2_int <= signal_2;
                reg_signal_3_int <= signal_3;
                reg_signal_4_int <= signal_4;
                reg_signal_5_int <= signal_5;
                reg_signal_6_int <= signal_6;
                reg_signal_7_int <= signal_7;
                reg_signal_8_int <= signal_8;
                reg_signal_9_int <= signal_9;
                reg_signal_10_int <= signal_10;
                reg_signal_11_int <= signal_11;
                reg_signal_12_int <= signal_12;
                reg_signal_13_int <= signal_13;
                reg_signal_14_int <= signal_14;
                reg_signal_15_int <= signal_15;
            end if;
        end if;
    end process;
    

    reg_signal_0 <= reg_signal_0_int;
    reg_signal_1 <= reg_signal_1_int;
    reg_signal_2 <= reg_signal_2_int;
    reg_signal_3 <= reg_signal_3_int;
    reg_signal_4 <= reg_signal_4_int;
    reg_signal_5 <= reg_signal_5_int;
    reg_signal_6 <= reg_signal_6_int;
    reg_signal_7 <= reg_signal_7_int;
    reg_signal_8 <= reg_signal_8_int;
    reg_signal_9 <= reg_signal_9_int;
    reg_signal_10 <= reg_signal_10_int;
    reg_signal_11 <= reg_signal_11_int;
    reg_signal_12 <= reg_signal_12_int;
    reg_signal_13 <= reg_signal_13_int;
    reg_signal_14 <= reg_signal_14_int;
    reg_signal_15 <= reg_signal_15_int;
    
end Behavioral;