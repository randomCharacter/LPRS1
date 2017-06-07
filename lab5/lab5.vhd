----------------------------------------------------------------------------------
-- Company:        FTN
-- Engineer:       Mario Perić
-- 
-- Create Date:    12:32:25 12/06/2016 
-- Design Name: 
-- Module Name:    lab5 - Behavioral 
-- Project Name:   lab5
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

entity lab5 is
    Port ( inRL : in  STD_LOGIC;
           inRR : in  STD_LOGIC;
           inSTOP : in  STD_LOGIC;
           inBLINK : in  STD_LOGIC;
           inRST : in  STD_LOGIC;
           iCLK : in  STD_LOGIC;
           oLED : out  STD_LOGIC_VECTOR (7 downto 0));
end lab5;

architecture Behavioral of lab5 is
	type tState is (BLINK, RL, RR, IDLE);
	signal sSTATE : tState;
	signal sLED : STD_LOGIC_VECTOR (7 downto 0);
	signal sCOUNT : STD_LOGIC_VECTOR (24 downto 0);
	signal sSEC : STD_LOGIC;
begin
	
	
	process (iCLK, inRST) begin
		if (inRST = '0') then
			sCOUNT <= (others => '0');
			sSEC <= '1';
		elsif (iCLK'event and iCLK = '1') then
			if (sCOUNT = 24000000) then
				sSEC <= '1';
				sCOUNT <= (others => '0');
			else 
				sSEC <= '0';
				sCOUNT <= sCOUNT + "0000000000000000000000001";
			end if;
		end if;
	end process;
	
	process (iCLK, inRST) begin
		if (inRST = '0') then
				sSTATE <= IDLE;
		elsif (iCLK'event and iCLK = '1') then				
			case (sSTATE) is
				when IDLE => 
					if (inRL = '0') then
						sSTATE <= RL;
					elsif (inRR = '0') then
						sSTATE <= RR;
					elsif (inBLINK = '0') then
						sSTATE <= BLINK;
					else
						sSTATE <= IDLE;
					end if;
				when RR =>
					if (inSTOP = '0') then
						sSTATE <= IDLE;
					else
						sSTATE <= RR;
					end if;
				when RL =>
					if (inSTOP = '0') then
						sSTATE <= IDLE;
					else
						sSTATE <= RL;
					end if;
				when BLINK =>
					if (inSTOP = '0') then
						sSTATE <= IDLE;
					else
						sSTATE <= BLINK;
					end if;
			end case;
		end if;
	end process;
	
	process (iCLK, inRST) begin
		if (inRST = '0') then
			sLED <= "00000000";
		elsif (iCLK'event and iCLK = '1') then
			if (sSEC = '1') then
				case (sSTATE) is
					when IDLE => 
						sLED <= "00000000";
					when RR =>
						sLED <= sLED(6 downto 0) & sLED(7);
					when RL =>
						sLED <= sLED(0) & sLED(7 downto 1);
					when BLINK =>
						sLED <= not sLED;
				end case;
			end if;
		end if;
	end process;
	
	oLED <= sLED;
	
end Behavioral;

