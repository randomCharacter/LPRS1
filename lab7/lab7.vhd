----------------------------------------------------------------------------------
-- Company:        FTN
-- Engineer:       Mario Perić
-- 
-- Create Date:    12:22:38 01/10/2017 
-- Design Name: 
-- Module Name:    lab7 - Behavioral 
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

entity lab7 is
    Port ( iCLK : in  STD_LOGIC;
           inRST : in  STD_LOGIC;
           oRESULT : out  STD_LOGIC);
end lab7;



architecture Behavioral of lab7 is

	component CU is
		Port ( iRESULT : in  STD_LOGIC;
			  iCLK : in  STD_LOGIC;
			  inRST : in  STD_LOGIC;
			  oR0_EN : out  STD_LOGIC;
			  oR1_EN : out  STD_LOGIC;
			  oADDER_OP : out  STD_LOGIC_VECTOR (1 downto 0);
			  oCMP_WITH : out  STD_LOGIC_VECTOR (31 downto 0);
			  oCMP_EN : out  STD_LOGIC;
			  oSHL_EN : out STD_LOGIC);
	end component;

	signal sR0_en : STD_LOGIC;
	signal sR1_en : STD_LOGIC;
	signal sADDER_OP : STD_LOGIC_VECTOR (1 downto 0);
	signal sCMP_WITH : STD_LOGIC_VECTOR (31 downto 0);
	signal sCMP_en : STD_LOGIC;
	signal sR0 : STD_LOGIC_VECTOR(31 downto 0);
	signal sR1 : STD_LOGIC_VECTOR(31 downto 0);
	signal sSHL_EN : STD_LOGIC;
	
	signal sADD : STD_LOGIC_VECTOR(31 downto 0);
	signal sSHL	: STD_LOGIC_VECTOR(31 downto 0);
	signal sRESULT : STD_LOGIC;
begin
	
	iCU : CU port map (
	   iRESULT => sRESULT,
		oR0_EN => sR0_EN,
		oR1_EN => sR1_EN,
		oADDER_OP => sADDER_OP,
		oCMP_WITH => sCMP_WITH,
		oCMP_EN => sCMP_EN,
		iCLK => iCLK,
		inRST => inRST,
		oSHL_EN => sSHL_EN
	);
	
	process (iCLK, inRST) begin
		if (inRST = '0') then
			sR0 <= (others => '0');
			sR1 <= (others => '0');
		elsif(rising_edge(iCLK)) then
			if (sR0_en = '1') then
				sR0 <= sSHL;
			end if;
			if (sR1_en = '1') then
				sR1 <= sSHL;
			end if;
		end if;
	end process;
	
	sADD <= sR0 + sR1 when sADDER_OP = "00" else
			  "1" + sR1 when sADDER_OP = "01" else
			  sR0 + "0" when sADDER_OP = "10" else
			  "0" + sR1;
	
	-- SHL
	sSHL <= sADD(30 downto 0)&'0' when sSHL_EN = '1' else
			  sADD;
	
	sRESULT <= '1' when (sCMP_EN = '1' and sSHL = sCMP_WITH(31 downto 0)) else
				  '0';
	
	oRESULT <= sRESULT;

end Behavioral;
