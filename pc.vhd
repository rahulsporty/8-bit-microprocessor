----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/25/2022 03:11:42 PM
-- Design Name: 
-- Module Name: pc - Behavioral
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity pc is
    Port ( clk : in STD_LOGIC;
           next_instr : out STD_LOGIC_VECTOR (2 downto 0));
end pc;

architecture Behavioral of pc is
signal current_signal : STD_LOGIC_VECTOR (2 DOWNTO 0):="000";
begin
    process(clk)
    begin
        if falling_edge(clk) then
        current_signal <= std_logic_vector(unsigned(current_signal) + to_unsigned(1,3));
      end if;
end process;

next_instr <= current_signal;
end Behavioral;
