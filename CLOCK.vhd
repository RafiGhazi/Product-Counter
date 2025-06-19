library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity CLOCK is
Port ( 
        clk1 : in std_logic;
        clk : out std_logic
);
end CLOCK;

architecture Behavioral of CLOCK is
signal count : integer :=0;
    signal b : std_logic :='0';
begin
    --clk generation.For 100 MHz clock this generates 1 Hz clock.    
    process(clk1)     
    begin
        if(rising_edge(clk1)) then
            count <=count+1;
            if(count = 49999) then
                b <= not b;
                count <=0;
            end if;
        end if;
    end process;
      clk<=b;
end Behavioral;