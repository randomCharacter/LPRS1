--------------------------------------------------------------------------------
-- Company:       FTN
-- Engineer:      Mario Perić
--
-- Create Date:   15:54:59 11/28/2016
-- Design Name:   
-- Module Name:   zadatak3 - Test Bench 
-- Project Name:  zadatak3
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: zadatak3
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
 
ENTITY zadatak3_tb IS
END zadatak3_tb;
 
ARCHITECTURE behavior OF zadatak3_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT zadatak3
    PORT(
         iCLK : IN  std_logic;
         inRST : IN  std_logic;
         inSTART : IN  std_logic;
         inSTOP : IN  std_logic;
         inCONTINUE : IN  std_logic;
         oSEC : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal iCLK : std_logic := '0';
   signal inRST : std_logic := '0';
   signal inSTART : std_logic := '0';
   signal inSTOP : std_logic := '0';
   signal inCONTINUE : std_logic := '0';

 	--Outputs
   signal oSEC : std_logic_vector(7 downto 0);
	
   -- Clock period definitions
   constant iCLK_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: zadatak3 PORT MAP (
          iCLK => iCLK,
          inRST => inRST,
          inSTART => inSTART,
          inSTOP => inSTOP,
          inCONTINUE => inCONTINUE,
          oSEC => oSEC
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
		inSTART <= '1';
      inSTOP <= '1';
		inCONTINUE <= '1';
      wait for 50 ns;
		
		inRST <= '1';
		inSTART <= '1';
      inSTOP <= '1';
		inCONTINUE <= '1';
		wait for 100 ns;
		
      inRST <= '1';
		inSTART <= '0';
      inSTOP <= '1';
		inCONTINUE <= '1';
		wait for 50 ns;
		
		inRST <= '1';
		inSTART <= '1';
      inSTOP <= '1';
		inCONTINUE <= '1';
		wait for 100 ns;

		inRST <= '1';
		inSTART <= '1';
      inSTOP <= '0';
		inCONTINUE <= '1';
		wait for 50 ns;
		
		inRST <= '1';
		inSTART <= '1';
      inSTOP <= '1';
		inCONTINUE <= '1';
		wait for 100 ns;
		
		inRST <= '1';
		inSTART <= '1';
      inSTOP <= '1';
		inCONTINUE <= '0';
		wait for 50 ns;
		
		inRST <= '1';
		inSTART <= '1';
      inSTOP <= '1';
		inCONTINUE <= '1';
		wait for 100 ns;
		
		inRST <= '1';
		inSTART <= '1';
      inSTOP <= '0';
		inCONTINUE <= '1';
		wait for 50 ns;
		
		inRST <= '1';
		inSTART <= '1';
      inSTOP <= '1';
		inCONTINUE <= '1';
		wait for 100 ns;
		
		inRST <= '1';
		inSTART <= '0';
      inSTOP <= '1';
		inCONTINUE <= '1';
		wait for 50 ns;
		
		inRST <= '1';
		inSTART <= '1';
      inSTOP <= '1';
		inCONTINUE <= '1';
		wait for 100 ns;
		wait;
   end process;

END;
