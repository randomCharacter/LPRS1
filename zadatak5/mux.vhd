----------------------------------------------------------------------------------
-- Company:        FTN
-- Engineer:       Mario Perić
-- 
-- Create Date:    21:37:07 01/10/2017 
-- Design Name: 
-- Module Name:    mux - Behavioral 
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
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity mux is
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
end mux;

architecture Behavioral of mux is

begin

	oQ <= iD0 when iSEL = 0 else
	      iD1 when iSEL = 1 else
	      iD2 when iSEL = 2 else
	      iD3 when iSEL = 3 else
	      iD4 when iSEL = 4 else
	      iD5 when iSEL = 5 else
	      iD6 when iSEL = 6 else
	      iD7 when iSEL = 7 else
			iD8;

end Behavioral;

