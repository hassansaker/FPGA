LIBRARY ieee;
USE ieee.std_logic_1164.all;
---------------------------------------
ENTITY basic_element IS
	PORT(	clk,res,a,b	:IN	STD_LOGIC;
			q:	OUT	STD_LOGIC);
END  basic_element;
---------------------------------------
ARCHITECTURE arch OF basic_element IS
	signal s,cout,cin:std_logic;
component d_ff is
		PORT(	clk	:	IN		STD_LOGIC;
			rst	:	IN		STD_LOGIC;
			d		:	IN		STD_LOGIC;
			q		:	OUT	STD_LOGIC);
	
	end component;
	 
component full_adder is
	PORT(	a		:	IN		STD_LOGIC;
		b		:	IN		STD_LOGIC;
		cin	:	IN		STD_LOGIC;
		s		:	OUT	STD_LOGIC;
		cout	:	OUT	STD_LOGIC);
end component;	
	
BEGIN
U1: d_ff port map(clk,res,cout,cin);
U2: d_ff port map(clk,res,s,q);
U3: full_adder port map(a,b,cin,s,cout);


END ARCHITECTURE ;