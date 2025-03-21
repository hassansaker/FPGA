LIBRARY ieee;
USE ieee.std_logic_1164.all;
---------------------------------------
ENTITY d_ff IS
	PORT(	clk	:	IN		STD_LOGIC;
			rst	:	IN		STD_LOGIC;
			d		:	IN		STD_LOGIC;
			q		:	OUT	STD_LOGIC);
END  d_ff;
---------------------------------------
ARCHITECTURE arch OF d_ff IS
BEGIN
	PROCESS (clk, rst)
	BEGIN
		IF (rst='0') THEN 
			q	<=	'0';
		ELSIF (rising_edge(clk)) THEN 
			q	<=	d;
		END IF;
	END PROCESS;
END ARCHITECTURE ;