entity contNb is
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
end;

architecture contNb_arq of contNb is

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

    signal aux:  bit_vector(N downto 0);

begin

    -- Parte Descriptiva --

    aux(0) <= ena;

    gen : for i in 0 to N-1 generate

        cont: cont_gen

            port map(
                clk => clk,
                rst => rst,
                ena => aux(i),
                cout => aux(i+1),
                Q => Q_s(i)
            );

    end generate;
end;