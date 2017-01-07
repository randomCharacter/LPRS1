
----------------------------------------------------------------------------------
-- University of Novi Sad
-- Faculty of Technical Sciences
--
-- Digital Systems Design
-- Lab 01
--
-- VHDL Gate Level Design - TestBench
--
-- Author: Ivan Kastelan
-- ivan.kastelan@rt-rk.com
----------------------------------------------------------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY MyFirstDigitalSystem_tb IS
END MyFirstDigitalSystem_tb;
 
ARCHITECTURE behavior OF MyFirstDigitalSystem_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT MyFirstDigitalSystem
    PORT(
         iA : IN  std_logic;
         iB : IN  std_logic;
         oY : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal iA : std_logic := '0';
   signal iB : std_logic := '0';

 	--Outputs
   signal oY : std_logic;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: MyFirstDigitalSystem PORT MAP (
          iA => iA,
          iB => iB,
          oY => oY
        );

   -- Stimulus process
   stim_proc: process
   begin		
	
      iA <= '0';
		iB <= '0';
		wait for 100 ns;
	
		iA <= '0';
		iB <= '1';
		wait for 100 ns;
	
		iA <= '1';
		iB <= '0';
		wait for 100 ns;
	
		iA <= '1';
		iB <= '1';

      wait;
   end process;

END;
