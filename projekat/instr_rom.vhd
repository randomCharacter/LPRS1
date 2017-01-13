----------------------------------------------------------------------------------
-- Company:        FTN
-- Engineer:       Mario Perić
-- 
-- Create Date:    00:44:54 01/11/2017 
-- Design Name: 
-- Module Name:    instr_rom - Behavioral 
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

entity instr_rom is
    Port ( iA : in  STD_LOGIC_VECTOR (4 downto 0);
           oQ : out  STD_LOGIC_VECTOR (14 downto 0));
end instr_rom;

architecture Behavioral of instr_rom is
	type tROM is array(31 downto 0) of std_logic_vector(14 downto 0);
	signal sROM : tROM;
begin
	--         "IIIIIIZZZXXXYYY"
	sROM(0) <= "100000000---000";
	sROM(1) <= "000110001001---";
	sROM(2) <= "000110010010---";
	sROM(3) <= "000000011010---";
	sROM(4) <= "001000001001---";
	sROM(5) <= "000111011011---";
	sROM(6) <= "000000111011---";
	sROM(7) <= "010101000000100";
	sROM(8) <= "000010111000010";
	sROM(9) <= "010101000000001";
	sROM(10) <= "000000000001---";
	sROM(11) <= "000000000000000";
	sROM(12) <= "010000000001011";
	
	oQ <= sROM(to_integer(unsigned(iA)));

end Behavioral;

