----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/25/2022 03:08:25 PM
-- Design Name: 
-- Module Name: processor - Behavioral
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

entity processor is
    Port ( clk : in STD_LOGIC;
           value : out STD_LOGIC_VECTOR (7 downto 0));
end processor;

architecture Behavioral of processor is
COMPONENT alu
Port ( op : in STD_LOGIC_VECTOR (1 downto 0);
           rs : in STD_LOGIC_VECTOR (7 downto 0);
           rt : in STD_LOGIC_VECTOR (7 downto 0);
           rd : out STD_LOGIC_VECTOR (7 downto 0));
end COMPONENT;

COMPONENT control
Port ( instr : in STD_LOGIC_VECTOR (1 downto 0);
           alu_src : out STD_LOGIC;
           reg_dst : out STD_LOGIC;
           alu_op : out STD_LOGIC_VECTOR (1 downto 0)
                      );
end COMPONENT;

COMPONENT instruction
Port (instr_addr : in STD_LOGIC_VECTOR (2 downto 0);
        op : out STD_LOGIC_VECTOR (1 downto 0);
        rd_addr : out STD_LOGIC_VECTOR (1 downto 0);
        rs_addr : out STD_LOGIC_VECTOR (1 downto 0);
        rt_addr : out STD_LOGIC_VECTOR (1 downto 0)
        );
end COMPONENT;

COMPONENT mux0
Port ( sel : in STD_LOGIC;
        a : in STD_LOGIC_VECTOR (1 downto 0);
           b : in STD_LOGIC_VECTOR (1 downto 0);
           y : out STD_LOGIC_VECTOR (1 downto 0));
end COMPONENT;

COMPONENT mux1
Port ( sel : in STD_LOGIC;
        a : in STD_LOGIC_VECTOR (7 downto 0);
           b : in STD_LOGIC_VECTOR (7 downto 0);
           y : out STD_LOGIC_VECTOR (7 downto 0));
end COMPONENT;

COMPONENT pc
Port ( clk : in STD_LOGIC;
           next_instr : out STD_LOGIC_VECTOR (2 downto 0));
end COMPONENT;

COMPONENT registers
Port (clk : in STD_LOGIC;
        rd_addr : in STD_LOGIC_VECTOR (1 downto 0);
        rs_addr : in STD_LOGIC_VECTOR (1 downto 0);
        rt_addr : in STD_LOGIC_VECTOR (1 downto 0);
        wr_data : in STD_LOGIC_VECTOR (7 downto 0);
        rs : out STD_LOGIC_VECTOR (7 downto 0);
        rt : out STD_LOGIC_VECTOR (7 downto 0));
end COMPONENT;

COMPONENT sign_extend
Port ( data_in : in STD_LOGIC_VECTOR (1 downto 0);
           data_out : out STD_LOGIC_VECTOR (7 downto 0));
end COMPONENT;

SIGNAL WIRE_0 : STD_LOGIC_VECTOR(1 downto 0);
SIGNAL WIRE_1 : STD_LOGIC_VECTOR(7 downto 0);
SIGNAL WIRE_2 : STD_LOGIC_VECTOR(7 downto 0);
SIGNAL WIRE_3 : STD_LOGIC_VECTOR(1 downto 0);
SIGNAL WIRE_5 : STD_LOGIC;
SIGNAL WIRE_18 : STD_LOGIC_VECTOR(1 downto 0);
SIGNAL WIRE_19 : STD_LOGIC_VECTOR(1 downto 0);
SIGNAL WIRE_8 : STD_LOGIC;
SIGNAL WIRE_9 : STD_LOGIC_VECTOR(7 downto 0);
SIGNAL WIRE_10 : STD_LOGIC_VECTOR(7 downto 0);
SIGNAL WIRE_12 : STD_LOGIC_VECTOR(1 downto 0);
SIGNAL WIRE_13 : STD_LOGIC_VECTOR(1 downto 0);
SIGNAL WIRE_14 : STD_LOGIC_VECTOR(2 downto 0);
SIGNAL WIRE_15 : STD_LOGIC_VECTOR(7 downto 0);

begin
value <= WIRE_15;

arithmatic_logic_unit : alu
PORT MAP(op => WIRE_0,
        rs => WIRE_1,
        rt => WIRE_2,
        rd => WIRE_15);

control_unit : control
PORT MAP(instr => WIRE_3,
        alu_src => WIRE_8,
        reg_dst => WIRE_5,
        alu_op => WIRE_0);

instruction_memory : instruction
PORT MAP(instr_addr => WIRE_14,
        op => WIRE_3,
        rd_addr => WIRE_19,
        rs_addr => WIRE_13,
        rt_addr => WIRE_18);

mux_0 : mux0
PORT MAP(sel => WIRE_5,
        a => WIRE_18,
        b => WIRE_19,
        y => WIRE_12);

mux_1 : mux1
PORT MAP(sel => WIRE_8,
        a => WIRE_9,
        b => WIRE_10,
        y => WIRE_2);

program_counter : pc
PORT MAP(clk => clk,
        next_instr => WIRE_14);
        
register_file : registers
        PORT MAP(clk => clk,
                rd_addr => WIRE_12,
                rs_addr => WIRE_13,
                rt_addr => WIRE_18,
                wr_data => WIRE_15,
                rs => WIRE_1,
                rt => WIRE_9);
signn_extend : sign_extend
             PORT MAP(data_in => WIRE_19,
                      data_out => WIRE_10);
end Behavioral;
