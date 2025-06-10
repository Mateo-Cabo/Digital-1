entity registro is
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
end;

architecture registro_arq of registro is

    -- Parte Declarativa --
    component sffd is
        port(
            clk_s : in bit;
            d_s : in bit;
            ena_s : in bit;
            rst_s : in bit;
            q_s : out bit
        );
    end component;

begin

    -- Parte Descriptiva --
    gen : for i in 0 to N-1 generate
        
        reg: sffd

            port map(
                clk_s => clk,
                d_s => D(i),
                ena_s => ena,
                rst_s => rst,
                q_s => Q(i)
            );

    end generate;
end;