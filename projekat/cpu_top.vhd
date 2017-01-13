----------------------------------------------------------------------------------
-- Company:        FTN
-- Engineer:       Mario Perić
-- 
-- Create Date:    02:31:00 01/11/2017 
-- Design Name: 
-- Module Name:    cpu_top - Behavioral 
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

entity cpu_top is
    Port ( iCLK : in  STD_LOGIC;
           inRST : in  STD_LOGIC;
           iINSTR : in  STD_LOGIC_VECTOR (14 downto 0);
           iDATA : in  STD_LOGIC_VECTOR (15 downto 0);
           oPC : out  STD_LOGIC_VECTOR (15 downto 0);
           oDATA : out  STD_LOGIC_VECTOR (15 downto 0);
           oADDR : out  STD_LOGIC_VECTOR (15 downto 0);
           oMEM_WE : out  STD_LOGIC);
end cpu_top;

architecture Behavioral of cpu_top is

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
           iINSTR : in  STD_LOGIC_VECTOR (14 downto 0);
           oPC_EN : out  STD_LOGIC;
           oPC_LOAD : out  STD_LOGIC;
           oPC_IN : out  STD_LOGIC_VECTOR (15 downto 0);
           oREG_WE : out  STD_LOGIC_VECTOR (7 downto 0);
           oMUXA_SEL : out  STD_LOGIC_VECTOR (3 downto 0);
           oMUXB_SEL : out  STD_LOGIC_VECTOR (3 downto 0);
           oALU_SEL : out  STD_LOGIC_VECTOR (3 downto 0);
           oMEM_WE : out  STD_LOGIC);
	end component;
	
	-- Programski brojač
	component cnt is
		Port ( iCLK : in  STD_LOGIC;
			  inRST : in  STD_LOGIC;
			  iD : in  STD_LOGIC_VECTOR (15 downto 0);
			  iEN : in  STD_LOGIC;
			  iLOAD : in  STD_LOGIC;
			  oQ : out  STD_LOGIC_VECTOR (15 downto 0));
	end component;
	
	-- Signali
	signal sR0, sR1, sR2, sR3, sR4, sR5, sR6, sR7, sMUXA, sMUXB, sRESULT, sPC_IN, sPC : STD_LOGIC_VECTOR(15 downto 0);
	signal sREG_WE : STD_LOGIC_VECTOR(7 downto 0);
	signal sMUXA_SEL, sMUXB_SEL, sALU_SEL : STD_LOGIC_VECTOR(3 downto 0);
	signal sZERO, sSIGN, sCARRY, sZERO_BUFF, sSIGN_BUFF, sCARRY_BUFF, sMEM_WE, sPC_EN, sPC_LOAD : STD_LOGIC;
	
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
		oZERO => sZERO_BUFF,
		oSIGN => sSIGN_BUFF,
		oCARRY => sCARRY_BUFF
	);
	
	-- Upravljačka jedinica
	iCU : CU port map (
		iCLK => iCLK,
		inRST => inRST,
		iZERO => sZERO,
		iSIGN => sSIGN,
		iCARRY => sCARRY,
		iINSTR => iINSTR,
		oPC_EN => sPC_EN,
		oPC_LOAD => sPC_LOAD,
		oPC_IN => sPC_IN,
		oREG_WE => sREG_WE,
		oMUXA_SEL => sMUXA_SEL,
		oMUXB_SEL => sMUXB_SEL,
		oALU_SEL => sALU_SEL,
		oMEM_WE => sMEM_WE
	);
	
	-- Programski brojač
	PC : CNT port map (
		iCLK => iCLK,
		inRST => inRST,
		iD => sPC_IN,
		iEN => sPC_EN,
		iLOAD => sPC_LOAD,
		oQ => sPC
	);
	
	-- Baferovanje status registara
	process(inRST, iCLK) begin
		if (inRST = '0') then
			sZERO <= '0';
			sSIGN <= '0';
			sCARRY <= '0';
		elsif (rising_edge(iCLK)) then
			sZERO <= sZERO_BUFF;
			sSIGN <= sSIGN_BUFF;
			sCARRY <= sCARRY_BUFF;
		end if;
	end process;
	
	-- Izlaz iz sistema
	oDATA <= sRESULT;
	oPC <= sPC;
	oMEM_WE <= sMEM_WE;
	oADDR <= sMUXB;
	
end Behavioral;

