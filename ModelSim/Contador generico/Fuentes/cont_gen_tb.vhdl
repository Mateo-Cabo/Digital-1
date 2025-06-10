entity cont_gen_tb is
end;

architecture cont_gen_tb_arq of cont_gen_tb is

    -- Parte Declarativa --

    component cont_gen is
        port(
            clk : in bit;
            rst : in bit;
            ena : in bit;
            cout : out bit;
            Q : out bit
        );
    end component;

    signal clk_tb: bit;
    signal rst_tb: bit := '1';
    signal ena_tb: bit := '0';
    signal cout_tb: bit;
    signal Q_tb: bit;

begin
    -- Parte Descriptiva --

	clk_tb    <=  not clk_tb after 10 ns;
	rst_tb    <=  '0' after 80 ns;
	ena_tb    <=  '1' after 50 ns;

	DUT: cont_gen

		port map(
			clk	=> clk_tb,	
		    rst	=> rst_tb,
		    ena	=> ena_tb,
		    cout => cout_tb,
		    Q	=> Q_tb
		);

end;
