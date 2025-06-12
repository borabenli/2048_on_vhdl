library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;




entity compute_operations is
        Port (
            f1_0   : in  STD_LOGIC_VECTOR(3 downto 0);
				f1_1   : in  STD_LOGIC_VECTOR(3 downto 0);
				f1_2   : in  STD_LOGIC_VECTOR(3 downto 0);
				f1_3   : in  STD_LOGIC_VECTOR(3 downto 0);
				f2_0   : in  STD_LOGIC_VECTOR(3 downto 0);
				f2_1   : in  STD_LOGIC_VECTOR(3 downto 0);
				f2_2   : in  STD_LOGIC_VECTOR(3 downto 0);
				f2_3   : in  STD_LOGIC_VECTOR(3 downto 0);
				f3_0   : in  STD_LOGIC_VECTOR(3 downto 0);
				f3_1   : in  STD_LOGIC_VECTOR(3 downto 0);
				f3_2   : in  STD_LOGIC_VECTOR(3 downto 0);
				f3_3   : in  STD_LOGIC_VECTOR(3 downto 0);
				f4_0   : in  STD_LOGIC_VECTOR(3 downto 0);
				f4_1   : in  STD_LOGIC_VECTOR(3 downto 0);
				f4_2   : in  STD_LOGIC_VECTOR(3 downto 0);
				f4_3   : in  STD_LOGIC_VECTOR(3 downto 0);
				
				win_condition   : out  STD_LOGIC;
				move_available  : out STD_LOGIC;
				
				f1_0_out   : out  STD_LOGIC_VECTOR(3 downto 0);
				f1_1_out   : out  STD_LOGIC_VECTOR(3 downto 0);
				f1_2_out   : out  STD_LOGIC_VECTOR(3 downto 0);
				f1_3_out   : out  STD_LOGIC_VECTOR(3 downto 0);
				f2_0_out   : out  STD_LOGIC_VECTOR(3 downto 0);
				f2_1_out   : out  STD_LOGIC_VECTOR(3 downto 0);
				f2_2_out   : out  STD_LOGIC_VECTOR(3 downto 0);
				f2_3_out   : out  STD_LOGIC_VECTOR(3 downto 0);
				f3_0_out   : out  STD_LOGIC_VECTOR(3 downto 0);
				f3_1_out   : out  STD_LOGIC_VECTOR(3 downto 0);
				f3_2_out   : out  STD_LOGIC_VECTOR(3 downto 0);
				f3_3_out   : out  STD_LOGIC_VECTOR(3 downto 0);
				f4_0_out   : out  STD_LOGIC_VECTOR(3 downto 0);
				f4_1_out   : out  STD_LOGIC_VECTOR(3 downto 0);
				f4_2_out   : out  STD_LOGIC_VECTOR(3 downto 0);
				f4_3_out   : out  STD_LOGIC_VECTOR(3 downto 0)
				
        );
end compute_operations;



architecture Structural of compute_operations is


	component game_2048_1x4 
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
	end component;

	signal game_won_f1 : std_logic;
	signal game_won_f2 : std_logic;
	signal game_won_f3 : std_logic;
	signal game_won_f4 : std_logic;
	signal game_over_f1 : std_logic;
	signal game_over_f2 : std_logic;
	signal game_over_f3 : std_logic;
	signal game_over_f4 : std_logic;
	 




begin






	f1 : game_2048_1x4 
		port map(
			tile0_in => f1_0,
         tile1_in => f1_1,
         tile2_in => f1_2,
         tile3_in => f1_3,

			tile0_out => f1_0_out,
         tile1_out => f1_1_out,
         tile2_out => f1_2_out,
         tile3_out => f1_3_out,
			
			game_won  => game_won_f1,
         game_over => game_over_f1
		
		);
		
	f2 : game_2048_1x4 
		port map(
			tile0_in => f2_0,
         tile1_in => f2_1,
         tile2_in => f2_2,
         tile3_in => f2_3,

			tile0_out => f2_0_out,
         tile1_out => f2_1_out,
         tile2_out => f2_2_out,
         tile3_out => f2_3_out,
			
			game_won  => game_won_f2,
         game_over => game_over_f2
		
		);


	f3 : game_2048_1x4 
		port map(
			tile0_in => f3_0,
         tile1_in => f3_1,
         tile2_in => f3_2,
         tile3_in => f3_3,

			tile0_out => f3_0_out,
         tile1_out => f3_1_out,
         tile2_out => f3_2_out,
         tile3_out => f3_3_out,
			
			game_won  => game_won_f3,
         game_over => game_over_f3
		
		);

	
	f4 : game_2048_1x4 
		port map(
			tile0_in => f4_0,
         tile1_in => f4_1,
         tile2_in => f4_2,
         tile3_in => f4_3,

			tile0_out => f4_0_out,
         tile1_out => f4_1_out,
         tile2_out => f4_2_out,
         tile3_out => f4_3_out,
			
			game_won  => game_won_f4,
         game_over => game_over_f4
		
		);



	win_condition <= game_won_f1 or game_won_f2 or game_won_f3 or game_won_f4 ;
	
	move_available <= game_over_f1 and game_over_f2 and game_over_f3 and game_over_f4 ;
	
end Structural;








