----------------------------------------------------------------------------------
-- Company:        FTN
-- Engineer:       Mario Perić
-- 
-- Create Date:    00:34:13 01/11/2017 
-- Design Name: 
-- Module Name:    cnt - Behavioral 
-- Project Name:   projekat
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
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity cnt is
    Port ( iCLK : in  STD_LOGIC;
           inRST : in  STD_LOGIC;
           iD : in  STD_LOGIC_VECTOR (15 downto 0);
           iEN : in  STD_LOGIC;
           iLOAD : in  STD_LOGIC;
           oQ : out  STD_LOGIC_VECTOR (15 downto 0));
end cnt;

architecture Behavioral of cnt is
	signal sQ : STD_LOGIC_VECTOR (15 downto 0);
begin
	
	process (iCLK, inRST) begin
		if (inRST = '0') then
			sQ <= (others => '0');
		elsif (rising_edge(iCLK)) then
			if (iEN = '1') then
				if (iLOAD = '1') then
					sQ <= iD;
				else
					sQ <= sQ + "1";
				end if;
			end if;
		end if;
	end process;
	
	oQ <= sQ;
	
end Behavioral;

