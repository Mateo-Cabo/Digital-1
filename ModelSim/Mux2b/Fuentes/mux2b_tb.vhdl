entity mux2b_tb is
end;

architecture mux2b_tb_arq of mux2b_tb is

    -- Parte Declarativa --

    component mux2b is
        port(
            a : in bit;
            b : in bit;
            c : in bit;
            s : out bit
        );
    end component;

    signal a_tb: bit := '0';
	signal b_tb: bit := '1';
	signal c_tb: bit := '0';
	signal s_tb: bit;

begin
    -- Parte Descriptiva --

	c_tb   <=  '1' after 10 ns;

	DUT: mux2b
		port map(
			a	=> a_tb,	
		    b	=> b_tb,
		    c	=> c_tb,
		    s	=> s_tb
		);
end;
