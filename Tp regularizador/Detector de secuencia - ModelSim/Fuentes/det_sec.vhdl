entity det_sec is
    port(
        E : in bit;
        clk : in bit;
        output : out bit
    );
end;

architecture det_sec_arq of det_sec is

    -- Parte Declarativa --
    component ffd
        port(
            clk : in bit;
            d : in bit;
            arst : in bit;
            q : out bit
        );
    end component;

    signal aux1 : bit;
    signal aux2 : bit;
    signal aux3 : bit;
    signal aux4 : bit;
    signal aux5 : bit;
    signal aux6 : bit;

    signal q_out1 : bit;
    signal q_out2 : bit;


begin

    aux1 <= (not q_out1) and q_out2;
    aux2 <= (not E) and (not q_out1) and q_out2;
    aux3 <= (not E) and (not q_out2) and q_out1;
    aux4 <= E or aux1;
    aux5 <= aux2 or aux3;
    aux6 <= q_out1 and q_out2;

    -- Parte Descriptiva --

    ff0: ffd
        port map(
            clk => clk,
            d => aux4,
            q => q_out1,
            arst => '0'
        );

    ff1: ffd
        port map(
            clk => clk,
            d => aux5,
            q => q_out2,
            arst => '0'
        );

    output <= aux6;
end;