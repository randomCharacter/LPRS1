--------------------------------------------------------------------------------
-- Company:       FTN
-- Engineer:      Mario Perić
--
-- Create Date:   12:38:51 12/06/2016 
-- Design Name:   
-- Module Name:   lab5 - Test Bench
-- Project Name:  lab5
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: zadata6
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
 
ENTITY lab5_tb IS
END lab5_tb;
 
ARCHITECTURE behavior OF lab5_tb IS 
 
 
    COMPONENT lab5
    PORT(
         iCLK : IN  std_logic;
         inRST : IN  std_logic;
         inSTOP : IN  std_logic;
         inRL : IN  std_logic;
         inRR : IN  std_logic;
         inBLINK : IN  std_logic;
         oLED : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    
   signal iCLK : std_logic := '0';
   signal inRST : std_logic := '0';
   signal inSTOP : std_logic := '1';
   signal inRL : std_logic := '1';
   signal inRR : std_logic := '1';
   signal inBLINK : std_logic := '1';
   signal oLED : std_logic_vector(7 downto 0);

   constant iCLK_period : time := 10 ns;
 
BEGIN
 
   uut: lab5 PORT MAP (
          iCLK => iCLK,
          inRST => inRST,
          inSTOP => inSTOP,
          inRL => inRL,
          inRR => inRR,
          inBLINK => inBLINK,
          oLED => oLED
        );

   iCLK_process :process
   begin
		iCLK <= '0';
		wait for iCLK_period/2;
		iCLK <= '1';
		wait for iCLK_period/2;
   end process;
 

   stim_proc: process
   begin		
      
		inRST <= '0';
		wait for 5.25 * iCLK_period;
		inRST <= '1';
				
		wait for 50 * iCLK_period;
		
		inRL <= '0';
		wait for iCLK_period;
		inRL <= '1';
		wait for 200 * iCLK_period;
	
		inSTOP <= '0';
		wait for iCLK_period;
		inSTOP <= '1';
		wait for 50 * iCLK_period;

		inRR <= '0';
		wait for iCLK_period;
		inRR <= '1';
		wait for 200 * iCLK_period;
				
		inSTOP <= '0';
		wait for iCLK_period;
		inSTOP <= '1';
		wait for 50 * iCLK_period;
		
		inBLINK <= '0';
		wait for iCLK_period;
		inBLINK <= '1';
		wait for 200 * iCLK_period;

		inSTOP <= '0';
		wait for iCLK_period;
		inSTOP <= '1';
		
      wait;
   end process;

END;
