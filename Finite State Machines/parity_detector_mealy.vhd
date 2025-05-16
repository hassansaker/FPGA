library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
entity parity_detector_mealy is
port(
		w,clk,res	:in  std_logic;
		p,led		:out std_logic
	);
end entity;

architecture RTL of parity_detector_mealy is
signal reg 	:std_logic_vector(3 downto 0);
type state_type is (A,B0,B1,B2,C0,C1,C2);
signal S : state_type;
begin
process(clk,res)
begin
	if(res='0') then reg <= "0000"; p <= '0'; S <= A;
	elsif(rising_edge(clk)) then
	 case S is
		----------------------------
		when A =>
			p <= '0';
			reg(0) <= w;
			if(w = '1') then S <= C0; 	else S <= B0; end if;
		----------------------------
		when B0 =>
			reg(1) <= w;
			if(w = '1') then S <= C1; 	else S <= B1; end if;
		----------------------------
		when C0 =>
			reg(1) <= w;
			if(w = '1') then S <= B1; 	else S <= C1; end if;
		----------------------------
		when B1 =>
			reg(2) <= w;
			if(w = '1') then S <= C2; 	else S <= B2; end if;
		----------------------------
		when C1 =>
			reg(2) <= w;
			if(w = '1') then S <= B2;	else S <= C2; end if;
		----------------------------
		when B2 =>
			reg(3) <= w;
			S <= A;
		----------------------------
		when C2 =>
			reg(3) <= w;
			S <= A;
		----------------------------


	  end case;
	end if;

	if(S = B2)  then if((w = '1')) then p <= '1'; else p <= '0'; end if; end if;
	if(S = C2)  then if((w = '1')) then p <= '0'; else p <= '1'; end if; end if;
end process;

led<=clk;
end RTL;
