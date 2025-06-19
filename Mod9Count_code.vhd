library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_ARITH.all;
use IEEE.STD_LOGIC_UNSIGNED.all;

entity Mod9Count_code is 
port (rst,switch : in std_logic;
	output1: out std_logic_vector (3 downto 0);
        output10: out std_logic_vector (3 downto 0);
        output100: out std_logic_vector (3 downto 0);
        output1000: out std_logic_vector (3 downto 0);
        output10000:  out std_logic_vector (3 downto 0);
        output100000: out std_logic_vector (3 downto 0);
        output1000000: out std_logic_vector (3 downto 0);
        output10000000: out std_logic_vector (3 downto 0)
	);
end Mod9Count_code;

architecture behavioral of Mod9Count_code is 
signal satuan : std_logic_vector(3 downto 0):="0000";
signal puluhan : std_logic_vector(3 downto 0):="0000";
signal ratusan : std_logic_vector(3 downto 0):="0000";
signal ribuan : std_logic_vector(3 downto 0):="0000";
signal puluhribu : std_logic_vector(3 downto 0):="0000";
signal ratusribu : std_logic_vector(3 downto 0):="0000";
signal juta : std_logic_vector(3 downto 0):="0000";
signal puluhjuta : std_logic_vector(3 downto 0):="0000";
	begin 
		process(switch ,rst)
    begin
      if (rst = '1') then 
      satuan <= "0000";
      puluhan <= "0000";
      ratusan <= "0000";
      ribuan <= "0000";
      puluhribu <= "0000";
      ratusribu <= "0000";
      juta <= "0000";
      puluhjuta <= "0000";
      
      elsif (rising_edge (switch)) then
       if(satuan=9) then
          satuan <= "0000";
       if(puluhan=9) then
          puluhan <= "0000";
       if(ratusan=9) then 
            ratusan <= "0000";
        if(ribuan=9) then 
            ribuan <= "0000";
        if(puluhribu=9) then 
            puluhribu  <= "0000";
        if(ratusribu=9) then 
            ratusribu  <= "0000";
        if (juta=9) then
            juta<="0000";
        if (puluhjuta=9) then
            puluhjuta<="0000";
           else 
            puluhjuta<=puluhjuta+1;
           end if;
           else
           juta<=juta+1;
           end if;
           else
           ratusribu<=ratusribu+1;
           end if;
           else
           puluhribu<=puluhribu+1;
           end if;
           else
           ribuan<=ribuan+1;
           end if;
           else
           ratusan<= ratusan+ 1;
           end if;
           else
           puluhan <= puluhan + 1;
           end if;
           else
           satuan <= satuan + 1;
           end if;
           end if;
    end process;
		output10000000<= puluhjuta;
		output1000000<=  juta;
		output100000<=  ratusribu;
		output10000<= puluhribu;
		output1000<= ribuan;	
		output100<=  ratusan;
		output10<=  puluhan;
		output1<=   satuan;			
    end behavioral;
