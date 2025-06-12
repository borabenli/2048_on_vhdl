library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;


entity all_operations is
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
	 
end all_operations;


architecture Structural of all_operations is

    component Mux_4x1_with_4_bit_input_output
		 Port ( 
			  LEFT : in  STD_LOGIC_VECTOR (3 downto 0);  
			  RIGHT : in  STD_LOGIC_VECTOR (3 downto 0);  
			  UP : in  STD_LOGIC_VECTOR (3 downto 0);  
			  DOWN : in  STD_LOGIC_VECTOR (3 downto 0);  
			  S1 : in  STD_LOGIC;  
			  S0 : in  STD_LOGIC;  
			  Y : out STD_LOGIC_VECTOR (3 downto 0)   
		 );
	 
	 end component;
	 
	 
    component compute_operations
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
    end component;
	 
	 
	 
	 signal win_condition_left : std_logic;
	 signal win_condition_right : std_logic;
	 signal win_condition_up : std_logic;
	 signal win_condition_down : std_logic;
	 
	 signal left_move_available : std_logic;
	 signal right_move_available : std_logic;
	 signal up_move_available : std_logic;
	 signal down_move_available : std_logic;
	 
	 signal X0_0_left : std_logic_vector(3 downto 0);
	 signal X0_1_left : std_logic_vector(3 downto 0);
	 signal X0_2_left : std_logic_vector(3 downto 0);
	 signal X0_3_left : std_logic_vector(3 downto 0);
	 signal X1_0_left : std_logic_vector(3 downto 0);
	 signal X1_1_left : std_logic_vector(3 downto 0);
	 signal X1_2_left : std_logic_vector(3 downto 0);
	 signal X1_3_left : std_logic_vector(3 downto 0);
	 signal X2_0_left : std_logic_vector(3 downto 0);
	 signal X2_1_left : std_logic_vector(3 downto 0);
	 signal X2_2_left : std_logic_vector(3 downto 0);
	 signal X2_3_left : std_logic_vector(3 downto 0);
	 signal X3_0_left : std_logic_vector(3 downto 0);
	 signal X3_1_left : std_logic_vector(3 downto 0);
	 signal X3_2_left : std_logic_vector(3 downto 0);
	 signal X3_3_left : std_logic_vector(3 downto 0);
	 
	 signal X0_0_right : std_logic_vector(3 downto 0);
	 signal X0_1_right : std_logic_vector(3 downto 0);
	 signal X0_2_right : std_logic_vector(3 downto 0);
	 signal X0_3_right : std_logic_vector(3 downto 0);
	 signal X1_0_right : std_logic_vector(3 downto 0);
	 signal X1_1_right : std_logic_vector(3 downto 0);
	 signal X1_2_right : std_logic_vector(3 downto 0);
	 signal X1_3_right : std_logic_vector(3 downto 0);
	 signal X2_0_right : std_logic_vector(3 downto 0);
	 signal X2_1_right : std_logic_vector(3 downto 0);
	 signal X2_2_right : std_logic_vector(3 downto 0);
	 signal X2_3_right : std_logic_vector(3 downto 0);
	 signal X3_0_right : std_logic_vector(3 downto 0);
	 signal X3_1_right : std_logic_vector(3 downto 0);
	 signal X3_2_right : std_logic_vector(3 downto 0);
	 signal X3_3_right : std_logic_vector(3 downto 0);
	 
	 signal X0_0_up : std_logic_vector(3 downto 0);
	 signal X0_1_up : std_logic_vector(3 downto 0);
	 signal X0_2_up : std_logic_vector(3 downto 0);
	 signal X0_3_up : std_logic_vector(3 downto 0);
	 signal X1_0_up : std_logic_vector(3 downto 0);
	 signal X1_1_up : std_logic_vector(3 downto 0);
	 signal X1_2_up : std_logic_vector(3 downto 0);
	 signal X1_3_up : std_logic_vector(3 downto 0);
	 signal X2_0_up : std_logic_vector(3 downto 0);
	 signal X2_1_up : std_logic_vector(3 downto 0);
	 signal X2_2_up : std_logic_vector(3 downto 0);
	 signal X2_3_up : std_logic_vector(3 downto 0);
	 signal X3_0_up : std_logic_vector(3 downto 0);
	 signal X3_1_up : std_logic_vector(3 downto 0);
	 signal X3_2_up : std_logic_vector(3 downto 0);
	 signal X3_3_up : std_logic_vector(3 downto 0);
	 
	 signal X0_0_down : std_logic_vector(3 downto 0);
	 signal X0_1_down : std_logic_vector(3 downto 0);
	 signal X0_2_down : std_logic_vector(3 downto 0);
	 signal X0_3_down : std_logic_vector(3 downto 0);
	 signal X1_0_down : std_logic_vector(3 downto 0);
	 signal X1_1_down : std_logic_vector(3 downto 0);
	 signal X1_2_down : std_logic_vector(3 downto 0);
	 signal X1_3_down : std_logic_vector(3 downto 0);
	 signal X2_0_down : std_logic_vector(3 downto 0);
	 signal X2_1_down : std_logic_vector(3 downto 0);
	 signal X2_2_down : std_logic_vector(3 downto 0);
	 signal X2_3_down : std_logic_vector(3 downto 0);
	 signal X3_0_down : std_logic_vector(3 downto 0);
	 signal X3_1_down : std_logic_vector(3 downto 0);
	 signal X3_2_down : std_logic_vector(3 downto 0);
	 signal X3_3_down : std_logic_vector(3 downto 0);
	 
	 
	 
begin

	left_operation: compute_operations
		port map(
				f1_0 => X0_0_current_state  ,
				f1_1 => X0_1_current_state  ,
				f1_2 => X0_2_current_state  ,
				f1_3 => X0_3_current_state  ,
				f2_0 => X1_0_current_state  ,
				f2_1 => X1_1_current_state  ,
				f2_2 => X1_2_current_state  ,
				f2_3 => X1_3_current_state  ,
				f3_0 => X2_0_current_state  ,
				f3_1 => X2_1_current_state  ,
				f3_2 => X2_2_current_state  ,
				f3_3 => X2_3_current_state  ,
				f4_0 => X3_0_current_state  ,
				f4_1 => X3_1_current_state  ,
				f4_2 => X3_2_current_state  ,
				f4_3 => X3_3_current_state  ,
				
				win_condition => win_condition_left  ,
				move_available => left_move_available ,
				
				f1_0_out => X0_0_left  ,
				f1_1_out => X0_1_left  ,
				f1_2_out => X0_2_left ,
				f1_3_out => X0_3_left ,
				f2_0_out => X1_0_left ,
				f2_1_out => X1_1_left ,
				f2_2_out => X1_2_left ,
				f2_3_out => X1_3_left ,
				f3_0_out => X2_0_left ,
				f3_1_out => X2_1_left ,
				f3_2_out => X2_2_left ,
				f3_3_out => X2_3_left ,
				f4_0_out => X3_0_left ,
				f4_1_out => X3_1_left ,
				f4_2_out => X3_2_left ,
				f4_3_out => X3_3_left
		);
		
		
		
		
		
	right_operation: compute_operations
		port map(
				f1_0 => X0_3_current_state  ,
				f1_1 => X0_2_current_state  ,
				f1_2 => X0_1_current_state  ,
				f1_3 => X0_0_current_state  ,
				f2_0 => X1_3_current_state  ,
				f2_1 => X1_2_current_state  ,
				f2_2 => X1_1_current_state  ,
				f2_3 => X1_0_current_state  ,
				f3_0 => X2_3_current_state  ,
				f3_1 => X2_2_current_state  ,
				f3_2 => X2_1_current_state  ,
				f3_3 => X2_0_current_state  ,
				f4_0 => X3_3_current_state  ,
				f4_1 => X3_2_current_state  ,
				f4_2 => X3_1_current_state  ,
				f4_3 => X3_0_current_state  ,
			
				win_condition => win_condition_right  ,
				move_available => right_move_available ,
				
				f1_0_out => X0_3_right  ,
				f1_1_out => X0_2_right  ,
				f1_2_out => X0_1_right ,
				f1_3_out => X0_0_right ,
				f2_0_out => X1_3_right ,
				f2_1_out => X1_2_right ,
				f2_2_out => X1_1_right ,
				f2_3_out => X1_0_right ,
				f3_0_out => X2_3_right ,
				f3_1_out => X2_2_right ,
				f3_2_out => X2_1_right ,
				f3_3_out => X2_0_right ,
				f4_0_out => X3_3_right ,
				f4_1_out => X3_2_right ,
				f4_2_out => X3_1_right ,
				f4_3_out => X3_0_right
				);
				
				
	up_operation: compute_operations
		port map(
				f1_0 => X0_0_current_state  ,
				f1_1 => X1_0_current_state ,
				f1_2 => X2_0_current_state  ,
				f1_3 => X3_0_current_state  ,
				f2_0 => X0_1_current_state  ,
				f2_1 => X1_1_current_state  ,
				f2_2 => X2_1_current_state  ,
				f2_3 => X3_1_current_state  ,
				f3_0 => X0_2_current_state  ,
				f3_1 => X1_2_current_state  ,
				f3_2 => X2_2_current_state  ,
				f3_3 => X3_2_current_state  ,
				f4_0 => X0_3_current_state  ,
				f4_1 => X1_3_current_state  ,
				f4_2 => X2_3_current_state  ,
				f4_3 => X3_3_current_state  ,
			
				win_condition => win_condition_up  ,
				move_available => up_move_available ,
			
				f1_0_out => X0_0_up  ,
				f1_1_out => X1_0_up   ,
				f1_2_out => X2_0_up ,
				f1_3_out => X3_0_up ,
				f2_0_out => X0_1_up ,
				f2_1_out => X1_1_up ,
				f2_2_out => X2_1_up ,
				f2_3_out => X3_1_up ,
				f3_0_out => X0_2_up ,
				f3_1_out => X1_2_up ,
				f3_2_out => X2_2_up ,
				f3_3_out => X3_2_up ,
				f4_0_out => X0_3_up ,
				f4_1_out => X1_3_up ,
				f4_2_out => X2_3_up ,
				f4_3_out => X3_3_up
				);
				
				
	down_operation: compute_operations
		port map(
				f1_0 => X3_0_current_state  ,
				f1_1 => X2_0_current_state   ,
				f1_2 => X1_0_current_state  ,
				f1_3 => X0_0_current_state  ,
				f2_0 => X3_1_current_state  ,
				f2_1 => X2_1_current_state  ,
				f2_2 => X1_1_current_state  ,
				f2_3 => X0_1_current_state  ,
				f3_0 => X3_2_current_state  ,
				f3_1 => X2_2_current_state  ,
				f3_2 => X1_2_current_state  ,
				f3_3 => X0_2_current_state  ,
				f4_0 => X3_3_current_state  ,
				f4_1 => X2_3_current_state  ,
				f4_2 => X1_3_current_state  ,
				f4_3 => X0_3_current_state  ,
				
				win_condition => win_condition_down ,
				move_available => down_move_available ,
				
				f1_0_out => X3_0_down  ,
				f1_1_out => X2_0_down   ,
				f1_2_out => X1_0_down ,
				f1_3_out => X0_0_down ,
				f2_0_out => X3_1_down ,
				f2_1_out => X2_1_down ,
				f2_2_out => X1_1_down ,
				f2_3_out => X0_1_down ,
				f3_0_out => X3_2_down ,
				f3_1_out => X2_2_down ,
				f3_2_out => X1_2_down ,
				f3_3_out => X0_2_down ,
				f4_0_out => X3_3_down ,
				f4_1_out => X2_3_down ,
				f4_2_out => X1_3_down ,
				f4_3_out => X0_3_down
				);
				

	X0_0_selector: Mux_4x1_with_4_bit_input_output
		port map(
			LEFT => X0_0_left,
			RIGHT => X0_0_right  ,
			UP =>  X0_0_up , 
			DOWN => X0_0_down   ,
			S1 =>  S1 ,
			S0 =>  S0 ,
			Y => X0_0_next_state    
		);
		
	X0_1_selector: Mux_4x1_with_4_bit_input_output
		port map(
			LEFT => X0_1_left  ,
			RIGHT => X0_1_right  ,
			UP =>  X0_1_up ,
			DOWN =>  X0_1_down , 
			S1 =>  S1 ,
			S0 =>  S0 ,
			Y => X0_1_next_state  
		);
		
	X0_2_selector: Mux_4x1_with_4_bit_input_output
		port map(
			LEFT => X0_2_left  ,
			RIGHT =>  X0_2_right ,
			UP =>  X0_2_up ,
			DOWN => X0_2_down  ,
			S1 =>  S1 ,
			S0 =>  S0 ,
			Y =>  X0_2_next_state 
		);
		
	X0_3_selector: Mux_4x1_with_4_bit_input_output
		port map(
			LEFT => X0_3_left  ,
			RIGHT => X0_3_right   ,
			UP => X0_3_up  ,
			DOWN => X0_3_down  ,
			S1 =>  S1 ,
			S0 => S0  ,
			Y =>  X0_3_next_state  
		);
		
	X1_0_selector: Mux_4x1_with_4_bit_input_output
		port map(
			LEFT => X1_0_left  ,
			RIGHT =>  X1_0_right, 
			UP =>  X1_0_up , 
			DOWN => X1_0_down  ,
			S1 => S1  ,
			S0 =>  S0 ,
			Y =>  X1_0_next_state 
		);
		
	X1_1_selector: Mux_4x1_with_4_bit_input_output
		port map(
			LEFT => X1_1_left  ,
			RIGHT => X1_1_right  ,
			UP =>  X1_1_up ,
			DOWN =>  X1_1_down ,  
			S1 => S1  ,
			S0 =>  S0 ,
			Y => X1_1_next_state  
		);
		
	X1_2_selector: Mux_4x1_with_4_bit_input_output
		port map(
			LEFT => X1_2_left  ,
			RIGHT => X1_2_right  ,
			UP => X1_2_up  ,
			DOWN => X1_2_down  ,  
			S1 =>  S1 ,
			S0 =>  S0 ,
			Y =>  X1_2_next_state 
		);
		
	X1_3_selector: Mux_4x1_with_4_bit_input_output
		port map(
			LEFT => X1_3_left  ,
			RIGHT => X1_3_right   ,
			UP => X1_3_up  ,
			DOWN =>  X1_3_down ,  
			S1 =>  S1 ,
			S0 =>  S0 ,
			Y => X1_3_next_state  
		);
		
	X2_0_selector: Mux_4x1_with_4_bit_input_output
		port map(
			LEFT => X2_0_left  ,
			RIGHT => X2_0_right , 
			UP =>  X2_0_up ,
			DOWN =>  X2_0_down ,   
			S1 =>  S1 , 
			S0 =>  S0 ,   
			Y =>  X2_0_next_state 
		);
		
	X2_1_selector: Mux_4x1_with_4_bit_input_output
		port map(
			LEFT => X2_1_left  ,
			RIGHT => X2_1_right , 
			UP => X2_1_up  ,
			DOWN => X2_1_down  ,  
			S1 =>  S1 ,
			S0 =>  S0 ,
			Y =>  X2_1_next_state 
		);
		
	X2_2_selector: Mux_4x1_with_4_bit_input_output
		port map(
			LEFT => X2_2_left  ,
			RIGHT => X2_2_right   ,
			UP => X2_2_up  ,
			DOWN =>  X2_2_down ,  
			S1 =>  S1 ,
			S0 =>  S0 ,
			Y => X2_2_next_state   
		);
		
	X2_3_selector: Mux_4x1_with_4_bit_input_output
		port map(
			LEFT => X2_3_left  ,
			RIGHT => X2_3_right , 
			UP =>  X2_3_up ,
			DOWN => X2_3_down  ,  
			S1 =>  S1 ,
			S0 =>  S0 ,
			Y => X2_3_next_state  
		);
		
	X3_0_selector: Mux_4x1_with_4_bit_input_output
		port map(
			LEFT =>  X3_0_left ,
			RIGHT => X3_0_right  ,
			UP =>  X3_0_up ,
			DOWN => X3_0_down  , 
			S1 =>  S1 ,
			S0 =>  S0 ,
			Y =>  X3_0_next_state 
		);
		
	X3_1_selector: Mux_4x1_with_4_bit_input_output
		port map(
			LEFT =>  X3_1_left ,
			RIGHT =>  X3_1_right ,
			UP => X3_1_up  ,
			DOWN =>  X3_1_down , 
			S1 =>  S1 ,
			S0 =>  S0 ,
			Y =>  X3_1_next_state 
		);
		
	X3_2_selector: Mux_4x1_with_4_bit_input_output
		port map(
			LEFT => X3_2_left  ,
			RIGHT =>  X3_2_right, 
			UP =>  X3_2_up ,
			DOWN =>  X3_2_down , 
			S1 =>  S1 ,
			S0 =>  S0 ,
			Y =>  X3_2_next_state 
		);
		
	X3_3_selector: Mux_4x1_with_4_bit_input_output
		port map(
			LEFT => X3_3_left  ,
			RIGHT => X3_3_right , 
			UP =>  X3_3_up ,
			DOWN =>  X3_3_down , 
			S1 =>  S1 ,
			S0 =>   S0  ,
			Y => X3_3_next_state  
		);
		
	game_won <= win_condition_left or win_condition_right or win_condition_up or win_condition_down;

	
	game_lost <= left_move_available and right_move_available and up_move_available and down_move_available;
		
		
		
end Structural;
		
		
		