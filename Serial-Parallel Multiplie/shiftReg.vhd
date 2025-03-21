LIBRARY IEEE;
USE ieee.std_logic_1164.all;
-------------------------------------
ENTITY shiftReg IS

	PORT(	clk	:	IN	STD_LOGIC;
			rst	:	IN	STD_LOGIC;
			d 	:	IN	STD_LOGIC;
			q_reg: 	OUT	STD_LOGIC_VECTOR(7 DOWNTO 0));
END ENTITY;
-------------------------------------
ARCHITECTURE arch OF shiftReg IS
	SIGNAL	buffer_s:STD_LOGIC_VECTOR(7 DOWNTO 0);
BEGIN
	PROCESS (clk, rst)
	BEGIN
		IF (rst = '0') THEN
			buffer_s <= (OTHERS => '0');
		ELSIF rising_edge(clk) THEN
			buffer_s(6 downto 0) <= buffer_s(7 DOWNTO 1);
			buffer_s(7)<=d;
		END IF;
	END PROCESS;
	q_reg <= buffer_s;	
END ARCHITECTURE;