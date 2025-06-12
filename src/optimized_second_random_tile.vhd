library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity random_tile_generator is
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
        

        A : in STD_LOGIC_VECTOR(3 downto 0);

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
end random_tile_generator;

architecture Behavioral of random_tile_generator is
  
    type input_array is array (0 to 15) of STD_LOGIC_VECTOR(3 downto 0);
    type output_array is array (0 to 15) of STD_LOGIC_VECTOR(3 downto 0);

    signal current_inputs : input_array;
    signal previous_inputs : input_array;
    signal outputs : output_array;

  
    signal lfsr : STD_LOGIC_VECTOR(15 downto 0) := "1010110011110001";

begin

  
    current_inputs(0)  <= input_0;
    current_inputs(1)  <= input_1;
    current_inputs(2)  <= input_2;
    current_inputs(3)  <= input_3;
    current_inputs(4)  <= input_4;
    current_inputs(5)  <= input_5;
    current_inputs(6)  <= input_6;
    current_inputs(7)  <= input_7;
    current_inputs(8)  <= input_8;
    current_inputs(9)  <= input_9;
    current_inputs(10) <= input_10;
    current_inputs(11) <= input_11;
    current_inputs(12) <= input_12;
    current_inputs(13) <= input_13;
    current_inputs(14) <= input_14;
    current_inputs(15) <= input_15;


    output_0  <= outputs(0);
    output_1  <= outputs(1);
    output_2  <= outputs(2);
    output_3  <= outputs(3);
    output_4  <= outputs(4);
    output_5  <= outputs(5);
    output_6  <= outputs(6);
    output_7  <= outputs(7);
    output_8  <= outputs(8);
    output_9  <= outputs(9);
    output_10 <= outputs(10);
    output_11 <= outputs(11);
    output_12 <= outputs(12);
    output_13 <= outputs(13);
    output_14 <= outputs(14);
    output_15 <= outputs(15);


    process(clk)
    begin
        if rising_edge(clk) then
           
            lfsr <= lfsr(14 downto 0) & (lfsr(15) xor lfsr(14) xor lfsr(12) xor lfsr(3));
        end if;
    end process;

 
    process(clk)
        variable zero_count        : integer range 0 to 16;
        variable random_selection : integer;
        variable zero_counter     : integer;
        variable selected_idx     : integer;
        variable new_value        : STD_LOGIC_VECTOR(3 downto 0);
        variable changed          : boolean;
    begin
        if rising_edge(clk) then
           
            changed := false;
            for i in 0 to 15 loop
                if current_inputs(i) /= previous_inputs(i) then
                    changed := true;
                    exit;
                end if;
            end loop;

            previous_inputs <= current_inputs;

            if changed then
            
                for i in 0 to 15 loop
                    outputs(i) <= current_inputs(i);
                end loop;

              
                zero_count := 0;
                for i in 0 to 15 loop
                    if current_inputs(i) = "0000" then
                        zero_count := zero_count + 1;
                    end if;
                end loop;

       
                if zero_count > 0 then
                    random_selection := to_integer(unsigned(lfsr)) mod zero_count;

                    zero_counter := 0;
                    selected_idx := 0;
                    for i in 0 to 15 loop
                        if current_inputs(i) = "0000" then
                            if zero_counter = random_selection then
                                selected_idx := i;
                                exit;
                            end if;
                            zero_counter := zero_counter + 1;
                        end if;
                    end loop;

                    
                    new_value := "0001";
                    outputs(selected_idx) <= new_value;
                end if;
            end if;
        end if;
    end process;

end Behavioral;
