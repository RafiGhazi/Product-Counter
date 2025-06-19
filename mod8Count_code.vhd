----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10.11.2022 15:59:55
-- Design Name: 
-- Module Name: Mod8Count_code - Behavioral
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
use IEEE.STD_LOGIC_ARITH.all;
use IEEE.STD_LOGIC_UNSIGNED.all;

entity Mod8Count_code is
Port ( 
        rst,clk: in std_logic;
        output1: out std_logic_vector (3 downto 0));
end Mod8Count_code;

architecture Behavioral of Mod8Count_code is
signal count : std_logic_vector(3 downto 0);
    begin
      process(rst,clk)
        begin
          if (rst = '1' or count >=8) then count <= "0000";
          elsif (clk'event and clk = '1') then count <= count + 1;
          end if;
         end process;
         output1 <= count;
end Behavioral;