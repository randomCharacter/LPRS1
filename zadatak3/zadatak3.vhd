----------------------------------------------------------------------------------
-- Company:        FTN
-- Engineer:       Mario Perić
-- 
-- Create Date:    15:34:29 11/28/2016 
-- Design Name: 
-- Module Name:    zadatak3 - Behavioral 
-- Project Name:   zadatak3
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

entity zadatak3 is
    Port ( iCLK : in  STD_LOGIC;
           inRST : in  STD_LOGIC;	
           inSTART : in  STD_LOGIC;
           inSTOP : in  STD_LOGIC;
           inCONTINUE : in  STD_LOGIC;
           oSEC : out  STD_LOGIC_VECTOR (7 downto 0));
end zadatak3;

architecture Behavioral of zadatak3 is
	constant cSEC : STD_LOGIC_VECTOR (24 downto 0) := '1'&x"6E35FF";
	signal sSEC : STD_LOGIC_VECTOR (7 downto 0);
	signal sRUN : STD_LOGIC;
	signal sRUN_old : STD_LOGIC;
	signal sCOUNT : STD_LOGIC_VECTOR (24 downto 0);

begin
		
	process (sRUN, sRUN_old, inSTART, inCONTINUE, inSTOP, inRST) begin
		if (inRST = '0') then
			sRUN <= '0';
		elsif (inSTART = '0') then
			sRUN <= '1';
		elsif (inSTOP = '0') then
			sRUN <= '0';
		elsif (inCONTINUE = '0') then
			sRUN <= '1';
		else
			sRUN <= sRUN_old;
		end if;
	end process;
	
	process (iCLK, inRST) begin
		if (inRST = '0') then
			sSEC <= (others => '0');
			sCOUNT <= (others => '0');
		elsif (rising_edge(iCLK)) then
			if (sRUN = '1') then
				if (sCOUNT = cSEC) then
					sCOUNT <= (others => '0');
					sSEC <= sSEC + "00000001";
				elsif (inSTART = '0') then
					sSEC <= "00000000";
					sCOUNT <= (others => '0');
				else
					sCOUNT <= sCOUNT + "0000000000000000000000001";
				end if;
			end if;
			
			sRUN_old <= sRUN;
			
		end if;
	end process;
	
	oSEC <= sSEC;
	
end Behavioral;