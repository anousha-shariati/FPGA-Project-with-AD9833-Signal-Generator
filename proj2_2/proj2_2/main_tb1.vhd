LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY main_tb1 IS
END main_tb1;
 
ARCHITECTURE behavior OF main_tb1 IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT master
    PORT(
         m_clk : OUT  std_logic;
			s_clk : OUT  std_logic;
         fsync : OUT  std_logic;
         rst : IN  std_logic;
			clk_input : IN  std_logic;
         sdata : OUT  std_logic
        );
    END COMPONENT;
    
 
   --Inputs
   signal rst : std_logic := '0';
	signal clk_input : std_logic := '0';
 
 	--Outputs
   signal m_clk : std_logic;
   signal fsync : std_logic;
   signal sdata : std_logic;
	signal s_clk : std_logic;
	

   -- Clock period definitions
   constant clk_input_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: master PORT MAP (
          m_clk => m_clk,
          fsync => fsync,
          rst => rst,
			 clk_input => clk_input,
			 s_clk => s_clk,
          sdata => sdata			 
        );
   -- Clock process definitions
   clk_input_process :process
   begin
		clk_input<= '0';
		wait for clk_input_period/2;
		clk_input <= '1';
		wait for clk_input_period/2;
   end process;

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	
      rst<='1';
		
      wait;
   end process;
END;
