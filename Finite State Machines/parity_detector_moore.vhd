library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
entity parity_detector_moore is
port(
		w,clk,res	:in  std_logic;
		p,led			:out std_logic
	);
end entity;

architecture RTL of parity_detector_moore is
type state_type is (A,B0,B1,B2,C0,C1,C2);
signal S : state_type;
begin
process(clk,res)
begin
	if(res='0') then  p <= '0'; S <= A;
	elsif(rising_edge(clk)) then
	case S is
		----------------------------
		when A =>
			p <= '0';
			if(w = '1') then S <= C0;	else S <= B0; end if;
		----------------------------
		when B0 =>
			if(w = '1') then S <= C1;	else S <= B1; end if;
		----------------------------
		when C0 =>
			if(w = '1') then S <= B1;	else S <= C1; end if;
		----------------------------
		when B1 =>
			if(w = '1') then S <= C2;	else S <= B2; end if;
		----------------------------
		when C1 =>
			if(w = '1') then S <= B2;	else S <= C2; end if;
		----------------------------
		when B2 =>
			S <= A;
			p <= '0';
		----------------------------
		when C2 =>
			S <= A;
			p <= '1';
		----------------------------



	end case;
	end if;
end process;
led<=clk;
end RTL;
