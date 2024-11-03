library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use ieee.numeric_std.all;

entity master is
    Port ( m_clk : out  STD_LOGIC;
           fsync : out  STD_LOGIC;
			  clk_input : in STD_LOGIC;
			  rst : in STD_LOGIC;
			  s_clk : out STD_LOGIC;
			  sdata : out STD_LOGIC);
end master;

architecture Behavioral of master is
 
signal control_register : STD_LOGIC_VECTOR (16 downto 0);
signal phase_register : STD_LOGIC_VECTOR (16 downto 0);
signal counter : integer := 0;
signal freq_counter : integer := 0; 
signal freq_lsb , freq_msb : STD_LOGIC_VECTOR (16 downto 0);
signal m_clk_in : std_logic ;
signal fsync_in : std_logic := '0'; 

component clk is
    Port ( clk_in : in  STD_LOGIC;
			  reset  : in std_logic;
			  freq  : out std_logic
			  );
end component;


 type t_state is (reset_state, control_state , middle1_state ,middle2_state , freq_state , phase_state );
    signal state : t_state;

begin

j : CLK port map (
							clk_in=>clk_input,
							reset=>rst,
							freq=> m_clk_in 
							);
														
					
process(m_clk_in , fsync_in)
   begin 		
	if (falling_edge (m_clk_in) )then
		state <= reset_state ;				
		case state is

				when reset_state =>    --reset state sets all the registers to its current value
				
				   control_register <= "00010100100001010";   
					freq_lsb <= "01011100101111101";   --lsb 
					freq_msb <= "01000000000000101"; --msb
					phase_register <= "01100000000000000";  
               fsync_in <= '0'; 					
					state <= control_state; 
										
				when control_state =>
				
					fsync_in <= '0';			
					for i in 0 to 15 loop
						control_register(i+1) <= control_register(i);
					end loop ;
					sdata <= control_register(16);
					
					if (counter <16) then 
						counter <= counter + 1;
						state <= control_state;
					else 
						counter <= 0;
						state<= middle1_state;
					end if;	
					
				when middle1_state =>	
				
					fsync_in <= '1';
					state <= freq_state;		
						
				when freq_state =>
				
		      	fsync_in <= '0';
					if ( freq_counter = 0 )then 
						for i in 0 to 15 loop
							freq_lsb(i+1) <= freq_lsb(i);
						end loop ;
						sdata <= freq_lsb(16);						
						if (counter <16) then 
							counter <= counter+1;
							state <= freq_state;
						else 
							counter <= 0;
							freq_counter <= 1 ;
							state <= freq_state;
						end if;								
					else
						for i in 0 to 15 loop
							freq_msb(i+1) <= freq_msb(i);
						end loop ;
						sdata <= freq_msb(16);						
						if (counter <16) then 
							counter <= counter+1;
							state <= freq_state;
						else 
							counter <= 0;
							freq_counter <= 0 ;	
							state<= middle2_state;	                    						
						end if;						
					end if; 	

				when middle2_state =>
			
					fsync_in <= '1';
					fsync <= fsync_in  ;
					state <= phase_state;												
						
				when phase_state =>
				
					fsync_in <= '0';
					for i in 0 to 15 loop
						phase_register(i+1) <= phase_register(i);
					end loop ;
					sdata <= phase_register(16);					
					if (counter <16) then 
						counter <= counter+1;
						state <= phase_state;
					else 
						counter <= 0;
						state <= reset_state;
					end if;					   
			end case;
								
		end if;	
		s_clk <= m_clk_in and (not fsync_in) ;		
		fsync <= fsync_in;
      m_clk <= m_clk_in;
			
	end process;

end Behavioral;

