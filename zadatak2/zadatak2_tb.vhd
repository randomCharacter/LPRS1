--------------------------------------------------------------------------------
-- Company:       FTN
-- Engineer:      Mario Perić
--
-- Create Date:   19:06:41 11/14/2016
-- Design Name:   
-- Module Name:   zadatak2 - Test Bench 
-- Project Name:  zadatak2
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: zadatak2
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
 
ENTITY zadatak2_tb IS
END zadatak2_tb;
 
ARCHITECTURE behavior OF zadatak2_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT zadatak2
    PORT(
         iSW : IN  std_logic_vector(7 downto 0);
         iSEL : IN  std_logic;
			iJOY1 : in  std_logic;
			iJOY3 : in  std_logic;
         oLED : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal iSW : std_logic_vector(7 downto 0) := (others => '0');
   signal iSEL : std_logic := '0';

 	--Outputs
   signal oLED : std_logic_vector(7 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: zadatak2 PORT MAP (
          iSW => iSW,
          iSEL => iSEL,
			    iJOY1 => iJOY1,
			    iJOY3 => iJOY3,
          oLED => oLED
        );

 

   -- Stimulus process
   stim_proc: process
   begin		
	
      iSW <= "11110100";
		  iSEL <= '0';
      wait for 50 ns;
		  iSEL <= '1';
		  wait for 50 ns;
		
		  iSW <= "01101001";
		  iSEL <= '0';
      wait for 50 ns;
		  iSEL <= '1';
		  wait for 50 ns;
		
		  iSW <= "11011001";
		  iSEL <= '0';
      wait for 50 ns;
      iSEL <= '1';
		  wait for 50 ns;
		
		  iSW <= "11111111";
		  iSEL <= '0';
      wait for 50 ns;
		  iSEL <= '1';
		  wait for 50 ns;

      wait;
   end process;

END;
