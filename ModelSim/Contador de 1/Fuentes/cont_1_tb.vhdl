entity cont_1_tb is
end;

architecture cont_1_tb_arq of cont_1_tb is

    -- Parte Declarativa --
    
    component cont_1 is
        port(
            clk : in bit;
            rst : in bit;
            ena : in bit;
            Q : out bit_vector(11 downto 0)
        );
    end component;

    signal clk_tb: bit;
    signal rst_tb: bit := '1';
    signal ena_tb: bit := '0';
    signal Q_tb: bit_vector(11 downto 0);

begin
    -- Parte Descriptiva --

	clk_tb    <=  not clk_tb after 10 ns;
	rst_tb    <=  '0' after 80 ns;
	ena_tb    <=  '1' after 50 ns;

	DUT: cont_1

		port map(
			clk	=> clk_tb,	
		    rst	=> rst_tb,
		    ena	=> ena_tb,
		    Q	=> Q_tb
		);

end;
