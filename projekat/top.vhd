----------------------------------------------------------------------------------
-- Company:        FTN
-- Engineer:       Mario Perić
-- 
-- Create Date:    02:26:46 01/11/2017 
-- Design Name: 
-- Module Name:    top - Behavioral 
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
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity top is
    Port ( iCLK : in  STD_LOGIC;
           inRST : in  STD_LOGIC);
end top;

architecture Behavioral of top is
	
	-- CPU top
	component cpu_top is
		Port ( iCLK : in  STD_LOGIC;
			inRST : in  STD_LOGIC;
			iINSTR : in  STD_LOGIC_VECTOR (14 downto 0);
			iDATA : in  STD_LOGIC_VECTOR (15 downto 0);
			oPC : out  STD_LOGIC_VECTOR (15 downto 0);
			oDATA : out  STD_LOGIC_VECTOR (15 downto 0);
			oADDR : out  STD_LOGIC_VECTOR (15 downto 0);
			oMEM_WE : out  STD_LOGIC);
	end component;
	
	-- ROM
	component instr_rom is
		Port ( iA : in  STD_LOGIC_VECTOR (4 downto 0);
			oQ : out  STD_LOGIC_VECTOR (14 downto 0));
	end component;
	
	-- RAM
	component data_ram is
		Port ( iCLK : in  STD_LOGIC;
			inRST : in  STD_LOGIC;
			iA : in  STD_LOGIC_VECTOR (4 downto 0);
			iD : in  STD_LOGIC_VECTOR (15 downto 0);
			iWE : in  STD_LOGIC;
			oQ : out  STD_LOGIC_VECTOR (15 downto 0));
	end component;
	
	-- Signali
	signal sADDR, sDATA_ST, sDATA_LD, sPC : STD_LOGIC_VECTOR (15 downto 0);
	signal sINSTR : STD_LOGIC_VECTOR (14 downto 0);
	signal sMEM_WE : STD_LOGIC;
begin
	
	-- CPU TOP
	CPU : CPU_TOP port map (
		iCLK => iCLK,
		inRST => inRST,
		iINSTR => sINSTR,
		iDATA => sDATA_LD,
		oPC => sPC,
		oDATA => sDATA_ST,
		oADDR => sADDR,
		oMEM_WE => sMEM_WE
	);
	
	RAM : DATA_RAM port map (
		iCLK => iCLK,
		inRST => inRST,
		iA => sADDR(4 downto 0),
		iD => sDATA_ST,
		iWE => sMEM_WE,
		oQ => sDATA_LD
	);
	
	ROM : INSTR_ROM port map (
		iA => sPC(4 downto 0),
		oQ => sINSTR
	);

end Behavioral;

