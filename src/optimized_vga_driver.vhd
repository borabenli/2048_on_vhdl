LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

entity vga_driver is
    port(
        CLK : in std_logic; -- 100MHz board clk
        X0_0_current_state : in std_logic_vector(3 downto 0);
        X0_1_current_state : in std_logic_vector(3 downto 0);
        X0_2_current_state : in std_logic_vector(3 downto 0);
        X0_3_current_state : in std_logic_vector(3 downto 0);
        X1_0_current_state : in std_logic_vector(3 downto 0);
        X1_1_current_state : in std_logic_vector(3 downto 0);
        X1_2_current_state : in std_logic_vector(3 downto 0);
        X1_3_current_state : in std_logic_vector(3 downto 0);
        X2_0_current_state : in std_logic_vector(3 downto 0);
        X2_1_current_state : in std_logic_vector(3 downto 0);
        X2_2_current_state : in std_logic_vector(3 downto 0);
        X2_3_current_state : in std_logic_vector(3 downto 0);
        X3_0_current_state : in std_logic_vector(3 downto 0);
        X3_1_current_state : in std_logic_vector(3 downto 0);
        X3_2_current_state : in std_logic_vector(3 downto 0);
        X3_3_current_state : in std_logic_vector(3 downto 0);
        game_won : in std_logic;
        game_lost : in std_logic;
        HSYNC : out std_logic;
        VSYNC : out std_logic;
        R : out std_logic_vector(2 downto 0);
        G : out std_logic_vector(2 downto 0);
        B : out std_logic_vector(1 downto 0)
    );
end vga_driver;

architecture Behavioral of vga_driver is
    constant HD : integer := 1599;  
    constant HFP : integer := 24;   
    constant HSP : integer := 80;   
    constant HBP : integer := 96;   
    
    constant VD : integer := 899;   
    constant VFP : integer := 1;    
    constant VSP : integer := 3;    
    constant VBP : integer := 96;   
    
    signal hPos : integer := 0;
    signal vPos : integer := 0;
    signal videoOn : std_logic := '0';
    
   
    constant TILE_WIDTH : integer := 280;
    constant TILE_HEIGHT : integer := 210;
    constant DOT_SIZE : integer := 16;
    constant DOT_SPACING : integer := 32;
    
   
    signal current_tile_value : std_logic_vector(3 downto 0);
    signal tile_x_offset : integer;
    signal tile_y_offset : integer;
    signal in_tile_area : std_logic;
    
   
    signal dot_x_pos : integer;
    signal dot_y_pos : integer;
    signal dot_x_index : integer;
    signal dot_y_index : integer;
    signal is_dot_area : std_logic;
    signal should_draw_dot : std_logic;

begin

    process(CLK)
    begin
        if(CLK'event and CLK = '1') then
            if (hPos = (HD + HFP + HSP + HBP)) then
                hPos <= 0;
            else
                hPos <= hPos + 1;
            end if;
        end if;
    end process;

    process(CLK, hPos)
    begin
        if(CLK'event and CLK = '1') then
            if (hPos = (HD + HFP + HSP + HBP)) then
                if (vPos = (VD + VFP + VSP + VBP)) then
                    vPos <= 0;
                else
                    vPos <= vPos + 1;
                end if;
            end if;
        end if;
    end process;

    process(CLK, hPos)
    begin
        if(CLK'event and CLK = '1') then
            if ((hPos <= (HD+HFP)) OR (hPos > (HD + HFP + HSP))) then
                HSYNC <= '1';
            else
                HSYNC <= '0';
            end if;
        end if;
    end process;


    process(CLK, vPos)
    begin
        if(CLK'event and CLK = '1') then
            if ((vPos <= (VD+VFP)) OR (vPos > (VD + VFP + VSP))) then
                VSYNC <= '1';
            else
                VSYNC <= '0';
            end if;
        end if;
    end process;


    process(CLK, vPos, hPos)
    begin
        if(CLK'event and CLK = '1') then
            if (hPos <= HD and vPos <= VD) then
                videoOn <= '1';
            else
                videoOn <= '0';
            end if;
        end if;
    end process;


    process(hPos, vPos)
    begin
        in_tile_area <= '0';
        current_tile_value <= "0000";
        tile_x_offset <= 0;
        tile_y_offset <= 0;
        
    
        if (hPos >= 210 and hPos < 490 and vPos >= 10 and vPos < 220) then
            in_tile_area <= '1';
            current_tile_value <= X0_0_current_state;
            tile_x_offset <= hPos - 210;
            tile_y_offset <= vPos - 10;
        elsif (hPos >= 510 and hPos < 790 and vPos >= 10 and vPos < 220) then
            in_tile_area <= '1';
            current_tile_value <= X0_1_current_state;
            tile_x_offset <= hPos - 510;
            tile_y_offset <= vPos - 10;
        elsif (hPos >= 810 and hPos < 1090 and vPos >= 10 and vPos < 220) then
            in_tile_area <= '1';
            current_tile_value <= X0_2_current_state;
            tile_x_offset <= hPos - 810;
            tile_y_offset <= vPos - 10;
        elsif (hPos >= 1110 and hPos < 1390 and vPos >= 10 and vPos < 220) then
            in_tile_area <= '1';
            current_tile_value <= X0_3_current_state;
            tile_x_offset <= hPos - 1110;
            tile_y_offset <= vPos - 10;
  
        elsif (hPos >= 210 and hPos < 490 and vPos >= 240 and vPos < 450) then
            in_tile_area <= '1';
            current_tile_value <= X1_0_current_state;
            tile_x_offset <= hPos - 210;
            tile_y_offset <= vPos - 240;
        elsif (hPos >= 510 and hPos < 790 and vPos >= 240 and vPos < 450) then
            in_tile_area <= '1';
            current_tile_value <= X1_1_current_state;
            tile_x_offset <= hPos - 510;
            tile_y_offset <= vPos - 240;
        elsif (hPos >= 810 and hPos < 1090 and vPos >= 240 and vPos < 450) then
            in_tile_area <= '1';
            current_tile_value <= X1_2_current_state;
            tile_x_offset <= hPos - 810;
            tile_y_offset <= vPos - 240;
        elsif (hPos >= 1110 and hPos < 1390 and vPos >= 240 and vPos < 450) then
            in_tile_area <= '1';
            current_tile_value <= X1_3_current_state;
            tile_x_offset <= hPos - 1110;
            tile_y_offset <= vPos - 240;
       
        elsif (hPos >= 210 and hPos < 490 and vPos >= 470 and vPos < 680) then
            in_tile_area <= '1';
            current_tile_value <= X2_0_current_state;
            tile_x_offset <= hPos - 210;
            tile_y_offset <= vPos - 470;
        elsif (hPos >= 510 and hPos < 790 and vPos >= 470 and vPos < 680) then
            in_tile_area <= '1';
            current_tile_value <= X2_1_current_state;
            tile_x_offset <= hPos - 510;
            tile_y_offset <= vPos - 470;
        elsif (hPos >= 810 and hPos < 1090 and vPos >= 470 and vPos < 680) then
            in_tile_area <= '1';
            current_tile_value <= X2_2_current_state;
            tile_x_offset <= hPos - 810;
            tile_y_offset <= vPos - 470;
        elsif (hPos >= 1110 and hPos < 1390 and vPos >= 470 and vPos < 680) then
            in_tile_area <= '1';
            current_tile_value <= X2_3_current_state;
            tile_x_offset <= hPos - 1110;
            tile_y_offset <= vPos - 470;
        
        elsif (hPos >= 210 and hPos < 490 and vPos >= 700 and vPos < 890) then
            in_tile_area <= '1';
            current_tile_value <= X3_0_current_state;
            tile_x_offset <= hPos - 210;
            tile_y_offset <= vPos - 700;
        elsif (hPos >= 510 and hPos < 790 and vPos >= 700 and vPos < 890) then
            in_tile_area <= '1';
            current_tile_value <= X3_1_current_state;
            tile_x_offset <= hPos - 510;
            tile_y_offset <= vPos - 700;
        elsif (hPos >= 810 and hPos < 1090 and vPos >= 700 and vPos < 890) then
            in_tile_area <= '1';
            current_tile_value <= X3_2_current_state;
            tile_x_offset <= hPos - 810;
            tile_y_offset <= vPos - 700;
        elsif (hPos >= 1110 and hPos < 1390 and vPos >= 700 and vPos < 890) then
            in_tile_area <= '1';
            current_tile_value <= X3_3_current_state;
            tile_x_offset <= hPos - 1110;
            tile_y_offset <= vPos - 700;
        end if;
    end process;

    
    process(tile_x_offset, tile_y_offset)
    begin
        dot_x_pos <= tile_x_offset / DOT_SPACING;
        dot_y_pos <= tile_y_offset / DOT_SPACING;
        dot_x_index <= tile_x_offset mod DOT_SPACING;
        dot_y_index <= tile_y_offset mod DOT_SPACING;
        
        if (dot_x_index < DOT_SIZE and dot_y_index < DOT_SIZE) then
            is_dot_area <= '1';
        else
            is_dot_area <= '0';
        end if;
    end process;

   
    process(current_tile_value, dot_x_pos, dot_y_pos)
    begin
        should_draw_dot <= '0';
        
        case current_tile_value is
            when "0001" => -- 2: 1 dot at center
                if (dot_x_pos = 4 and dot_y_pos = 3) then
                    should_draw_dot <= '1';
                end if;
            when "0010" => -- 4: 2 dots diagonal
                if ((dot_x_pos = 3 and dot_y_pos = 2) or 
                    (dot_x_pos = 5 and dot_y_pos = 4)) then
                    should_draw_dot <= '1';
                end if;
            when "0011" => -- 8: 3 dots triangle
                if ((dot_x_pos = 4 and dot_y_pos = 2) or 
                    (dot_x_pos = 3 and dot_y_pos = 4) or
                    (dot_x_pos = 5 and dot_y_pos = 4)) then
                    should_draw_dot <= '1';
                end if;
            when "0100" => -- 16: 4 dots square
                if ((dot_x_pos = 3 and dot_y_pos = 2) or 
                    (dot_x_pos = 5 and dot_y_pos = 2) or
                    (dot_x_pos = 3 and dot_y_pos = 4) or
                    (dot_x_pos = 5 and dot_y_pos = 4)) then
                    should_draw_dot <= '1';
                end if;
            when "0101" => -- 32: 5 dots cross
                if ((dot_x_pos = 4 and dot_y_pos = 2) or 
                    (dot_x_pos = 3 and dot_y_pos = 3) or
                    (dot_x_pos = 4 and dot_y_pos = 3) or
                    (dot_x_pos = 5 and dot_y_pos = 3) or
                    (dot_x_pos = 4 and dot_y_pos = 4)) then
                    should_draw_dot <= '1';
                end if;
            when "0110" => -- 64: 6 dots rectangle
                if ((dot_x_pos = 3 and dot_y_pos = 2) or 
                    (dot_x_pos = 5 and dot_y_pos = 2) or
                    (dot_x_pos = 3 and dot_y_pos = 3) or
                    (dot_x_pos = 5 and dot_y_pos = 3) or
                    (dot_x_pos = 3 and dot_y_pos = 4) or
                    (dot_x_pos = 5 and dot_y_pos = 4)) then
                    should_draw_dot <= '1';
                end if;
            when "0111" => -- 128: 7 dots
                if ((dot_x_pos = 3 and dot_y_pos = 2) or 
                    (dot_x_pos = 4 and dot_y_pos = 2) or
                    (dot_x_pos = 5 and dot_y_pos = 2) or
                    (dot_x_pos = 3 and dot_y_pos = 3) or
                    (dot_x_pos = 5 and dot_y_pos = 3) or
                    (dot_x_pos = 3 and dot_y_pos = 4) or
                    (dot_x_pos = 5 and dot_y_pos = 4)) then
                    should_draw_dot <= '1';
                end if;
            when "1000" => -- 256: 8 dots
                if ((dot_x_pos = 3 and dot_y_pos = 1) or 
                    (dot_x_pos = 5 and dot_y_pos = 1) or
                    (dot_x_pos = 3 and dot_y_pos = 2) or
                    (dot_x_pos = 5 and dot_y_pos = 2) or
                    (dot_x_pos = 3 and dot_y_pos = 3) or
                    (dot_x_pos = 5 and dot_y_pos = 3) or
                    (dot_x_pos = 3 and dot_y_pos = 4) or
                    (dot_x_pos = 5 and dot_y_pos = 4)) then
                    should_draw_dot <= '1';
                end if;
            when "1001" => -- 512: 9 dots
                if ((dot_x_pos >= 3 and dot_x_pos <= 5) and 
                    (dot_y_pos >= 2 and dot_y_pos <= 4)) then
                    should_draw_dot <= '1';
                end if;
            when "1010" => -- 1024: 10 dots
                if ((dot_x_pos >= 2 and dot_x_pos <= 6 and dot_y_pos = 2) or
                    (dot_x_pos >= 2 and dot_x_pos <= 6 and dot_y_pos = 4)) then
                    should_draw_dot <= '1';
                end if;
            when "1011" => -- 2048: 11 dots
                if ((dot_x_pos >= 2 and dot_x_pos <= 6 and dot_y_pos = 2) or
                    (dot_x_pos = 4 and dot_y_pos = 3) or
                    (dot_x_pos >= 2 and dot_x_pos <= 6 and dot_y_pos = 4)) then
                    should_draw_dot <= '1';
                end if;
            when others =>
                should_draw_dot <= '0';
        end case;
    end process;

  
    process(CLK)
    begin
        if(CLK'event and CLK = '1') then
            if (videoOn = '1') then
                if (game_won = '1') then
                   
                    if (hPos >= 0 and hPos <= 200) then
                        R <= "000"; G <= "111"; B <= "00";
                    else
                        R <= "001"; G <= "001"; B <= "01";
                    end if;
                elsif (game_lost = '1') then
                  
                    if (hPos >= 1500 and hPos <= 1599) then
                        R <= "111"; G <= "000"; B <= "00";
                    else
                        R <= "001"; G <= "001"; B <= "01";
                    end if;
                elsif (in_tile_area = '1') then
                    if (is_dot_area = '1' and should_draw_dot = '1') then
                        
                        R <= "000"; G <= "000"; B <= "00";
                    else
                        
                        case current_tile_value is
                            when "0000" => R <= "110"; G <= "110"; B <= "11"; -- Light Gray
                            when "0001" => R <= "111"; G <= "111"; B <= "10"; -- Light Yellow
                            when "0010" => R <= "111"; G <= "101"; B <= "01"; -- Orange
                            when "0011" => R <= "111"; G <= "011"; B <= "00"; -- Red-Orange
                            when "0100" => R <= "111"; G <= "001"; B <= "00"; -- Red
                            when "0101" => R <= "100"; G <= "000"; B <= "00"; -- Dark Red
                            when "0110" => R <= "100"; G <= "000"; B <= "11"; -- Purple
                            when "0111" => R <= "011"; G <= "000"; B <= "11"; -- Blue-Purple
                            when "1000" => R <= "000"; G <= "011"; B <= "11"; -- Blue
                            when "1001" => R <= "000"; G <= "101"; B <= "11"; -- Light Blue
                            when "1010" => R <= "000"; G <= "111"; B <= "11"; -- Cyan
                            when "1011" => R <= "011"; G <= "111"; B <= "01"; -- Light Green
                            when others => R <= "000"; G <= "000"; B <= "00"; -- Black
                        end case;
                    end if;
                else
                 
                    R <= "001"; G <= "001"; B <= "01";
                end if;
            else
           
                R <= "000"; G <= "000"; B <= "00";
            end if;
        end if;
    end process;

end Behavioral;