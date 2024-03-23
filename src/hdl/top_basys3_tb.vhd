--+----------------------------------------------------------------------------
--| 
--| COPYRIGHT 2017 United States Air Force Academy All rights reserved.
--| 
--| United States Air Force Academy     __  _______ ___    _________ 
--| Dept of Electrical &               / / / / ___//   |  / ____/   |
--| Computer Engineering              / / / /\__ \/ /| | / /_  / /| |
--| 2354 Fairchild Drive Ste 2F6     / /_/ /___/ / ___ |/ __/ / ___ |
--| USAF Academy, CO 80840           \____//____/_/  |_/_/   /_/  |_|
--| 
--| ---------------------------------------------------------------------------
--|
--| FILENAME      : top_basys3_tb.vhd
--| AUTHOR(S)     : Capt Johnson, Alex Kenyon
--| CREATED       : 01/30/2019 Last Modified 06/24/2020
--| DESCRIPTION   : This file implements a test bench for the full adder top level design.
--|
--| DOCUMENTATION : None
--|
--+----------------------------------------------------------------------------
--|
--| REQUIRED FILES :
--|
--|    Libraries : ieee
--|    Packages  : std_logic_1164, numeric_std, unisim
--|    Files     : top_basys3.vhd
--|
--+----------------------------------------------------------------------------
--|
--| NAMING CONVENSIONS :
--|
--|    xb_<port name>           = off-chip bidirectional port ( _pads file )
--|    xi_<port name>           = off-chip input port         ( _pads file )
--|    xo_<port name>           = off-chip output port        ( _pads file )
--|    b_<port name>            = on-chip bidirectional port
--|    i_<port name>            = on-chip input port
--|    o_<port name>            = on-chip output port
--|    c_<signal name>          = combinatorial signal
--|    f_<signal name>          = synchronous signal
--|    ff_<signal name>         = pipeline stage (ff_, fff_, etc.)
--|    <signal name>_n          = active low signal
--|    w_<signal name>          = top level wiring signal
--|    g_<generic name>         = generic
--|    k_<constant name>        = constant
--|    v_<variable name>        = variable
--|    sm_<state machine type>  = state machine type definition
--|    s_<signal name>          = state name
--|
--+----------------------------------------------------------------------------
library ieee;
  use ieee.std_logic_1164.all;
  use ieee.numeric_std.all;

entity top_basys3_tb is
end top_basys3_tb;

architecture test_bench of top_basys3_tb is 
	
  -- declare the component of your top-level design unit under test (UUT)
  component top_basys3 is
      port(
          i_A : in std_logic;
          i_B : in std_logic;
          i_C : in std_logic;
          o_S : out std_logic;
          w_Cout: out std_logic
          -- TODO
      );
  end component;
  
 
	-- declare signals needed to stimulate the UUT inputs
	   signal w_sw : std_logic_vector(2 downto 0);-- TODO
	-- finish declaring needed signals
	   signal w_led : std_logic_vector(1 downto 0);
begin
	-- PORT MAPS ----------------------------------------
	-- You must create the port map for your top_basys3.
	-- Look at your old test benches if you are unsure what to do
	-----------------------------------------------------
	top_basys3_inst : top_basys3 port map (
	   i_A => w_sw(0),
	   i_B => w_sw(1),
	   i_C => w_sw(2),
	   o_S => w_led(1),
	   w_Cout => w_led(0)
	);
	-- PROCESSES ----------------------------------------	
	-- Test Plan Process
	-- Implement the test plan here.  Body of process is continuously from time = 0  
	test_process : process 
	begin
	
	    w_sw <= o"0"; wait for 10 ns;
		assert w_led = "00" report "bad o0" severity failure;
        w_sw <= o"1"; wait for 10 ns;
        assert w_led = "01" report "bad o1" severity failure;
        w_sw <= o"0"; wait for 10 ns;
	    --You must fill in the remaining test cases.	
	
		wait; -- wait forever
	end process;	
	-----------------------------------------------------	
	
end test_bench;
