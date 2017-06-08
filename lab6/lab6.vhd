----------------------------------------------------------------------------------
-- Company:        FTN
-- Engineer:       Mario Perić
-- 
-- Create Date:    12:25:47 12/13/2016 
-- Design Name: 
-- Module Name:    lab6 - Behavioral 
-- Project Name:   lab6
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

entity zadata6 is
    Port ( iCLK : in  STD_LOGIC;
           inRST : in  STD_LOGIC;
           oRED : out  STD_LOGIC;
           oYELLOW : out  STD_LOGIC;
           oGREEN : out  STD_LOGIC);
end zadata6;

architecture Behavioral of zadata6 is
	
	type tSTATE is (IDLE, RED, RED_YELLOW, YELLOW, GREEN);
	signal sSTATE : tSTATE;
	signal sRL_CNT_TC : STD_LOGIC;
	signal sGL_CNT_TC : STD_LOGIC;
	signal sRL_CNT : STD_LOGIC_VECTOR(2 downto 0);
	signal sGL_CNT : STD_LOGIC_VECTOR(3 downto 0);
	signal sRL_CNT_EN : STD_LOGIC;
	signal sGL_CNT_EN : STD_LOGIC;

begin
	
	process (iCLK, inRST) begin
		if (inRST = '0') then
			sSTATE <= IDLE;
		elsif (rising_edge(iCLK)) then
			case sSTATE is
				when IDLE => 
					sSTATE <= RED;
					
				when RED =>
					if (sRL_CNT_TC = '1') then
						sSTATE <= RED_YELLOW;
					elsif (sRL_CNT_TC = '0') then
						sSTATE <= RED;
					end if;
					
				when RED_YELLOW => 
					sSTATE <= GREEN;
					
				when GREEN =>
					if (sGL_CNT_TC = '1') then
						sSTATE <= YELLOW;
					elsif (sGL_CNT_TC = '0') then
						sSTATE <= GREEN;
					end if;
					
				when YELLOW =>
					sSTATE <= RED;
				end case;
		end if;
	end process;
	
	process (iCLK, inRST) begin
		if (inRST = '0') then
			sRL_CNT <= (others => '0');
		elsif (rising_edge(iCLK)) then
			if (sRL_CNT_EN = '1') then
				if (sRL_CNT = 5) then
					sRL_CNT <= (others => '0');
				else
					sRL_CNT <= sRL_CNT + "001";
				end if;
			end if;
		end if;
	end process;
	
	process (iCLK, inRST) begin
		if (inRST = '0') then
			sGL_CNT <= (others => '0');
		elsif (rising_edge(iCLK)) then
			if (sGL_CNT_EN = '1') then
				if (sGL_CNT = 9) then
					sGL_CNT <= (others => '0');
				else
					sGL_CNT <= sGL_CNT + "0001";
				end if;
			end if;
		end if;
	end process;
	
	sRL_CNT_EN <= '1' when (sSTATE = RED) else '0';
	sGL_CNT_EN <= '1' when (sSTATE = GREEN) else '0';
	
	sRL_CNT_TC <= '1' when sRL_CNT = 5 else '0';
	sGL_CNT_TC <= '1' when sGL_CNT = 9 else '0';
	
	oRED <= '1' when (sSTATE = RED or sSTATE = RED_YELLOW) else '0';
	oYELLOW <= '1' when (sSTATE = RED_YELLOW or sSTATE = YELLOW) else '0';
	oGREEN <= '1' when (sSTATE = GREEN) else '0';

end Behavioral;

