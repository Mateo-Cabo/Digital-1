library IEEE;
use IEEE.std_logic_1164.all;

entity sum1b is
	port(
		a_i	: in bit;
		b_i	: in bit;
		ci_i: in bit;
		s_o	: out bit;
		co_o: out bit
	);
end;

architecture sum1b_arq of sum1b is
begin
	s_o <= a_i xor b_i xor ci_i;
	co_o <= (a_i and b_i) or (a_i and ci_i) or (b_i and ci_i);
end;