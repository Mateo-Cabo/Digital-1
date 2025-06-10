entity cont_1 is
    port(
        clk : in bit;
        rst : in bit;
        ena : in bit;
        Q : out bit_vector(11 downto 0)
    );
end;

architecture cont_1_arq of cont_1 is

    -- Parte Declarativa --
    component cont_bcd is
        port(
            clk : in bit;
            rst : in bit;
            ena : in bit;
            Q1 : out bit;
            Q2 : out bit;
            Q3 : out bit;
            Q4 : out bit
        );
    end component;

    signal q_aux1 : bit;
    signal q_aux2 : bit;
    signal q_aux3 : bit;
    signal q_aux4 : bit;

    signal q0_out : bit;
    signal q1_out : bit;
    signal q2_out : bit;
    signal q3_out : bit;

    signal q4_out : bit;
    signal q5_out : bit;
    signal q6_out : bit;
    signal q7_out : bit;

begin

    -- Parte Descriptiva --

    Q(0) <= q0_out;
    Q(1) <= q1_out;
    Q(2) <= q2_out;
    Q(3) <= q4_out;

    Q(4) <= q4_out;
    Q(5) <= q5_out;
    Q(6) <= q6_out;
    Q(7) <= q7_out;

    q_aux1 <= q3_out and q0_out;
    q_aux2 <= q_aux1 and ena;
    q_aux3 <= q7_out and q4_out;
    q_aux4 <= q_aux2 and q_aux3; 

    con1: cont_bcd
        port map(
            clk => clk,
            rst => rst,
            ena => ena,
            Q1 => q3_out,
            Q2 => q2_out,
            Q3 => q1_out,
            Q4 => q0_out 
        );

    cont2: cont_bcd
        port map(
            clk => clk,
            rst => rst,
            ena => q_aux2,
            Q1 => q7_out,
            Q2 => q6_out,
            Q3 => q5_out,
            Q4 => q4_out
        );

    con3: cont_bcd
        port map(
            clk => clk,
            rst => rst,
            ena => q_aux4,
            Q1 => Q(11),
            Q2 => Q(10),
            Q3 => Q(9),
            Q4 => Q(8)
        );
end;