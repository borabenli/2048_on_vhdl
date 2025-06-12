library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;


entity top_module_2048 is
    Port (
	 
		CLK : in std_logic;
		load_button : in std_logic;
		up_button : in std_logic;
		down_button : in std_logic;
		right_button : in std_logic;
		left_button : in std_logic;
		
		HSYNC : out std_logic;
		VSYNC : out std_logic;
		R : out std_logic_vector(2 downto 0);
		G : out std_logic_vector(2 downto 0);
		B : out std_logic_vector(1 downto 0)
	
        
    );
	 
end top_module_2048;


architecture Structural of top_module_2048 is

	component freq_div is
      Port ( clk_in  : in  STD_LOGIC;
             clk_out : out STD_LOGIC);
   end component;

	component all_operations is
		Port (
        X0_0_current_state   : in  STD_LOGIC_VECTOR(3 downto 0);
        X0_1_current_state   : in  STD_LOGIC_VECTOR(3 downto 0);
		  X0_2_current_state   : in  STD_LOGIC_VECTOR(3 downto 0);
		  X0_3_current_state   : in  STD_LOGIC_VECTOR(3 downto 0);
		  X1_0_current_state   : in  STD_LOGIC_VECTOR(3 downto 0);
		  X1_1_current_state   : in  STD_LOGIC_VECTOR(3 downto 0);
		  X1_2_current_state   : in  STD_LOGIC_VECTOR(3 downto 0);
		  X1_3_current_state   : in  STD_LOGIC_VECTOR(3 downto 0);
		  X2_0_current_state   : in  STD_LOGIC_VECTOR(3 downto 0);
		  X2_1_current_state   : in  STD_LOGIC_VECTOR(3 downto 0);
		  X2_2_current_state   : in  STD_LOGIC_VECTOR(3 downto 0);
		  X2_3_current_state   : in  STD_LOGIC_VECTOR(3 downto 0);
		  X3_0_current_state   : in  STD_LOGIC_VECTOR(3 downto 0);
		  X3_1_current_state   : in  STD_LOGIC_VECTOR(3 downto 0);
		  X3_2_current_state   : in  STD_LOGIC_VECTOR(3 downto 0);
		  X3_3_current_state   : in  STD_LOGIC_VECTOR(3 downto 0);
		  
		  X0_0_next_state   : out  STD_LOGIC_VECTOR(3 downto 0);
        X0_1_next_state   : out  STD_LOGIC_VECTOR(3 downto 0);
		  X0_2_next_state   : out  STD_LOGIC_VECTOR(3 downto 0);
		  X0_3_next_state   : out  STD_LOGIC_VECTOR(3 downto 0);
		  X1_0_next_state   : out  STD_LOGIC_VECTOR(3 downto 0);
		  X1_1_next_state   : out  STD_LOGIC_VECTOR(3 downto 0);
		  X1_2_next_state   : out  STD_LOGIC_VECTOR(3 downto 0);
		  X1_3_next_state   : out  STD_LOGIC_VECTOR(3 downto 0);
		  X2_0_next_state   : out  STD_LOGIC_VECTOR(3 downto 0);
		  X2_1_next_state   : out  STD_LOGIC_VECTOR(3 downto 0);
		  X2_2_next_state   : out  STD_LOGIC_VECTOR(3 downto 0);
		  X2_3_next_state   : out  STD_LOGIC_VECTOR(3 downto 0);
		  X3_0_next_state   : out  STD_LOGIC_VECTOR(3 downto 0);
		  X3_1_next_state   : out  STD_LOGIC_VECTOR(3 downto 0);
		  X3_2_next_state   : out  STD_LOGIC_VECTOR(3 downto 0);
		  X3_3_next_state   : out  STD_LOGIC_VECTOR(3 downto 0);
		  
		  S0 : in STD_LOGIC;
		  S1 : in STD_LOGIC;
		  game_lost : out STD_LOGIC;
		  game_won : out STD_LOGIC
		  
		  
    );
	 
	 end component;
	 
	 
	 
	 
	component debouncer is
		Port ( clk       : in  STD_LOGIC;
           noisy_in  : in  STD_LOGIC;
           clean_out : out STD_LOGIC
			  );
			  
	end component;
	
	
	
	
	component operation_selecter is
		Port(
		CLK: in std_logic;
		right_clean: in std_logic;
		left_clean: in std_logic;
		up_clean: in std_logic;
		down_clean:in std_logic;
		S0: out std_logic;
		S1: out std_logic
		);

	end component;
	
	
	
	
	component random_tile_generator is
    Port (
        clk : in STD_LOGIC;
        
        -- 16 4-bit inputs
        input_0  : in  STD_LOGIC_VECTOR(3 downto 0);
        input_1  : in  STD_LOGIC_VECTOR(3 downto 0);
        input_2  : in  STD_LOGIC_VECTOR(3 downto 0);
        input_3  : in  STD_LOGIC_VECTOR(3 downto 0);
        input_4  : in  STD_LOGIC_VECTOR(3 downto 0);
        input_5  : in  STD_LOGIC_VECTOR(3 downto 0);
        input_6  : in  STD_LOGIC_VECTOR(3 downto 0);
        input_7  : in  STD_LOGIC_VECTOR(3 downto 0);
        input_8  : in  STD_LOGIC_VECTOR(3 downto 0);
        input_9  : in  STD_LOGIC_VECTOR(3 downto 0);
        input_10 : in  STD_LOGIC_VECTOR(3 downto 0);
        input_11 : in  STD_LOGIC_VECTOR(3 downto 0);
        input_12 : in  STD_LOGIC_VECTOR(3 downto 0);
        input_13 : in  STD_LOGIC_VECTOR(3 downto 0);
        input_14 : in  STD_LOGIC_VECTOR(3 downto 0);
        input_15 : in  STD_LOGIC_VECTOR(3 downto 0);
        
        -- 4-bit selector input
        A : in STD_LOGIC_VECTOR(3 downto 0);
        
        -- 16 4-bit outputs
        output_0  : out STD_LOGIC_VECTOR(3 downto 0);
        output_1  : out STD_LOGIC_VECTOR(3 downto 0);
        output_2  : out STD_LOGIC_VECTOR(3 downto 0);
        output_3  : out STD_LOGIC_VECTOR(3 downto 0);
        output_4  : out STD_LOGIC_VECTOR(3 downto 0);
        output_5  : out STD_LOGIC_VECTOR(3 downto 0);
        output_6  : out STD_LOGIC_VECTOR(3 downto 0);
        output_7  : out STD_LOGIC_VECTOR(3 downto 0);
        output_8  : out STD_LOGIC_VECTOR(3 downto 0);
        output_9  : out STD_LOGIC_VECTOR(3 downto 0);
        output_10 : out STD_LOGIC_VECTOR(3 downto 0);
        output_11 : out STD_LOGIC_VECTOR(3 downto 0);
        output_12 : out STD_LOGIC_VECTOR(3 downto 0);
        output_13 : out STD_LOGIC_VECTOR(3 downto 0);
        output_14 : out STD_LOGIC_VECTOR(3 downto 0);
        output_15 : out STD_LOGIC_VECTOR(3 downto 0)
    );
	end component;
	
	component counter_4bit is
    Port ( 
			clk : in STD_LOGIC;                    -- Board clock input
        count : out STD_LOGIC_VECTOR(3 downto 0)  -- 4-bit counter output
    );
	end component;



	component signal_register_final is
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
	end component;
	
	
	
	component vga_driver is
	port(
	
	
	CLK : in std_logic; -- 100MH board clk
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
	
end component;
	
	signal slow_clk    : std_logic;
	signal left_clean_sig : std_logic;
	signal up_clean_sig : std_logic;
	signal right_clean_sig : std_logic;
	signal down_clean_sig : std_logic;
	signal load_clean_sig : std_logic;
	
	signal S0_sig : std_logic;
	signal S1_sig : std_logic;
	
	
	signal X0_0_current_state_sig : STD_LOGIC_VECTOR(3 downto 0);
	signal X0_1_current_state_sig : STD_LOGIC_VECTOR(3 downto 0);
	signal X0_2_current_state_sig : STD_LOGIC_VECTOR(3 downto 0);
	signal X0_3_current_state_sig : STD_LOGIC_VECTOR(3 downto 0);
	signal X1_0_current_state_sig : STD_LOGIC_VECTOR(3 downto 0);
	signal X1_1_current_state_sig : STD_LOGIC_VECTOR(3 downto 0);
	signal X1_2_current_state_sig : STD_LOGIC_VECTOR(3 downto 0);
	signal X1_3_current_state_sig : STD_LOGIC_VECTOR(3 downto 0);
	signal X2_0_current_state_sig : STD_LOGIC_VECTOR(3 downto 0);
	signal X2_1_current_state_sig : STD_LOGIC_VECTOR(3 downto 0);
	signal X2_2_current_state_sig : STD_LOGIC_VECTOR(3 downto 0);
	signal X2_3_current_state_sig : STD_LOGIC_VECTOR(3 downto 0);
	signal X3_0_current_state_sig : STD_LOGIC_VECTOR(3 downto 0);
	signal X3_1_current_state_sig : STD_LOGIC_VECTOR(3 downto 0);
	signal X3_2_current_state_sig : STD_LOGIC_VECTOR(3 downto 0);
	signal X3_3_current_state_sig : STD_LOGIC_VECTOR(3 downto 0);

	
	signal X0_0_next_state_sig : STD_LOGIC_VECTOR(3 downto 0);
	signal X0_1_next_state_sig : STD_LOGIC_VECTOR(3 downto 0);
	signal X0_2_next_state_sig : STD_LOGIC_VECTOR(3 downto 0);
	signal X0_3_next_state_sig : STD_LOGIC_VECTOR(3 downto 0);
	signal X1_0_next_state_sig : STD_LOGIC_VECTOR(3 downto 0);
	signal X1_1_next_state_sig : STD_LOGIC_VECTOR(3 downto 0);
	signal X1_2_next_state_sig : STD_LOGIC_VECTOR(3 downto 0);
	signal X1_3_next_state_sig : STD_LOGIC_VECTOR(3 downto 0);
	signal X2_0_next_state_sig : STD_LOGIC_VECTOR(3 downto 0);
	signal X2_1_next_state_sig : STD_LOGIC_VECTOR(3 downto 0);
	signal X2_2_next_state_sig : STD_LOGIC_VECTOR(3 downto 0);
	signal X2_3_next_state_sig : STD_LOGIC_VECTOR(3 downto 0);
	signal X3_0_next_state_sig : STD_LOGIC_VECTOR(3 downto 0);
	signal X3_1_next_state_sig : STD_LOGIC_VECTOR(3 downto 0);
	signal X3_2_next_state_sig : STD_LOGIC_VECTOR(3 downto 0);
	signal X3_3_next_state_sig : STD_LOGIC_VECTOR(3 downto 0);
	
	signal game_lost_sig : STD_LOGIC;
	signal game_won_sig : STD_LOGIC;

	signal X0_0_transfer_sig : STD_LOGIC_VECTOR(3 downto 0);
	signal X0_1_transfer_sig : STD_LOGIC_VECTOR(3 downto 0);
	signal X0_2_transfer_sig : STD_LOGIC_VECTOR(3 downto 0);
	signal X0_3_transfer_sig : STD_LOGIC_VECTOR(3 downto 0);
	signal X1_0_transfer_sig : STD_LOGIC_VECTOR(3 downto 0);
	signal X1_1_transfer_sig : STD_LOGIC_VECTOR(3 downto 0);
	signal X1_2_transfer_sig : STD_LOGIC_VECTOR(3 downto 0);
	signal X1_3_transfer_sig : STD_LOGIC_VECTOR(3 downto 0);
	signal X2_0_transfer_sig : STD_LOGIC_VECTOR(3 downto 0);
	signal X2_1_transfer_sig : STD_LOGIC_VECTOR(3 downto 0);
	signal X2_2_transfer_sig : STD_LOGIC_VECTOR(3 downto 0);
	signal X2_3_transfer_sig : STD_LOGIC_VECTOR(3 downto 0);
	signal X3_0_transfer_sig : STD_LOGIC_VECTOR(3 downto 0);
	signal X3_1_transfer_sig : STD_LOGIC_VECTOR(3 downto 0);
	signal X3_2_transfer_sig : STD_LOGIC_VECTOR(3 downto 0);
	signal X3_3_transfer_sig : STD_LOGIC_VECTOR(3 downto 0);
	
	signal counter_sig : STD_LOGIC_VECTOR(3 downto 0);
	
	signal HSYNC_sig  : STD_LOGIC;
	signal VSYNC_sig  : STD_LOGIC;
	signal R_sig  : STD_LOGIC_VECTOR(2 downto 0);
	signal G_sig  : STD_LOGIC_VECTOR(2 downto 0);
	signal B_sig  : STD_LOGIC_VECTOR(1 downto 0);
		
	
	
	
	
	
begin
	frequencydivider: freq_div
      port map (
         clk_in  => CLK,
         clk_out => slow_clk
      );

	left_debouncer_instl:debouncer
		Port map ( 
			clk       => slow_clk ,
         noisy_in  => left_button ,
         clean_out => left_clean_sig 
			);
			
		
	
	right_debouncer_inst:debouncer
		Port map ( 
			clk       => slow_clk ,
         noisy_in  => right_button ,
         clean_out => right_clean_sig 
			);
		
	
	up_debouncer_inst:debouncer
		Port map ( 
			clk       => slow_clk ,
         noisy_in  => up_button ,
         clean_out => up_clean_sig
			);
		
	
	down_debouncer_inst:debouncer
		Port map ( 
			clk       => slow_clk ,
         noisy_in  => down_button ,
         clean_out => down_clean_sig 
			);
		
		
	
	load_debouncer_inst:debouncer
		Port map ( 
			clk       => slow_clk ,
         noisy_in  => load_button ,
         clean_out => load_clean_sig 
			);
			
			
	 selector_inst:operation_selecter 
		Port map(
			CLK => slow_clk,
			right_clean => right_clean_sig ,
			left_clean => left_clean_sig,
			up_clean => up_clean_sig,
			down_clean => down_clean_sig,
			S0 => S0_sig ,
			S1 => S1_sig 
		);
		
		
	all_operations_inst : all_operations
    port map (
        X0_0_current_state => X0_0_current_state_sig,
        X0_1_current_state => X0_1_current_state_sig,
        X0_2_current_state => X0_2_current_state_sig,
        X0_3_current_state => X0_3_current_state_sig,
        X1_0_current_state => X1_0_current_state_sig,
        X1_1_current_state => X1_1_current_state_sig,
        X1_2_current_state => X1_2_current_state_sig,
        X1_3_current_state => X1_3_current_state_sig,
        X2_0_current_state => X2_0_current_state_sig,
        X2_1_current_state => X2_1_current_state_sig,
        X2_2_current_state => X2_2_current_state_sig,
        X2_3_current_state => X2_3_current_state_sig,
        X3_0_current_state => X3_0_current_state_sig,
        X3_1_current_state => X3_1_current_state_sig,
        X3_2_current_state => X3_2_current_state_sig,
        X3_3_current_state => X3_3_current_state_sig,
		  
        X0_0_next_state => X0_0_next_state_sig,
        X0_1_next_state => X0_1_next_state_sig,
        X0_2_next_state => X0_2_next_state_sig,
        X0_3_next_state => X0_3_next_state_sig,
        X1_0_next_state => X1_0_next_state_sig,
        X1_1_next_state => X1_1_next_state_sig,
        X1_2_next_state => X1_2_next_state_sig,
        X1_3_next_state => X1_3_next_state_sig,
        X2_0_next_state => X2_0_next_state_sig,
        X2_1_next_state => X2_1_next_state_sig,
        X2_2_next_state => X2_2_next_state_sig,
        X2_3_next_state => X2_3_next_state_sig,
        X3_0_next_state => X3_0_next_state_sig,
        X3_1_next_state => X3_1_next_state_sig,
        X3_2_next_state => X3_2_next_state_sig,
        X3_3_next_state => X3_3_next_state_sig,
        
        S0 => S0_sig,
        S1 => S1_sig,
        game_lost => game_lost_sig,
        game_won => game_won_sig
    );

	state_register_inst: signal_register_final
    port map ( 
        clk => slow_clk,
        rst_n => load_clean_sig,
        button_left => left_clean_sig,
        button_right => right_clean_sig,
        button_up => up_clean_sig,
        button_down => down_clean_sig,
		  
        signal_0 => X0_0_next_state_sig,
        signal_1 => X0_1_next_state_sig,
        signal_2 => X0_2_next_state_sig,
        signal_3 => X0_3_next_state_sig,
        signal_4 => X1_0_next_state_sig,
        signal_5 => X1_1_next_state_sig,
        signal_6 => X1_2_next_state_sig,
        signal_7 => X1_3_next_state_sig,
        signal_8 => X2_0_next_state_sig,
        signal_9 => X2_1_next_state_sig,
        signal_10 => X2_2_next_state_sig,
        signal_11 => X2_3_next_state_sig,
        signal_12 => X3_0_next_state_sig,
        signal_13 => X3_1_next_state_sig,
        signal_14 => X3_2_next_state_sig,
        signal_15 => X3_3_next_state_sig,
		  
        reg_signal_0 => X0_0_transfer_sig,
        reg_signal_1 => X0_1_transfer_sig,
        reg_signal_2 => X0_2_transfer_sig,
        reg_signal_3 => X0_3_transfer_sig,
        reg_signal_4 => X1_0_transfer_sig,
        reg_signal_5 => X1_1_transfer_sig,
        reg_signal_6 => X1_2_transfer_sig,
        reg_signal_7 => X1_3_transfer_sig,
        reg_signal_8 => X2_0_transfer_sig,
        reg_signal_9 => X2_1_transfer_sig,
        reg_signal_10 => X2_2_transfer_sig,
        reg_signal_11 => X2_3_transfer_sig,
        reg_signal_12 => X3_0_transfer_sig,
        reg_signal_13 => X3_1_transfer_sig,
        reg_signal_14 => X3_2_transfer_sig,
        reg_signal_15 => X3_3_transfer_sig
    );
	 
	 counter:counter_4bit
		port map(
			clk => CLK,
        count => counter_sig
		);
	 
	 
	 random_tile_generator_inst:random_tile_generator
	
		 Port map (
        clk => slow_clk,
        
        input_0  => X0_0_transfer_sig,
        input_1  => X0_1_transfer_sig,
        input_2  => X0_2_transfer_sig,
        input_3  => X0_3_transfer_sig,
        input_4  => X1_0_transfer_sig,
		  input_5  => X1_1_transfer_sig,
        input_6  => X1_2_transfer_sig,
        input_7  => X1_3_transfer_sig,
        input_8  => X2_0_transfer_sig,
        input_9  => X2_1_transfer_sig,
        input_10 => X2_2_transfer_sig,
		  input_11 => X2_3_transfer_sig,
        input_12 => X3_0_transfer_sig,
        input_13 => X3_1_transfer_sig,
        input_14 => X3_2_transfer_sig,
        input_15 => X3_3_transfer_sig,

        A => counter_sig,
           
        output_0  => X0_0_current_state_sig,
        output_1  => X0_1_current_state_sig,
        output_2  => X0_2_current_state_sig,
        output_3  => X0_3_current_state_sig,
        output_4  => X1_0_current_state_sig,
        output_5  => X1_1_current_state_sig,
        output_6  => X1_2_current_state_sig,
		  output_7  => X1_3_current_state_sig,
        output_8  => X2_0_current_state_sig,
        output_9  => X2_1_current_state_sig,
        output_10 => X2_2_current_state_sig,
        output_11 => X2_3_current_state_sig,
		  output_12 => X3_0_current_state_sig,
        output_13 => X3_1_current_state_sig,
        output_14 => X3_2_current_state_sig,
        output_15 => X3_3_current_state_sig
		  );

	draw_instance:vga_driver
		port map (
	
	
			CLK => CLK,
			X0_0_current_state => X0_0_current_state_sig,
			X0_1_current_state => X0_1_current_state_sig,
			X0_2_current_state => X0_2_current_state_sig,
			X0_3_current_state => X0_3_current_state_sig,
			X1_0_current_state => X1_0_current_state_sig,
			X1_1_current_state => X1_1_current_state_sig,
			X1_2_current_state => X1_2_current_state_sig,
			X1_3_current_state => X1_3_current_state_sig,
			X2_0_current_state => X2_0_current_state_sig,
			X2_1_current_state => X2_1_current_state_sig,
			X2_2_current_state => X2_2_current_state_sig,
			X2_3_current_state => X2_3_current_state_sig,
			X3_0_current_state => X3_0_current_state_sig,
			X3_1_current_state => X3_1_current_state_sig,
			X3_2_current_state => X3_2_current_state_sig,
			X3_3_current_state => X3_3_current_state_sig,
			game_won  => game_won_sig,
			game_lost => game_lost_sig,
			HSYNC  => HSYNC_sig,
			VSYNC  => VSYNC_sig,
			R  => R_sig,
			G  => G_sig,
			B  => B_sig
	
	);



		HSYNC   <= HSYNC_sig;
      VSYNC   <= VSYNC_sig;
		R   <= R_sig ;
		G   <= G_sig ;
		B   <= B_sig;
		
		
		
		
end Structural;






