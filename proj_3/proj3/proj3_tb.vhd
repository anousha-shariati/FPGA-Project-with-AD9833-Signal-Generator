
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY proj3_tb IS
END proj3_tb;
 
ARCHITECTURE behavior OF proj3_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT proj3
    PORT(
         clk_input : IN  std_logic;
         rst : IN  std_logic;
         m_clk : OUT  std_logic;
         cs1 : OUT  std_logic;
         cs2 : OUT  std_logic;
         cs3 : OUT  std_logic;
         copi : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal clk_input : std_logic := '0';
   signal rst : std_logic := '0';

 	--Outputs
   signal m_clk : std_logic;
   signal cs1 : std_logic;
   signal cs2 : std_logic;
   signal cs3 : std_logic;
   signal copi : std_logic;

   -- Clock period definitions
   constant clk_input_period : time := 10 ns;
	
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: proj3 PORT MAP (
          clk_input => clk_input,
          rst => rst,
          m_clk => m_clk,
          cs1 => cs1,
          cs2 => cs2,
          cs3 => cs3,
          copi => copi
        );

   -- Clock process definitions
   clk_input_process :process
   begin
		clk_input <= '0';
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


      -- insert stimulus here 

      wait;
   end process;

END;
