--------------------------------------------------------------------------------
-- Company:       FTN
-- Engineer:      Mario Perić
--
-- Create Date:   21:26:12 12/19/2016
-- Design Name:   
-- Module Name:   zadatak 4 - Test Bench 
-- Project Name:  zadatak4
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: zadatak4
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
 
ENTITY zadatak4_tb IS
END zadatak4_tb;
 
ARCHITECTURE behavior OF zadatak4_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT zadatak4
    PORT(
         iCLK : IN  std_logic;
         inRST : IN  std_logic;
         inLEFT : IN  std_logic;
         inRIGHT : IN  std_logic;
         inHAZ : IN  std_logic;
         oLEFT : OUT  std_logic_vector(2 downto 0);
         oRIGHT : OUT  std_logic_vector(2 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal iCLK : std_logic := '0';
   signal inRST : std_logic := '0';
   signal inLEFT : std_logic := '0';
   signal inRIGHT : std_logic := '0';
   signal inHAZ : std_logic := '0';

 	--Outputs
   signal oLEFT : std_logic_vector(2 downto 0);
   signal oRIGHT : std_logic_vector(2 downto 0);

   -- Clock period definitions
   constant iCLK_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: zadatak4 PORT MAP (
          iCLK => iCLK,
          inRST => inRST,
          inLEFT => inLEFT,
          inRIGHT => inRIGHT,
          inHAZ => inHAZ,
          oLEFT => oLEFT,
          oRIGHT => oRIGHT
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
		inLEFT <= '1';
		inRIGHT <= '1';
		inHAZ <= '1';
		wait for 5.2 * iCLK_period;
		
		inRST <= '1';
		inLEFT <= '1';
		inRIGHT <= '1';
		inHAZ <= '1';
		wait for 10 * iCLK_period;
		
		inRST <= '1';
		inLEFT <= '0';
		inRIGHT <= '1';
		inHAZ <= '1';
		wait for 10 * iCLK_period;
		
		inRST <= '1';
		inLEFT <= '1';
		inRIGHT <= '1';
		inHAZ <= '1';
		wait for 100ns;
		
		inRST <= '1';
		inLEFT <= '1';
		inRIGHT <= '0';
		inHAZ <= '1';
		wait for 10 * iCLK_period;
		
		inRST <= '1';
		inLEFT <= '1';
		inRIGHT <= '1';
		inHAZ <= '1';
		wait for 100ns;
		
		inRST <= '1';
		inLEFT <= '0';
		inRIGHT <= '1';
		inHAZ <= '0';
		wait for 10 * iCLK_period;
		
		inRST <= '1';
		inLEFT <= '1';
		inRIGHT <= '1';
		inHAZ <= '1';
		wait for 100ns;
		
		inRST <= '1';
		inLEFT <= '0';
		inRIGHT <= '0';
		inHAZ <= '1';
		wait for 10 * iCLK_period;
		
		inRST <= '1';
		inLEFT <= '1';
		inRIGHT <= '1';
		inHAZ <= '1';
		
		wait;
   end process;

END;
