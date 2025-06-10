library IEEE;
use IEEE.std_logic_1164.all;

entity sum1b_tb is
end;

architecture sum1b_tb_arq of sum1b_tb is

	-- Parte declarativa
	component sum1b is
		port(
			a_i	: in bit;
			b_i	: in bit;
			ci_i: in bit;
			s_o	: out bit;
			co_o: out bit
		);
	end component;

	signal a_tb: bit := '0';
	signal b_tb: bit := '0';
	signal ci_tb: bit := '0';
	signal s_tb: bit;
	signal co_tb: bit;
	
begin

	a_tb <= not a_tb after 10 ns;
	b_tb <= not b_tb after 20 ns;
	ci_tb <= not ci_tb after 40 ns;

	DUT: sum1b
		port map(
			a_i		=> a_tb,	
		    b_i		=> b_tb,
		    ci_i	=> ci_tb,
		    s_o		=> s_tb,
		    co_o	=> co_tb
		);


end;