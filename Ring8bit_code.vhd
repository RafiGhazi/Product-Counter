----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/14/2022 11:50:12 AM
-- Design Name: 
-- Module Name: decoder_code1 - Behavioral
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

entity Ring8bit_code is
Port ( 
clk : in std_logic_vector(3 downto 0);

output : out std_logic_vector (7 downto 0)
);
end Ring8bit_code ;

architecture Behavioral of Ring8bit_code  is
begin
process (clk)
begin
case clk is
    when "0000"=>output<= "01111111";
    when "0001"=>output<= "10111111";
    when "0010"=>output<= "11011111";
    when "0011"=>output<= "11101111";
    when "0100"=>output<= "11110111";
    when "0101"=>output<= "11111011";
    when "0110"=>output<= "11111101";
    when "0111"=>output<= "11111110";
    when "1000"=>output<= "11111111";
    when others =>output<= "11111111";
end case;
end process; 
end Behavioral;