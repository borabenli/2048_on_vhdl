library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;


entity game_2048_1x4 is
	Port ( 
			tile0_in : in STD_LOGIC_VECTOR (3 downto 0);  -- en sol bit
         tile1_in : in STD_LOGIC_VECTOR (3 downto 0);
         tile2_in : in STD_LOGIC_VECTOR (3 downto 0);
         tile3_in : in STD_LOGIC_VECTOR (3 downto 0);  -- en sağ bit

			tile0_out : out STD_LOGIC_VECTOR (3 downto 0); -- en sol bit
         tile1_out : out STD_LOGIC_VECTOR (3 downto 0);
         tile2_out : out STD_LOGIC_VECTOR (3 downto 0);
         tile3_out : out STD_LOGIC_VECTOR (3 downto 0); -- en sol bit
			
			game_won : out STD_LOGIC;  -- '1' herhangi bir tile 2048 olduğunda 
         game_over : out STD_LOGIC  -- '1' legal hamle kalmadığında ve 2048 yoksa
    );
end game_2048_1x4;

architecture Behavioral of game_2048_1x4 is

	-- Internal signals for processing
	type tile_array is array (0 to 3) of STD_LOGIC_VECTOR(3 downto 0);
   signal output_tiles : tile_array;
    
	-- Constants for tile values
   constant TILE_2048 : STD_LOGIC_VECTOR(3 downto 0) := "1011"; -- 11 in binary = 2048 (2^11)
   -- Encoding: 0=empty, 1=2, 2=4, 3=8, 4=16, 5=32, 6=64, 7=128, 8=256, 9=512, 10=1024, 11=2048
	

	-- boş (0) tile kontrol eden fonksiyon
   function is_empty(tile : STD_LOGIC_VECTOR(3 downto 0)) return boolean is
   begin
		return unsigned(tile) = 0;
   end function;
	
	
	
	-- merge edilme kontrolü (aynı ve 0 dan farklı)
   function can_merge(tile1, tile2 : STD_LOGIC_VECTOR(3 downto 0)) return boolean is
   begin
		return (unsigned(tile1) = unsigned(tile2)) and (unsigned(tile1) /= 0);
   end function;
	
	-- merge işlemi ( 4 bitlik gösterimden dolayı +1 eklemek iki katına çıkarıyo)
   -- 2048 de durdur
	function merge_tiles(tile : STD_LOGIC_VECTOR(3 downto 0)) return STD_LOGIC_VECTOR is
   begin
		if unsigned(tile) = 0 then
			return "0000";
		elsif unsigned(tile) >= 11 then
			-- Stop at 2048 tile (value 11) - game should end here
			return TILE_2048;
		else
			return STD_LOGIC_VECTOR(unsigned(tile) + 1);
		end if;
	end function;

	-- Function to check if 2048 tile exists (game won)
	function has_2048_tile(tiles : tile_array) return boolean is
	begin
		for i in 0 to 3 loop
			if tiles(i) = TILE_2048 then
				return true;
			end if;
		end loop;
			return false;
	end function;
	
	
	-- hamle mümkün mü kontrol et [bence burda bi yanlışlık var]
   function moves_available(tiles : tile_array) return boolean is
	begin
		-- boş tile varsa sıkıntı yok
		for i in 0 to 3 loop
			if is_empty(tiles(i)) then
				return true;
			end if;
		end loop;
		
		-- mergelenebilcek var mı bak 
		for i in 0 to 2 loop
			if can_merge(tiles(i), tiles(i+1)) then
				return true;
			end if;
		end loop;

			return false;
		end function;

begin
	-- sola doğru !!!!!!!!!!!!!!!!!!!!!!
   process(tile0_in, tile1_in, tile2_in, tile3_in)
		variable working_tiles : tile_array;
		variable merged_tiles : tile_array;
		variable write_pos : integer;
		variable i : integer;
		variable input_array : tile_array;
		
	begin
       -- inputları array içine koy
       input_array(0) := tile0_in;
       input_array(1) := tile1_in;
       input_array(2) := tile2_in;
       input_array(3) := tile3_in;
		 
		 -- diğer arrayleri 0 a eşitle
       working_tiles := (others => "0000");
       merged_tiles := (others => "0000");
		 
		 
		 -- 1. Adım - Boş olmayan tüm tile ları sola kaydır
       write_pos := 0;
       for i in 0 to 3 loop
           if not is_empty(input_array(i)) then
               working_tiles(write_pos) := input_array(i);
               write_pos := write_pos + 1;
           end if;
       end loop;

		-- 2. Adım - soldan sağa yanyana olan ve mergelenebilcek tileları merge
		write_pos := 0;
      i := 0;
		
		while i <= 3 and write_pos <= 3 loop
			if is_empty(working_tiles(i)) then
				-- Reached end of non-empty tiles
				exit;
			elsif i = 3 then
               -- Last tile, no merge possible, just copy
               if write_pos <= 3 then
                   merged_tiles(write_pos) := working_tiles(i);
               end if;
               exit;
			elsif can_merge(working_tiles(i), working_tiles(i+1)) then
               -- Merge the two tiles
               if write_pos <= 3 then
                   merged_tiles(write_pos) := merge_tiles(working_tiles(i));
               end if;
               write_pos := write_pos + 1;
               i := i + 2; -- Skip the next tile as it's been merged
			
			else
               -- No merge, just copy the tile
               if write_pos <= 3 then
                   merged_tiles(write_pos) := working_tiles(i);
               end if;
               write_pos := write_pos + 1;
               i := i + 1;
           end if;
       end loop;
		 
		 -- Copy results to output
       output_tiles <= merged_tiles;

	end process;

	
	
	-- Game state detection process
	process(tile0_in, tile1_in, tile2_in, tile3_in, output_tiles)
		variable input_array : tile_array;
	begin
			-- Create input array for checking
         input_array(0) := tile0_in;
         input_array(1) := tile1_in;
         input_array(2) := tile2_in;
         input_array(3) := tile3_in;
			
			-- Check win condition (2048 tile present in input or output)
         if has_2048_tile(input_array) or has_2048_tile(output_tiles) then
				game_won <= '1';
            game_over <= '0';  -- Game won, not over
				
			elsif not moves_available(output_tiles) then
				game_won <= '0';
            game_over <= '1';  -- No moves left, game over
				
			else
            game_won <= '0';
            game_over <= '0';  -- Game continues
			end if;
		end process;


	-- Map internal array to outputs
    tile0_out <= output_tiles(0);
    tile1_out <= output_tiles(1);
    tile2_out <= output_tiles(2);
    tile3_out <= output_tiles(3);

end Behavioral;




        


	




























