entity p_sinc_tb is
end;

architecture p_sinc_tb_arq of p_sinc_tb is

    -- Parte Declarativa --

    component p_sinc is
        port(
            clk : in bit;
            rst : in bit;
            ena : in bit;
            s : out bit
        );
    end component;

    signal clk_tb: bit;
    signal rst_tb: bit := '1';
    signal ena_tb: bit  := '0';
    signal s_tb: bit := '0';

begin
    -- Parte Descriptiva --

	clk_tb    <=  not clk_tb after 10 ns;
	rst_tb    <=  '0' after 80 ns;
	ena_tb    <=  '1' after 50 ns;

	DUT: p_sinc
        generic map(
            N => N_tb
        )
		port map(
			clk	=> clk_tb,	
		    rst	=> rst_tb,
		    ena	=> ena_tb,
		    s	=> s_tb
		);

end;
