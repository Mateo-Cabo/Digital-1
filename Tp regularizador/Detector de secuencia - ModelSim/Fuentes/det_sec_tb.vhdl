entity det_sec_tb is
end;

architecture det_sec_tb_arq of det_sec_tb is

    -- Parte Declarativa --

    component det_sec is
        port(
            E : in bit;
            clk : in bit;
            output : out bit
        );
    end component;

    signal clk_tb: bit := '1';
    signal E_tb: bit := '0';
    signal output_tb: bit;

begin
    -- Parte Descriptiva --

    clk_tb    <=  not clk_tb after 5 ns;
	E_tb    <=  '1' after 15 ns, '0' after 36 ns, '1' after 75 ns, '0' after 85 ns, '1' after 95 ns, '0' after 105 ns;

	DUT: det_sec

		port map(
			clk	=> clk_tb,	
		    E => E_tb,
		    output	=> output_tb
		);

end;
