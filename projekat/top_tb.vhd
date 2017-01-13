--------------------------------------------------------------------------------
-- Company:       FTN
-- Engineer:      Mario Perić
--
-- Create Date:   14:05:07 01/11/2017
-- Design Name:   
-- Module Name:   top - Test Bench 
-- Project Name:  projekat
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: top
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
 
ENTITY top_tb IS
END top_tb;
 
ARCHITECTURE behavior OF top_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT top
    PORT(
         iCLK : IN  std_logic;
         inRST : IN  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal iCLK : std_logic := '0';
   signal inRST : std_logic := '0';

   -- Clock period definitions
   constant iCLK_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: top PORT MAP (
          iCLK => iCLK,
          inRST => inRST
        );

   -- Clock process definitions
   iCLK_process :process
   begin
		iCLK <= '0';
		wait for iCLK_period/2;
		iCLK <= '1';
		wait for iCLK_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      inRST <= '0';
		wait for iCLK_period*2;
		inRST <= '1';

      -- insert stimulus here 

      wait;
   end process;

END;
