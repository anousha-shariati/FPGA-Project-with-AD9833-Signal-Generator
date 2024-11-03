library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity clk is
    Port ( clk_in : in  STD_LOGIC;
			  reset  : in std_logic;
			  freq  : out std_logic
			  );
end clk;

architecture Behavioral of clk is
 
signal clk_temp : std_logic := '0'; 
signal counter : integer := 0;
   
begin
  process(clk_in, reset) 
  begin 
    if reset = '0' then --active low reset

      counter <= 0;

      clk_temp <= '0';
		
    elsif rising_edge(clk_in) then
      -- 100MHz clk (40 nano second)  --> 100 000 000 / 25 000 000 hz  
      if counter =  2-1 then
        counter <= 0;
        clk_temp <= not clk_temp;
      else  
        counter <= counter + 1;
      end if;
		
    end if;
  end process;

  freq <= clk_temp;

end Behavioral;

