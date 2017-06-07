--------------------------------------------------------------------------------
-- Company:       FTN
-- Engineer:      Mario Perić
--
-- Create Date:   12:24:55 11/08/2016
-- Design Name:   
-- Module Name:   lab2 - Test Bench
-- Project Name:  lab2
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
 
ENTITY zadatak1_tb IS
END zadatak1_tb;
 
ARCHITECTURE behavior OF zadatak1_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT zadatak1
    PORT(
         iA : IN  std_logic;
         iB : IN  std_logic;
         iC : IN  std_logic;
         iD : IN  std_logic;
         oY : OUT  std_logic;
         isel : IN  std_logic_vector (1 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal iA : std_logic := '0';
   signal iB : std_logic := '0';
   signal iC : std_logic := '0';
   signal iD : std_logic := '0';
   signal isel : std_logic_vector (1 downto 0) := "00";

 	--Outputs
   signal oY : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 

 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: zadatak1 PORT MAP (
          iA => iA,
          iB => iB,
          iC => iC,
          iD => iD,
          oY => oY,
          isel => isel
        );

 

   -- Stimulus process
   stim_proc: process
   begin		
    iA <= '1';
		iB <= '0';
		iC <= '1';
		iD <= '1';
		
		isel <= "00";
    wait for 100 ns;	
		
		isel <= "01";
		wait for 100 ns;
		
		isel <= "10";
		wait for 100 ns;
		
		isel <= "11";
		wait for 100 ns;

     
   end process;

END;
