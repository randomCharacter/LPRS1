--------------------------------------------------------------------------------
-- Company:       FTN
-- Engineer:      Mario Perić
--
-- Create Date:   13:01:08 12/13/2016
-- Design Name:   
-- Module Name:   lab6 - Test Bench
-- Project Name:  lab6
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
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY zadata6_tb IS
END zadata6_tb;
 
ARCHITECTURE behavior OF zadata6_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT zadata6
    PORT(
         iCLK : IN  std_logic;
         inRST : IN  std_logic;
         oRED : OUT  std_logic;
         oYELLOW : OUT  std_logic;
         oGREEN : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal iCLK : std_logic := '0';
   signal inRST : std_logic := '0';

 	--Outputs
   signal oRED : std_logic;
   signal oYELLOW : std_logic;
   signal oGREEN : std_logic;

   -- Clock period definitions
   constant iCLK_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: zadata6 PORT MAP (
          iCLK => iCLK,
          inRST => inRST,
          oRED => oRED,
          oYELLOW => oYELLOW,
          oGREEN => oGREEN
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
		wait for 100ns;
		inRST <= '1';
		
      wait;
   end process;

END;
