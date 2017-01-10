----------------------------------------------------------------------------------
-- Company:        FTN
-- Engineer:       Mario Perić
-- 
-- Create Date:    12:51:12 01/10/2017 
-- Design Name: 
-- Module Name:    CU - Behavioral 
-- Project Name:   lab7
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

entity CU is
    Port ( iRESULT : in  STD_LOGIC;
			  iCLK : in  STD_LOGIC;
			  inRST : in  STD_LOGIC;
           oR0_EN : out  STD_LOGIC;
           oR1_EN : out  STD_LOGIC;
           oADDER_OP : out  STD_LOGIC_VECTOR (1 downto 0);
           oCMP_WITH : out  STD_LOGIC_VECTOR (31 downto 0);
           oCMP_EN : out  STD_LOGIC;
			  oSHL_EN : out STD_LOGIC);
end CU;

architecture Behavioral of CU is
	type tSTATE is (T0, T1, T2, DONE);
	signal sSTATE : tSTATE;
	signal sSTATE_NEXT : tSTATE;
begin

	process (inRST, sSTATE, iRESULT) begin
		if (inRST = '0') then
			oR0_EN <= '0';
			oR1_EN <= '0';
			oADDER_OP <= "00";
			oSHL_EN <= '0';
			oCMP_WITH <= (others => '0');
			oCMP_EN <= '0';
			sSTATE_NEXT <= T0;
		else
			case (sSTATE) is
				when T0 =>
					oR0_EN <= '1';
					oR1_EN <= '0';
					oADDER_OP <= "00";
					oSHL_EN <= '1';
					oCMP_WITH <= (others => '-');
					oCMP_EN <= '-';
					
					sSTATE_NEXT <= T1;
				
				when T1 =>
					oR0_EN <= '0';
					oR1_EN <= '1';
					oADDER_OP <= "01";
					oSHL_EN <= '0';
					oCMP_WITH <= (others => '-');
					oCMP_EN <= '-';
					
					sSTATE_NEXT <= T2;
					
				
				when T2 =>
					oR0_EN <= '0';
					oR1_EN <= '0';
					oADDER_OP <= "11";
					oSHL_EN <= '0';
					oCMP_WITH <= "00000000000000000000000000000100";
					oCMP_EN <= '1';
				
					if (iRESULT = '1') then 
						sSTATE_NEXT <= DONE;
					else
						sSTATE_NEXT <= T0;
					end if;
				
				when DONE =>
					oR0_EN <= '0';
					oR1_EN <= '0';
					oADDER_OP <= "--";
					oSHL_EN <= '-';
					oCMP_WITH <= (others => '-');
					oCMP_EN <= '-';
					
					sSTATE_NEXT <= DONE;
			end case;
		end if;
	end process;
	
	process (iCLK, inRST) begin
		if (rising_edge(iCLK)) then
			sSTATE <= sSTATE_NEXT;
		end if;
	end process;
end Behavioral;
