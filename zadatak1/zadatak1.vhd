----------------------------------------------------------------------------------
-- Company:        FTN 
-- Engineer:       Mario Perić
-- 
-- Create Date:    12:22:39 11/08/2016 
-- Design Name: 
-- Module Name:    zadatak1 - Behavioral 
-- Project Name:   zadatak1
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

entity zadatak1 is
    Port ( iA : in  STD_LOGIC;
           iB : in  STD_LOGIC;
           iC : in  STD_LOGIC;
           iD : in  STD_LOGIC;
           oY : out  STD_LOGIC;
           isel : in  STD_LOGIC_VECTOR(1 downto 0));
end zadatak1;

architecture Behavioral of zadatak1 is

begin

	oY <= iA when isel = "00" else
         iB when isel = "01" else
		   iC when isel = "10" else
		   iD;

end Behavioral;

