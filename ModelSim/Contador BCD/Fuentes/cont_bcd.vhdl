entity cont_bcd is
    port(
        clk : in bit;
        rst : in bit;
        ena : in bit;
        Q1 : out bit;
        Q2 : out bit;
        Q3 : out bit;
        Q4 : out bit
    );
end;

architecture cont_bcd_arq of cont_bcd is

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

    signal q1_out : bit;
    signal q2_out : bit;
    signal q3_out : bit;
    signal q4_out : bit;

    signal d1_out : bit;
    signal d2_out : bit;
    signal d3_out : bit;
    signal d4_out : bit;

begin

    -- Parte Descriptiva --

    Q1 <= q1_out;
    Q2 <= q2_out;
    Q3 <= q3_out;
    Q4 <= q4_out;

    d1_out <= (q1_out and (not q3_out) and (not q4_out)) or (q2_out and q3_out and q4_out);
    d2_out <= (q2_out and (not q3_out)) or ((not q4_out) and q2_out) or ((not q2_out) and q3_out and q4_out);
    d3_out <=  ((not q1_out) and (not q3_out) and q4_out) or ((not q4_out) and q3_out);
    d4_out <=  ((not q4_out) and (not q3_out)) or ((not q4_out) and q3_out);
    
    ff1: sffd
        port map(
            clk_s => clk,
            d_s => d1_out,
            ena_s => ena,
            rst_s => rst,
            q_s => q1_out
        );

    ff2: sffd
        port map(
            clk_s => clk,
            d_s => d2_out,
            ena_s => ena,
            rst_s => rst,
            q_s => q2_out
        );

    ff3: sffd
        port map(
            clk_s => clk,
            d_s => d3_out,
            ena_s => ena,
            rst_s => rst,
            q_s => q3_out
        );

    ff4: sffd
        port map(
            clk_s => clk,
            d_s => d4_out,
            ena_s => ena,
            rst_s => rst,
            q_s => q4_out
        );
end;