----------------------------------------------------------------------------------
-- Company:        FTN
-- Engineer:       Mario Perić
-- 
-- Create Date:    00:47:18 01/11/2017 
-- Design Name: 
-- Module Name:    data_ram - Behavioral 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity data_ram is
    Port ( iCLK : in  STD_LOGIC;
           inRST : in  STD_LOGIC;
           iA : in  STD_LOGIC_VECTOR (4 downto 0);
           iD : in  STD_LOGIC_VECTOR (15 downto 0);
           iWE : in  STD_LOGIC;
           oQ : out  STD_LOGIC_VECTOR (15 downto 0));
end data_ram;

architecture Behavioral of data_ram is
	type tRAM is array (31 downto 0) of STD_LOGIC_VECTOR (15 downto 0);
	signal sRAM : tRAM;
begin
	
	process (iCLK, inRST) begin
		if (inRST = '0') then
			sRAM(0) <= X"0005";
			for i in 31 downto 1 loop
				sRAM(i) <= (others => '0');
			end loop;
		elsif (falling_edge(iCLK)) then
			if (iWE = '1') then
				sRAM(to_integer(unsigned(iA))) <= iD;
			end if;
		end if;
		oQ <= sRAM(to_integer(unsigned(iA)));
	end process;
	
	
	
end Behavioral;

