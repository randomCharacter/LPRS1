--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   13:39:39 11/08/2016
-- Design Name:   
-- Module Name:   lab3Dodatni - Test Bench 
-- Project Name:  lab3Dodatni
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: lab3Dodatni
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
 
ENTITY lab3Dodatni_tb IS
END lab3Dodatni_tb;
 
ARCHITECTURE behavior OF lab3Dodatni_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT lab3Dodatni
    PORT(
         iA : IN  std_logic_vector(7 downto 0);
         iB : IN  std_logic_vector(2 downto 0);
         iSEL : IN  std_logic_vector(1 downto 0);
         oY : OUT  std_logic_vector(3 downto 0);
         oZERO : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal iA : std_logic_vector(7 downto 0) := (others => '0');
   signal iB : std_logic_vector(2 downto 0) := (others => '0');
   signal iSEL : std_logic_vector(1 downto 0) := (others => '0');

 	--Outputs
   signal oY : std_logic_vector(3 downto 0);
   signal oZERO : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 

 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: lab3Dodatni PORT MAP (
          iA => iA,
          iB => iB,
          iSEL => iSEL,
          oY => oY,
          oZERO => oZERO
        );


 

   -- Stimulus process
   stim_proc: process
   begin		   
		
		  iA <= "01010101";
		  iB <= "010";
		  iSel <= "00";
		  wait for 100 ns;
		  iSel <= "01";
		  wait for 100 ns;	
		  iSel <= "10";
		  wait for 100 ns;	
		  iSel <= "11";
		  wait for 100 ns;		

      wait;
   end process;

END;
