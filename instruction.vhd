----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/25/2022 04:11:24 PM
-- Design Name: 
-- Module Name: instruction - Behavioral
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

entity instruction is
  Port (instr_addr : in STD_LOGIC_VECTOR (2 downto 0);
        op : out STD_LOGIC_VECTOR (1 downto 0);
        rs_addr : out STD_LOGIC_VECTOR (1 downto 0);
        rt_addr : out STD_LOGIC_VECTOR (1 downto 0);
        rd_addr : out STD_LOGIC_VECTOR (1 downto 0));
end instruction;

architecture Behavioral of instruction is
type instruction_set is array (0 to 7) of STD_LOGIC_VECTOR (7 downto 0);
constant instr : instruction_set := (
"01000010",
"11010101",
"11101011",
"01000111",
"10101100",
"00000000",
"00000000",
"00000000");

begin
op <= instr(to_integer(unsigned(instr_addr)))(7 downto 6);
rs_addr <= instr(to_integer(unsigned(instr_addr)))(5 downto 4);
rt_addr <= instr(to_integer(unsigned(instr_addr)))(3 downto 2);
rd_addr <= instr(to_integer(unsigned(instr_addr)))(1 downto 0);

end Behavioral;
