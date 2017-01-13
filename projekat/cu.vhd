----------------------------------------------------------------------------------
-- Company:        FTN
-- Engineer:       Mario Perić
-- 
-- Create Date:    01:05:09 01/11/2017 
-- Design Name: 
-- Module Name:    cu - Behavioral 
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

entity cu is
    Port ( iCLK : in  STD_LOGIC;
           inRST : in  STD_LOGIC;
           iZERO : in  STD_LOGIC;
           iSIGN : in  STD_LOGIC;
           iCARRY : in  STD_LOGIC;
           iINSTR : in  STD_LOGIC_VECTOR (14 downto 0);
           oPC_EN : out  STD_LOGIC;
           oPC_LOAD : out  STD_LOGIC;
           oPC_IN : out  STD_LOGIC_VECTOR (15 downto 0);
           oREG_WE : out  STD_LOGIC_VECTOR (7 downto 0);
           oMUXA_SEL : out  STD_LOGIC_VECTOR (3 downto 0);
           oMUXB_SEL : out  STD_LOGIC_VECTOR (3 downto 0);
           oALU_SEL : out  STD_LOGIC_VECTOR (3 downto 0);
           oMEM_WE : out  STD_LOGIC);
end cu;

architecture Behavioral of cu is
	signal sDEC : STD_LOGIC_VECTOR (7 downto 0);
	signal sX, sY, sZ : STD_LOGIC_VECTOR (3 downto 0);
	
	signal sINS1 : STD_LOGIC_VECTOR (1 downto 0);
	signal sINS2 : STD_LOGIC_VECTOR (3 downto 0);
	
--	signal sJMP_INS: STD_LOGIC_VECTOR (5 downto 0);
	signal sJMP_ADDR: STD_LOGIC_VECTOR (8 downto 0);
begin
	
	sX <= '0'&iINSTR(5 downto 3);
	sY <= '0'&iINSTR(2 downto 0);
	sZ <= '0'&iINSTR(8 downto 6);
	
	sINS1 <= iINSTR(14 downto 13);
	sINS2 <= iINSTR(12 downto 9);
	
	sJMP_ADDR <= iINSTR(8 downto 0);
	
	sDEC <= "00000001" when sZ = 0 else
	        "00000010" when sZ = 1 else
			  "00000100" when sZ = 2 else
			  "00001000" when sZ = 3 else
			  "00010000" when sZ = 4 else
			  "00100000" when sZ = 5 else
			  "01000000" when sZ = 6 else
			  "10000000";
	
	process (sINS1, sINS2, sJMP_ADDR, iZERO, iSIGN, iCARRY, sDEC, sX, sY) begin
			
			case (sINS1) is
			
			-- ALU komande, nema diranja memorije
			when "00" =>
				oREG_WE <= sDEC;
				oMUXA_SEL <= sX;
				oMUXB_SEL <= sY;
				oALU_SEL <= sINS2;
				
				oPC_EN <= '1';
				oPC_LOAD <= '0';
				oPC_IN <= (others => '-');

				oMEM_WE <= '0';
				
			when "01" =>
				oREG_WE <= (others => '0');
				oMUXA_SEL <= (others => '-');
				oMUXB_SEL <= (others => '-');
				oALU_SEL <= (others => '-');
				
				oPC_IN <= "0000000"&sJMP_ADDR;
				oPC_EN <= '1';
				
				case (sINS2) is
				
				when "0000" => 
					oPC_LOAD <= '1';
				
				when "0001" =>
					if (iZERO = '1') then
						oPC_LOAD <= '1';
					else
						oPC_LOAD <= '0';
					end if;
					
				when "0010" =>
					if (iSIGN = '1') then
						oPC_LOAD <= '1';
					else
						oPC_LOAD <= '0';
					end if;
				
				when "0011" =>
					if (iCARRY = '1') then
						oPC_LOAD <= '1';
					else
						oPC_LOAD <= '0';
					end if;
				
				when "0101" =>
					if (iZERO = '0') then
						oPC_LOAD <= '1';
					else
						oPC_LOAD <= '0';
					end if;
				
				when "0110" =>
					if (iSIGN = '0') then
						oPC_LOAD <= '1';
					else
						oPC_LOAD <= '0';
					end if;
				
				when others =>
					if (iCARRY = '0') then
						oPC_LOAD <= '1';
					else
						oPC_LOAD <= '0';
					end if;
				end case;
				
				oMEM_WE <= '0';
				
			
			--ld Rz, Ry
			when "10" =>
				oREG_WE <= sDEC;
				oMUXA_SEL <= "1000"; --iDATA
				oMUXB_SEL <= sY;
				oALU_SEL <= sINS2;
				
				oPC_EN <= '1';
				oPC_LOAD <= '0';
				oPC_IN <= (others => '-');
				
				oMEM_WE <= '0';
				
			when others =>
				oREG_WE <= (others => '-');
				oMUXA_SEL <= sX;
				oMUXB_SEL <= sY;
				oALU_SEL <= sINS2;
				
				oPC_EN <= '1';
				oPC_LOAD <= '0';
				oPC_IN <= (others => '-');
				
				oMEM_WE <= '1';
			end case;
				
	end process;

end Behavioral;

