entity cont_gen is
    port(
        clk : in bit;
        rst : in bit;
        ena : in bit;
        cout : out bit;
        Q : out bit
    );
end;

architecture cont_gen_arq of cont_gen is

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

    signal q_out : bit;

begin

    -- Parte Descriptiva --

    Q <= q_out;
    
    ff0: sffd
        port map(
            clk_s => clk,
            d_s => "not" (q_out),
            ena_s => ena,
            rst_s => rst,
            q_s => q_out
        );

        cout <= (ena and q_out);

end;