entity cont_bcd_tb is
end;

architecture cont_bcd_tb_arq of cont_bcd_tb is

    -- Parte Declarativa --

    component cont_bcd is
        port(
            clk : in bit;
            rst : in bit;
            ena : in bit;
            Q1 : out bit;
            Q2 : out bit;
            Q3 : out bit;
            Q4 : out bit
        );
    end component;

    signal clk_tb: bit;
    signal rst_tb: bit := '1';
    signal ena_tb: bit := '0';
    signal Q1_tb: bit;
    signal Q2_tb: bit;
    signal Q3_tb: bit;
    signal Q4_tb: bit;

begin
    -- Parte Descriptiva --

	clk_tb    <=  not clk_tb after 10 ns;
	rst_tb    <=  '0' after 80 ns;
	ena_tb    <=  '1' after 50 ns;

	DUT: cont_bcd

		port map(
			clk	=> clk_tb,	
		    rst	=> rst_tb,
		    ena	=> ena_tb,
		    Q1	=> Q1_tb,
		    Q2	=> Q2_tb,
		    Q3	=> Q3_tb,
		    Q4	=> Q4_tb
		);

end;
