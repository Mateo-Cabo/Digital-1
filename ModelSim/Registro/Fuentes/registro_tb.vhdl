entity registro_tb is
end;

architecture registro_tb_arq of registro_tb is

    -- Parte Declarativa --

    component registro is
        generic(
            N: natural := 12
        );
        port(
            clk : in bit;
            rst : in bit;
            ena : in bit;
            D : in bit_vector(N-1 downto 0);
            Q : out bit_vector(N-1 downto 0)
        );
    end component;

    constant N_tb : natural := 12;

    signal clk_tb: bit;
    signal rst_tb: bit := '1';
    signal ena_tb: bit := '0';
    signal D_tb : bit_vector(N_tb-1 downto 0);
    signal Q_tb : bit_vector(N_tb-1 downto 0);

begin
    -- Parte Descriptiva --

	clk_tb    <=  not clk_tb after 10 ns;
	rst_tb    <=  '0' after 80 ns;
	ena_tb    <=  '1' after 50 ns;
    D_tb(0) <= '1' after 100 ns, '0' after 130 ns;
    D_tb(1) <= '1' after 130 ns;
    D_tb(2) <= '1' after 160 ns;
    D_tb(3) <= '1' after 190 ns;

	DUT: registro
        generic map(
            N => N_tb
        )
		port map(
			clk	=> clk_tb,	
		    rst	=> rst_tb,
		    ena	=> ena_tb,
		    D	=> D_tb,
            Q	=> Q_tb
		);
end;
