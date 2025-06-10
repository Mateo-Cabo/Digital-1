entity sumNb_tb is
end;

architecture sumNb_tb_arq of sumNb_tb is

    -- Parte Declarativa --

    component sumNb is
        generic(
            N: natural := 4
        );
        port(
            a : in bit_vector(N-1 downto 0);
            b : in bit_vector(N-1 downto 0);
            ci : in bit;
            s : out bit_vector(N-1 downto 0);
            co : out bit
        );
    end component;

    constant N_tb : natural := 5;

    signal a_tb: bit_vector(N_tb-1 downto 0) := (N_tb-1 downto 0 => '0');
    signal b_tb: bit_vector(N_tb-1 downto 0) := "00110";
    signal ci_tb: bit := '0';
    signal s_tb: bit_vector(N_tb-1 downto 0);
    signal co_tb: bit;

begin
    -- Parte Descriptiva --

    a_tb    <=  "01000" after 100 ns, "00111" after 300 ns;
	b_tb    <=  "11100" after 500 ns;
	ci_tb   <=    '1' after 700 ns;

	DUT: sumNb
        generic map(
            N => N_tb
        )
		port map(
			a	=> a_tb,	
		    b	=> b_tb,
		    ci	=> ci_tb,
		    s	=> s_tb,
		    co	=> co_tb
		);

end;
