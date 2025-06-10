entity contNb_tb is
end;

architecture contNb_tb_arq of contNb_tb is

    -- Parte Declarativa --

    component contNb is
        generic(
            N: natural := 4
        );
        port(
            clk : in bit;
            rst : in bit;
            ena : in bit;
            cout : out bit;
            Q_s : out bit_vector(N-1 downto 0)
        );
    end component;

    constant N_tb : natural := 4;

    signal clk_tb: bit;
    signal rst_tb: bit := '1';
    signal ena_tb: bit  := '0';
    signal cout_tb: bit;
    signal Q_s_tb: bit_vector(N_tb-1 downto 0);

begin
    -- Parte Descriptiva --

	clk_tb    <=  not clk_tb after 10 ns;
	rst_tb    <=  '0' after 80 ns;
	ena_tb    <=  '1' after 50 ns;

	DUT: contNb
        generic map(
            N => N_tb
        )
		port map(
			clk	=> clk_tb,	
		    rst	=> rst_tb,
		    ena	=> ena_tb,
		    cout => cout_tb,
		    Q_s	=> Q_s_tb
		);

end;
