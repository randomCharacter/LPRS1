----------------------------------------------------------------------------------
-- Company:        Mario Perić
-- Engineer:       FTN
-- 
-- Create Date:    20:09:11 11/14/2016 
-- Design Name: 
-- Module Name:    zadatak2 - Behavioral 
-- Project Name:   zadatak2
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

entity zadatak2 is
    Port ( iSW : in  STD_LOGIC_VECTOR (7 downto 0);
           iSEL : in  STD_LOGIC;
			  iJOY1 : in  STD_LOGIC;
			  iJOY3 : in  STD_LOGIC;
           oLED : out  STD_LOGIC_VECTOR (7 downto 0));
end zadatak2;

architecture Behavioral of zadatak2 is
	signal sCODE: STD_LOGIC_VECTOR (2 downto 0);
	signal sCOMP: STD_LOGIC;
	signal sSUM: STD_LOGIC_VECTOR (3 downto 0);
	signal sOUT: STD_LOGIC_VECTOR (7 downto 0);
begin
	sCODE <= "000" when iSW(0) = '1' else
	         "001" when iSW(1) = '1' else
	         "010" when iSW(2) = '1' else
	         "011" when iSW(3) = '1' else
	         "100" when iSW(4) = '1' else
	         "101" when iSW(5) = '1' else
	         "110" when iSW(6) = '1' else
	         "111";
	
	sCOMP <= '1' when iSW = "11111111" else
	         '0';
	
	sSUM <= ('0'&iSW(2 downto 0)) + ('0'&iSW(5 downto 3));
	
	sOUT <= sCOMP&sCODE&sSUM when iSEL = '1' else
	        "01010101";
	
	oLED <= sOUT when (iJOY3 = '0' and iJOY1 = '0') else
	        "00000"&sCODE when (iJOY3 = '0' and iJOY1 = '1') else
			  "0000"&sSUM when (iJOY3 = '1' and iJOY1 = '0') else
			  "00000000";
	
end Behavioral;

