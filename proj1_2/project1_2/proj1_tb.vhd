LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY proj1_tb IS
END proj1_tb;
 
ARCHITECTURE behavior OF proj1_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT main1
    PORT(
         clk_in : IN  std_logic;
         reset : IN  std_logic; 
         freq : OUT  std_logic
        );
    END COMPONENT;
     
 
   --Inputs
   signal clk_in : std_logic := '0';
   signal reset : std_logic := '0';

 	--Outputs
   signal freq : std_logic;

   -- Clock period definitions
   constant clk_in_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: main1 PORT MAP (
          clk_in => clk_in,
          reset => reset,
          freq => freq
        );

   -- Clock process definitions
   clk_in_process :process
   begin
		clk_in <= '0';
		wait for clk_in_period/2;
		clk_in <= '1';
		wait for clk_in_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
 
		reset <= '0';
		wait for 100 ns ; -- hold reset state for 100 ns
		reset <='1';
		wait for 500 ns ;
		reset <= '0';
		wait for 100 ns ; -- hold reset state for 100 ns
		reset <='1'; 

      wait;
   end process;

END;
