----------------------------------------------------------------------------------
-- Company:        FTN
-- Engineer:       Mario Perić
-- 
-- Create Date:    13:14:23 11/08/2016 
-- Design Name: 
-- Module Name:    lab3Dodatni - Behavioral 
-- Project Name:   lab3Dodatni
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
use IEEE.STD_LOGIC_unsigned.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity lab3Dodatni is
    Port ( iA : in  STD_LOGIC_VECTOR (7 downto 0);
           iB : in  STD_LOGIC_VECTOR (2 downto 0);
           iSEL : in  STD_LOGIC_VECTOR (1 downto 0);
           oY : out  STD_LOGIC_VECTOR (3 downto 0);
           oZERO : out  STD_LOGIC);
end lab3Dodatni;

architecture Behavioral of lab3Dodatni is
	signal sp1 : STD_LOGIC_VECTOR (2 downto 0);
	signal sp2 : STD_LOGIC_VECTOR (7 downto 0);
	signal sY : STD_LOGIC_VECTOR (3 downto 0);
	signal s1 : STD_LOGIC_VECTOR (3 downto 0);
	signal s2 : STD_LOGIC_VECTOR (3 downto 0);
	signal s3 : STD_LOGIC_VECTOR (3 downto 0);
	signal s4 : STD_LOGIC_VECTOR (3 downto 0);
begin
	
	sp1 <= "000" when iA(0) = '1' else
	       "001" when iA(1) = '1' else
	       "010" when iA(2) = '1' else
	       "011" when iA(3) = '1' else
	       "100" when iA(4) = '1' else
	       "101" when iA(5) = '1' else
	       "110" when iA(6) = '1' else
	       "111";
	
	s1 <= ('0' & sp1)+ ('0' & iB);
	
	s2 <= s1(3) & s1(3) & s1(3 downto 2);
	
	sp2 <= "00000001" when iB = "000" else
	       "00000010" when iB = "001" else
	       "00000100" when iB = "010" else
	       "00001000" when iB = "011" else
	       "00010000" when iB = "100" else
	       "00100000" when iB = "101" else
	       "01000000" when iB = "110" else
	       "10000000";
	
	s3 <= sp2(7 downto 4);
	
	s4 <= sp2(3 downto 0);

	process (iSel, s1, s2, s3, s4) begin
		case (iSEL) is
			when "00" => sY <= s1(3 downto 0); 
			when "01" => sY <= s2(3 downto 0); 
			when "10" => sY <= s3(3 downto 0); 
			when others => sY <= s4(3 downto 0); 
		end case;
	end process;
		
		oY <= sY;
		oZero <= '1' when sY = "0000" else
		         '0';

end Behavioral;

