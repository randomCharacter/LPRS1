
----------------------------------------------------------------------------------
-- University of Novi Sad
-- Faculty of Technical Sciences
--
-- Digital Systems Design
-- Lab 01
--
-- Incrementer - TestBench
--
-- Author: Ivan Kastelan
-- ivan.kastelan@rt-rk.com
----------------------------------------------------------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY MySecondDigitalSystem_tb IS
END MySecondDigitalSystem_tb;
 
ARCHITECTURE behavior OF MySecondDigitalSystem_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT MySecondDigitalSystem
    PORT(
         iX2 : IN  std_logic;
         iX1 : IN  std_logic;
         iX0 : IN  std_logic;
         oY2 : OUT  std_logic;
         oY1 : OUT  std_logic;
         oY0 : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal iX2 : std_logic := '0';
   signal iX1 : std_logic := '0';
   signal iX0 : std_logic := '0';

 	--Outputs
   signal oY2 : std_logic;
   signal oY1 : std_logic;
   signal oY0 : std_logic;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: MySecondDigitalSystem PORT MAP (
          iX2 => iX2,
          iX1 => iX1,
          iX0 => iX0,
          oY2 => oY2,
          oY1 => oY1,
          oY0 => oY0
        );

   -- Stimulus process
   stim_proc: process
   begin		
      
		iX2 <= '0';
		iX1 <= '0';
		iX0 <= '0';
		wait for 100 ns;
		
		iX2 <= '0';
		iX1 <= '0';
		iX0 <= '1';
		wait for 100 ns;
		
		iX2 <= '0';
		iX1 <= '1';
		iX0 <= '0';
		wait for 100 ns;
		
		iX2 <= '0';
		iX1 <= '1';
		iX0 <= '1';
		wait for 100 ns;
		
		iX2 <= '1';
		iX1 <= '0';
		iX0 <= '0';
		wait for 100 ns;
		
		iX2 <= '1';
		iX1 <= '0';
		iX0 <= '1';
		wait for 100 ns;
		
		iX2 <= '1';
		iX1 <= '1';
		iX0 <= '0';
		wait for 100 ns;
		
		iX2 <= '1';
		iX1 <= '1';
		iX0 <= '1';
		wait for 100 ns;

      wait;
   end process;

END;
