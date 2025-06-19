-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity scan_engine_angka is
Port ( 
     
    angka_satuan: in std_logic_vector (3 downto 0);
    angka_puluhan: in std_logic_vector (3 downto 0);
    angka_ratusan: in std_logic_vector (3 downto 0);
    angka_ribuan :in std_logic_vector (3 downto 0);
    angka_puluhribu:in std_logic_vector (3 downto 0);
    angka_ratusribu:in std_logic_vector (3 downto 0);
    angka_juta:in std_logic_vector (3 downto 0);
    angka_puluhjuta:in std_logic_vector (3 downto 0);
    input_clock: in std_logic_vector(3 downto 0);
	output_angka : out std_logic_vector (3 downto 0)
);
end scan_engine_angka;

architecture Behavioral of scan_engine_angka is

begin
process (angka_satuan, angka_puluhan,angka_ratusan, angka_ribuan, input_clock)
begin
case input_clock is
    when "0000"=>output_angka<= angka_puluhjuta;
    when "0001"=>output_angka<= angka_juta;
    when "0010"=>output_angka<= angka_ratusribu;
    when "0011"=>output_angka<= angka_puluhribu;
    when "0100"=>output_angka<= angka_ribuan;
    when "0101"=>output_angka<= angka_ratusan;
     when"0110"=>output_angka<=angka_puluhan;
    when "0111"=>output_angka<= angka_satuan;
    when "1000"=>output_angka<= "0000";
    when others =>output_angka<= "0000";
end case;
end process; 
end Behavioral;