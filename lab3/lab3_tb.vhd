--------------------------------------------------------------------------------
-- Company:       FTN
-- Engineer:      Mario Perić
--
-- Create Date:   13:01:18 11/08/2016
-- Design Name:   
-- Module Name:   lab3 - Test Bench 
-- Project Name:  lab3
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: lab3
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY lab3_tb IS
END lab3_tb;
 
ARCHITECTURE behavior OF lab3_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT lab3
    PORT(
         iA : IN  std_logic_vector(3 downto 0);
         iB : IN  std_logic_vector(3 downto 0);
         iSEL : IN  std_logic_vector(1 downto 0);
         oY : OUT  std_logic_vector (3 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal iA : std_logic_vector(3 downto 0) := (others => '0');
   signal iB : std_logic_vector(3 downto 0) := (others => '0');
   signal iSEL : std_logic_vector(1 downto 0) := (others => '0');

 	--Outputs
   signal oY : std_logic_vector (3 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: lab3 PORT MAP (
          iA => iA,
          iB => iB,
          iSEL => iSEL,
          oY => oY
        );

   -- Clock process definitions
 

   -- Stimulus process
   stim_proc: process
   begin		
      iA <= "0010";
		iB <= "1110";
		isel <= "00";
      wait for 100 ns;	
		
		isel <= "01";
		wait for 100 ns;
		
		isel <= "10";
		wait for 100 ns;
		
		isel <= "11";
		wait for 100 ns;

      -- insert stimulus here 

      wait;
   end process;

END;
