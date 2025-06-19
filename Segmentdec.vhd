----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05.11.2022 22:12:48
-- Design Name: 
-- Module Name: Segment7Dec_code - Behavioral
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
use IEEE.std_logic_arith.ALL;
use IEEE.std_logic_unsigned.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Segmentdec is
Port ( 
       Data: in std_logic_vector (3 downto 0);
       Output: out std_logic_vector (7 downto 0)
);
end Segmentdec;

architecture Behavioral of Segmentdec is
signal temp: std_logic_vector (7 downto 0);
begin
 process (data,temp )
 begin 
    case data is 
    when "0000" => temp <= "11000000";--0
    when "0001" => temp <= "11111001";--1
    when "0010" => temp <= "10100100";--2
    when "0011" => temp <= "10110000";--3
    when "0100" => temp <= "10011001";--4
    when "0101" => temp <= "10010010";--5
    when "0110" => temp <= "10000010";--6
    when "0111" => temp <= "11111000";--7
    when "1000" => temp <= "10000000";  --8  
    when "1001" => temp <= "10010000";--9
    
     
      
        when others => temp <= "11111111";
    end case;
  end process;
  Output <= temp;
end Behavioral;
