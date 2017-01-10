----------------------------------------------------------------------------------
-- Company:        FTN
-- Engineer:       Mario Perić
-- 
-- Create Date:    23:04:42 01/10/2017 
-- Design Name: 
-- Module Name:    cu - Behavioral 
-- Project Name:   zadatak5
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity cu is
    Port ( iCLK : in  STD_LOGIC;
           inRST : in  STD_LOGIC;
           iZERO : in  STD_LOGIC;
           iSIGN : in  STD_LOGIC;
           iCARRY : in  STD_LOGIC;
           oREG_WE : out  STD_LOGIC_VECTOR (7 downto 0);
           oMUXA_SEL : out  STD_LOGIC_VECTOR (3 downto 0);
           oMUXB_SEL : out  STD_LOGIC_VECTOR (3 downto 0);
           oALU_SEL : out  STD_LOGIC_VECTOR (3 downto 0));
end cu;

architecture Behavioral of cu is
	type tSTATE is (S0, S1, S2, DONE);
	signal sSTATE, sSTATE_NEXT : tSTATE;
begin
	
	process (inRST, sSTATE) begin
		if (inRST = '0') then
			oREG_WE <= (others => '0');
			oMUXA_SEL <= (others => '0');
			oMUXB_SEL <= (others => '0');
			oALU_SEL <= (others => '0');
			sSTATE_NEXT <= S0;
		else
			case (sSTATE) is
			
			when S0 =>
				oREG_WE <= "00000010";
				oMUXA_SEL <= "0000";
				oMUXB_SEL <= "----";
				oALU_SEL <= "0110";
				sSTATE_NEXT <= S1;
				
			when S1 =>
				oREG_WE <= "00000100";
				oMUXA_SEL <= "0000";
				oMUXB_SEL <= "0001";
				oALU_SEL <= "0001";
				sSTATE_NEXT <= S2;
			
			when S2 =>
				oREG_WE <= "00001000";
				oMUXA_SEL <= "0001";
				oMUXB_SEL <= "0010";
				oALU_SEL <= "0001";
				sSTATE_NEXT <= DONE;
			
			when DONE =>
				oREG_WE <= "00000000";
				oMUXA_SEL <= "----";
				oMUXB_SEL <= "----";
				oALU_SEL <= "----";
				sSTATE_NEXT <= DONE;
			end case;
		end if;
	end process;
	
	process (iCLK) begin
		if (rising_edge(iCLK)) then
			sSTATE <= sSTATE_NEXT;
		end if;
	end process;

end Behavioral;

