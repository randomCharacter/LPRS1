----------------------------------------------------------------------------------
-- Company:        FTN
-- Engineer:       Mario Perić
-- 
-- Create Date:    21:41:07 01/10/2017 
-- Design Name: 
-- Module Name:    alu - Behavioral 
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

entity alu is
    Port ( iA : in  STD_LOGIC_VECTOR (15 downto 0);
           iB : in  STD_LOGIC_VECTOR (15 downto 0);
           iSEL : in  STD_LOGIC_VECTOR (3 downto 0);
           oC : out  STD_LOGIC_VECTOR (15 downto 0);
           oZERO : out  STD_LOGIC;
           oSIGN : out  STD_LOGIC;
           oCARRY : out  STD_LOGIC);
end alu;

architecture Behavioral of alu is
	signal sC : STD_LOGIC_VECTOR (16 downto 0);
begin

	sC <= '0'&iA when iSEL = "0000" else
	      ('0'&iA) + ('0'&iB) when iSEL = "0001" else
			('0'&iA) - ('0'&iB) when iSEL = "0010" else
			('0'&iA) and ('0'&iB) when iSEL = "0011" else
			('0'&iA) or ('0'&iB) when iSEL = "0100" else
			not('0'&iA) when iSEL = "0101" else
			('0'&iA) + "1" when iSEL = "0110" else
			('0'&iA) - "1" when iSEL = "0111" else
			iA&'0' when iSEL = "1000" else
			iA(0)&'0'&iA(15 downto 1) when iSEL = "1001" else
			"0"-('0'&iA) when iSEL = "1010" else
			iA(0)&iA(15)&iA(15 downto 1);
	
	oCARRY <= sC(16);
	
	oZERO <= '1' when sC(15 downto 0) = "0000000000000000" else '0';
	
	oSIGN <= sC(15);
	
	oC <= sC(15 downto 0);
	
end Behavioral;