--------------------------------------------------------------------------------
-- Company:       FTN
-- Engineer:      Mario Perić
--
-- Create Date:   23:55:46 01/10/2017
-- Design Name:   
-- Module Name:   zadatak5 - Test Bench 
-- Project Name:  zadatak5
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: zadatak5
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
 
ENTITY zadatak5_tb IS
END zadatak5_tb;
 
ARCHITECTURE behavior OF zadatak5_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT zadatak5
    PORT(
         iCLK : IN  std_logic;
         inRST : IN  std_logic;
         iDATA : IN  std_logic_vector(15 downto 0);
         oDATA : OUT  std_logic_vector(15 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal iCLK : std_logic := '0';
   signal inRST : std_logic := '0';
   signal iDATA : std_logic_vector(15 downto 0) := (others => '0');

 	--Outputs
   signal oDATA : std_logic_vector(15 downto 0);

   -- Clock period definitions
   constant iCLK_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: zadatak5 PORT MAP (
          iCLK => iCLK,
          inRST => inRST,
          iDATA => iDATA,
          oDATA => oDATA
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
      wait for iCLK_period*10;
		inRST <= '1';
      wait;
   end process;

END;
