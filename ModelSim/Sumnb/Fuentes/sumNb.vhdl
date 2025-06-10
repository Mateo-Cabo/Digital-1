entity sumNb is
    generic(
        N: natural := 5
    );
    port(
        a : in bit_vector(N-1 downto 0);
        b : in bit_vector(N-1 downto 0);
        ci : in bit;
        s : out bit_vector(N-1 downto 0);
        co : out bit
    );
end;

architecture sumNb_arq of sumNb is

    -- Parte Declarativa --

    component sum1b is
        port(
            a_i: in bit;
            b_i: in bit;
            ci_i: in bit;
            s_o: out bit;
            co_o: out bit
        );
    end component;

    signal aux:  bit_vector(N downto 0);

begin

    -- Parte Descriptiva --

    aux(0) <= ci;
    co <= aux(N);

    sum_gen : for i in 0 to N-1 generate

        sumNb_inst: sum1b

            port map(
                a_i => a(i),
                b_i => b(i),
                ci_i => aux(i),
                s_o => s(i),
                co_o => aux(i+1)
            );

    end generate;
end;