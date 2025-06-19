----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01/16/2023 12:04:46 PM
-- Design Name: 
-- Module Name: tugasrancang - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity tugasrancang is
 Port ( 
        Segment7: out std_logic_vector (7 downto 0);
        CommonA: out std_logic_vector (7 downto 0);
        switch: in std_logic;
        clk, rst: in std_logic 
 );
end tugasrancang;

architecture Behavioral of tugasrancang is
 -- Clock Generator 
 component CLOCK
    port (
        clk1: in std_logic;
        clk: out std_logic);
    end component;
    
 -- 7 Segment Decoder 
 component Segmentdec
    port ( 
        data: in std_logic_vector (3 downto 0);
        output: out std_logic_vector (7 downto 0));      
    end component;
    -- Mod 9 counter (ganti nama)
  component Mod9Count_code
    port (
        rst,switch: in std_logic;
        output1: out std_logic_vector (3 downto 0);
        output10: out std_logic_vector (3 downto 0);
        output100: out std_logic_vector (3 downto 0);
        output1000: out std_logic_vector (3 downto 0);
        output10000:  out std_logic_vector (3 downto 0);
        output100000: out std_logic_vector (3 downto 0);
        output1000000: out std_logic_vector (3 downto 0);
        output10000000: out std_logic_vector (3 downto 0)
        );
  end component;

  
  --ring satuanpuluhan  (ganti nama)
  component scan_engine_angka
    port (
        input_clock: in std_logic_vector (3 downto 0);
        angka_satuan: in std_logic_vector (3 downto 0);
        angka_puluhan: in std_logic_vector (3 downto 0);
        angka_ratusan: in std_logic_vector (3 downto 0);
        angka_ribuan :in std_logic_vector (3 downto 0);
        angka_puluhribu:in std_logic_vector (3 downto 0);
        angka_ratusribu:in std_logic_vector (3 downto 0);
        angka_juta:in std_logic_vector (3 downto 0);
        angka_puluhjuta:in std_logic_vector (3 downto 0);
        output_angka: out std_logic_vector (3 downto 0)       
        );
    end component;
    
  --ring counter 8 bit 
  component Ring8bit_code
   port (
        clk: in std_logic_vector(3 downto 0);
        output: out std_logic_vector (7 downto 0));
    end component;
    
    --ring counter mod4Count_code
   component mod8Count_code
    port ( 
     rst,clk: in std_logic;
        output1: out std_logic_vector (3 downto 0));
        end component;
  
signal Keluaran_Ring8bit: std_logic_vector (7 downto 0);
signal Keluaran_7Segmentdec: std_logic_vector (7 downto 0);
signal keluaran_mod8Count_code: std_logic_vector (3 downto 0);
signal Keluaran_ClkSource: std_logic;
signal Keluaran_rst: std_logic;
signal satuan: std_logic_vector (3 downto 0);
signal puluhan: std_logic_vector (3 downto 0);
signal ratusan : std_logic_vector (3 downto 0);
signal ribuan : std_logic_vector (3 downto 0);
signal puluhribu : std_logic_vector (3 downto 0);
signal ratusribu : std_logic_vector (3 downto 0);
signal juta : std_logic_vector (3 downto 0);
signal puluhjuta: std_logic_vector (3 downto 0);
signal Keluaran_Puluhan_Satuan: std_logic_vector (3 downto 0);
begin

comp1: CLOCK port map (clk,Keluaran_ClkSource); 
comp2: mod8Count_code port map(rst,Keluaran_ClkSource,keluaran_mod8Count_code); 
comp3: Ring8bit_code port map (keluaran_mod8Count_code,Keluaran_Ring8bit);
comp4: Segmentdec port map (Keluaran_Puluhan_Satuan ,Keluaran_7Segmentdec);
comp5: Mod9Count_code port map (rst,switch ,satuan, puluhan, ratusan, ribuan,puluhribu,ratusribu,juta,puluhjuta );
comp6: scan_engine_angka port map (keluaran_mod8Count_code,satuan, puluhan, ratusan, ribuan,puluhribu,ratusribu,juta,puluhjuta ,Keluaran_Puluhan_Satuan);
Segment7 <= Keluaran_7Segmentdec;
CommonA <= Keluaran_Ring8bit;

end Behavioral;
