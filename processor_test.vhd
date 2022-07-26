----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/25/2022 10:04:52 PM
-- Design Name: 
-- Module Name: processor_test - Behavioral
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

entity processor_test is
end processor_test;

architecture Behavioral of processor_test is
-- component declaration for the unit under test
COMPONENT processor
PORT (clk : in std_logic;
        value: out std_logic_vector(7 downto 0));
end COMPONENT;

--Inputs
signal clk : std_logic := '0';

--outputs
signal value : std_logic_vector(7 downto 0);

--clock period definitions
constant clk_period : time := 10 ns;

begin

--instantiate the unit under test
uut: processor PORT MAP( clk => clk,
                        value => value);
--clock process definitions
clk_process: process
begin
clk <= '0';
wait for clk_period/2;
clk <= '1';
wait for clk_period/2;
end process;

--stimulus process
stim_process: process
begin
--hold reset state for 100ns
wait for 10 ns;

wait for clk_period*10;

--insert stimulus here

wait;
end process;

end Behavioral;
