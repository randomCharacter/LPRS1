----------------------------------------------------------------------------------
-- Company:        FTN
-- Engineer:       Mario Perić
-- 
-- Create Date:    12:53:37 11/08/2016 
-- Design Name: 
-- Module Name:    lab3 - Behavioral 
-- Project Name:   lab3
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
use IEEE.STD_LOGIC_unsigned.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity lab3 is
    Port ( iA : in  STD_LOGIC_VECTOR (3 downto 0);
           iB : in  STD_LOGIC_VECTOR (3 downto 0);
           iSEL : in  STD_LOGIC_VECTOR (1 downto 0);
           oY : out  STD_LOGIC_VECTOR (3 downto 0)
			  );
end lab3;

architecture Behavioral of lab3 is
	signal sAB : STD_LOGIC_VECTOR (4 downto 0);
begin
	
	sAB <= ('0' & iA) + ('0' & iB);
	
	process (iSEL, iA, iB) begin
		case(iSEL) is
			when "00" => oY <= iA;
			when "01" => oY <= iB;
			when "10" => oY <= sAB(3 downto 0);
			when others => oY <= iA + 1;
		end case;
	end process;
	

end Behavioral;

