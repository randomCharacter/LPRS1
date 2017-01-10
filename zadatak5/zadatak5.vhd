----------------------------------------------------------------------------------
-- Company:        FTN
-- Engineer:       Mario Perić
-- 
-- Create Date:    21:54:19 01/10/2017 
-- Design Name: 
-- Module Name:    zadatak5 - Behavioral 
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

entity zadatak5 is
    Port ( iCLK : in  STD_LOGIC;
           inRST : in  STD_LOGIC;
           iDATA : in  STD_LOGIC_VECTOR (15 downto 0);
           oDATA : out  STD_LOGIC_VECTOR (15 downto 0));
end zadatak5;

architecture Behavioral of zadatak5 is
	-- Aritmetičko logička jedinica
	component ALU is
		 Port ( iA : in  STD_LOGIC_VECTOR (15 downto 0);
				  iB : in  STD_LOGIC_VECTOR (15 downto 0);
				  iSEL : in  STD_LOGIC_VECTOR (3 downto 0);
				  oC : out  STD_LOGIC_VECTOR (15 downto 0);
				  oZERO : out  STD_LOGIC;
				  oSIGN : out  STD_LOGIC;
				  oCARRY : out  STD_LOGIC);
	end component;

	-- Multiplekser
	component MUX is
		 Port ( iD0 : in  STD_LOGIC_VECTOR (15 downto 0);
				  iD1 : in  STD_LOGIC_VECTOR (15 downto 0);
				  iD2 : in  STD_LOGIC_VECTOR (15 downto 0);
				  iD3 : in  STD_LOGIC_VECTOR (15 downto 0);
				  iD4 : in  STD_LOGIC_VECTOR (15 downto 0);
				  iD5 : in  STD_LOGIC_VECTOR (15 downto 0);
				  iD6 : in  STD_LOGIC_VECTOR (15 downto 0);
				  iD7 : in  STD_LOGIC_VECTOR (15 downto 0);
				  iD8 : in  STD_LOGIC_VECTOR (15 downto 0);
				  iSEL : in  STD_LOGIC_VECTOR (3 downto 0);
				  oQ : out  STD_LOGIC_VECTOR (15 downto 0));
	end component;

	-- Registar
	component REG is
		 Port ( iCLK : in  STD_LOGIC;
				  inRST : in  STD_LOGIC;
				  iD : in  STD_LOGIC_VECTOR (15 downto 0);
				  iWE : in  STD_LOGIC;
				  oQ : out  STD_LOGIC_VECTOR (15 downto 0));
	end component;
	
	-- Upravljačka jedinica
	component cu is
		 Port ( iCLK : in  STD_LOGIC;
				  inRST : in  STD_LOGIC;
				  iZERO : in  STD_LOGIC;
				  iSIGN : in  STD_LOGIC;
				  iCARRY : in  STD_LOGIC;
				  oREG_WE : out  STD_LOGIC_VECTOR (7 downto 0);
				  oMUXA_SEL : out  STD_LOGIC_VECTOR (3 downto 0);
				  oMUXB_SEL : out  STD_LOGIC_VECTOR (3 downto 0);
				  oALU_SEL : out  STD_LOGIC_VECTOR (3 downto 0));
	end component;

	-- Signali
	signal sR0, sR1, sR2, sR3, sR4, sR5, sR6, sR7, sMUXA, sMUXB, sRESULT : STD_LOGIC_VECTOR(15 downto 0);
	signal sREG_WE : STD_LOGIC_VECTOR(7 downto 0);
	signal sMUXA_SEL, sMUXB_SEL, sALU_SEL : STD_LOGIC_VECTOR(3 downto 0);
	signal sZERO, sSIGN, sCARRY : STD_LOGIC;
	
begin
	-- Registri
	R0 : REG port map (
	   iCLK => iCLK,
		inRST => inRST,
		iD => sRESULT,
		iWE => sREG_WE(0),
		oQ => sR0
	);
	
	R1 : REG port map (
	   iCLK => iCLK,
		inRST => inRST,
		iD => sRESULT,
		iWE => sREG_WE(1),
		oQ => sR1
	);
	
	R2 : REG port map (
	   iCLK => iCLK,
		inRST => inRST,
		iD => sRESULT,
		iWE => sREG_WE(2),
		oQ => sR2
	);
	
	R3 : REG port map (
	   iCLK => iCLK,
		inRST => inRST,
		iD => sRESULT,
		iWE => sREG_WE(3),
		oQ => sR3
	);
	
	R4 : REG port map (
	   iCLK => iCLK,
		inRST => inRST,
		iD => sRESULT,
		iWE => sREG_WE(4),
		oQ => sR4
	);
	
	R5 : REG port map (
	   iCLK => iCLK,
		inRST => inRST,
		iD => sRESULT,
		iWE => sREG_WE(5),
		oQ => sR5
	);
	
	R6 : REG port map (
	   iCLK => iCLK,
		inRST => inRST,
		iD => sRESULT,
		iWE => sREG_WE(6),
		oQ => sR6
	);
	
	R7 : REG port map (
	   iCLK => iCLK,
		inRST => inRST,
		iD => sRESULT,
		iWE => sREG_WE(7),
		oQ => sR7
	);
	
	-- Multiplekseri
	MUXA : MUX port map (
		iD0 => sR0,
		iD1 => sR1,
		iD2 => sR2,
		iD3 => sR3,
		iD4 => sR4,
		iD5 => sR5,
		iD6 => sR6,
		iD7 => sR7,
		iD8 => iDATA,
		iSEL => sMUXA_SEL,
		oQ => sMUXA
	);
	
	MUXB : MUX port map (
		iD0 => sR0,
		iD1 => sR1,
		iD2 => sR2,
		iD3 => sR3,
		iD4 => sR4,
		iD5 => sR5,
		iD6 => sR6,
		iD7 => sR7,
		iD8 => iDATA,
		iSEL => sMUXB_SEL,
		oQ => sMUXB
	);
	
	-- Aritmetičko logička jedinica
	iALU : ALU port map (
		iA => sMUXA,
		iB => sMUXB,
		iSEL => sALU_SEL,
		oC => sRESULT,
		oZERO => sZERO,
		oSIGN => sSIGN,
		oCARRY => sCARRY
	);
	
	-- Kontrolna jedinica
	iCU : CU port map (
		iCLK => iCLK,
		inRST => inRST,
		iZERO => sZERO,
		iSIGN => sSIGN,
		iCARRY => sCARRY,
		oREG_WE => sREG_WE,
		oMUXA_SEL => sMUXA_SEL,
		oMUXB_SEL => sMUXB_SEL,
		oALU_SEL => sALU_SEL
	);
	
	oDATA <= sRESULT;
	
end Behavioral;

