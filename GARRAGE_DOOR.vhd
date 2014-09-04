----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:04:23 03/21/2014 
-- Design Name: 
-- Module Name:    GARRAGE_DOOR - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
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
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

---- Uncomment the following library declaration if instantiating
---- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity GARRAGE_DOOR is
	port (T : in std_logic;
			CLK : in std_logic;
			output: out std_logic);		--Output 1 for door close and 0 for door open
end GARRAGE_DOOR;

architecture Behavioral of GARRAGE_DOOR is
	signal PS: std_logic :='0';
	signal NS: std_logic;
begin
	NS <= PS xor T;
	p1 : process(NS, CLK)
	begin
		if CLK'event and CLK='1' then
			PS <= NS;
		end if;
	end process;
	
	outputAssign : process(PS)
	begin
		if PS = '1' then
			output <= '1';
		else if PS = '0' then
				output <= '0';
			end if;
		end if;
	end process;
end Behavioral;

