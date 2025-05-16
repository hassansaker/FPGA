library ieee;
use ieee.std_logic_1164.all;

entity Sequence_Detector is --------- the state machine that is used is moore
port(
		w,clkk,rst :in  std_logic;
		z,led :out std_logic
	);
end entity;
architecture RTL of Sequence_Detector is
type state_type is (Res,A0,A1,B0,B1,C0,C1,D0,D1);
signal S : state_type := Res;
begin
process(clkk,rst)
begin
	if(rst = '0') then S <= Res;
	elsif(rising_edge(clkk)) then
	case S is
		when Res => 	if(w = '0') then S <= A0; else S <= A1; end if;
		when A0  => 	if(w = '0') then S <= B0; else S <= A1; end if;
		when A1  => 	if(w = '0') then S <= A0; else S <= B1; end if;
		when B0  => 	if(w = '0') then S <= C0; else S <= A1; end if;
		when B1  => 	if(w = '0') then S <= A0; else S <= C1; end if;
		when C0  => 	if(w = '0') then S <= D0; else S <= A1; end if;
		when C1  => 	if(w = '0') then S <= A0; else S <= D1; end if;
		when D0  => 	if(w = '0') then S <= A0; else S <= A1; end if;
		when D1  => 	if(w = '0') then S <= A0; else S <= A1; end if;		
	end case;
	end if;
end process;
	z <= '1' when ((S = D0) or (S = D1)) else '0';
	led<=clkk;
end RTL;
