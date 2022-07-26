----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/25/2022 06:53:06 PM
-- Design Name: 
-- Module Name: control - Behavioral
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

entity control is
    Port ( instr : in STD_LOGIC_VECTOR (1 downto 0);
           alu_op : out STD_LOGIC_VECTOR (1 downto 0);
           alu_src : out STD_LOGIC;
           reg_dst : out STD_LOGIC);
end control;

architecture Behavioral of control is

begin
with instr select
alu_op <= "00" when "00", --AND
            "01" when "01", --ADD
            "10" when "10", --SUB
            "11" when others; --ADDi
            
with instr select
alu_src <= '1' when "11", --ADDi
            '0' when others;

with instr select
reg_dst <= '1' when "11", --ADDi
            '0' when others;

end Behavioral;
