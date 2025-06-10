entity ffd_tb is
end;

architecture ffd_tb_arq of ffd_tb is

    -- Parte Declarativa --

    component ffd is
        port(
            clk : in bit;
            d : in bit;
            arst : in bit;
            q : out bit
        );
    end component;

    signal clk_tb : bit := '0';
    signal d_tb: bit := '1';
    signal arst_tb: bit := '1';
    signal q_tb: bit;

begin
    -- Parte Descriptiva --

    arst_tb    <=  '0' after 80 ns;
    d_tb    <=  '0' after 110 ns, '1' after 210 ns;

	clk_tb    <=  not clk_tb after 50 ns;

	DUT: ffd
    
		port map(
			clk	=> clk_tb,	
		    d	=> d_tb,
		    arst	=> arst_tb,
		    q	=> q_tb
		);

end;
