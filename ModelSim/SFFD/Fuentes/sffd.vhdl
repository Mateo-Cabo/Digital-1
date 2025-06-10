entity sffd is
    port(
        clk_s : in bit;
        d_s : in bit;
        ena_s : in bit;
        rst_s : in bit;
        q_s : out bit
    );
end;

architecture sffd_arq of sffd is

    -- Parte Declarativa --
    component ffd
        port(
            clk : in bit;
            d : in bit;
            arst : in bit;
            q : out bit
        );
    end component;
    
    component mux2b
        port(
            a : in bit;
            b : in bit;
            c : in bit;
            s : out bit
        );
    end component;

    signal s_mux1 : bit;
    signal s_mux2 : bit;
    signal q_out : bit;

begin

    q_s <= q_out;

    -- Parte Descriptiva --
    mux_uno: mux2b
        port map(
            a => d_s,
            b => q_out,
            c => ena_s,
            s => s_mux1
        );

    mux_dos: mux2b
        port map(
            a => '0',
            b => s_mux1,
            c => rst_s,
            s => s_mux2
        );

    ff0: ffd
        port map(
            clk => clk_s,
            d => s_mux2,
            q => q_out,
            arst => '0'
        );
end;