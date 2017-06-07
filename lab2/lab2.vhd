----------------------------------------------------------------------------------
-- Company:        FTN
-- Engineer:       Mario Perič
-- 
-- Create Date:    12:33:25 11/08/2016 
-- Design Name: 
-- Module Name:    lab2 - Behavioral 
-- Project Name:   lab2
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

entity lab2 is
    Port ( iA : in  STD_LOGIC;
           iB : in  STD_LOGIC;
           iC : in  STD_LOGIC;
           iD : in  STD_LOGIC;
           oY : out  STD_LOGIC;
           isel : in  STD_LOGIC_VECTOR (1 downto 0));
end lab2;

architecture Behavioral of lab2 is

begin

	process (isel, iA, iB, iC, iD) begin
	
		case (isel) is
			when "00" => oY <= iA;
			when "01" => oY <= iB;
			when "10" => oY <= iC;
			when others => oY <= iD;
		end case;
		
	end process;

end Behavioral;

