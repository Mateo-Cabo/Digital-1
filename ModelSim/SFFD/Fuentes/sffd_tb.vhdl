entity sffd_tb is
end;

architecture sffd_tb_arq of sffd_tb is

    -- Parte Declarativa --

    component sffd is
        port(
            clk_s : in bit;
            d_s : in bit;
            ena_s : in bit;
            rst_s : in bit;
            q_s : buffer bit
        );
    end component;

    signal clk_tb: bit := '0';
    signal d_tb: bit := '1';
    signal ena_tb: bit := '0';
    signal rst_tb: bit := '1';
    signal q_tb: bit;

begin
    -- Parte Descriptiva --

    clk_tb    <=  not clk_tb after 10 ns;
    rst_tb    <=  not rst_tb after 20 ns;
	ena_tb    <=  not ena_tb after 40 ns;
	d_tb    <=  not d_tb after 80 ns;


	DUT: sffd

		port map(
			clk_s	=> clk_tb,	
		    d_s	=> d_tb,
		    ena_s	=> ena_tb,
		    rst_s	=> rst_tb,
		    q_s	=> q_tb
		);

end;
