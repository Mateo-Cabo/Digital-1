entity neg_tb is
end;

architecture neg_tb_arq of neg_tb is
    component neg is
        port(
            a: in bit;
            b: out bit
        );
        end component;

        signal a_tb : bit : = '0';
        signal b_tb : bit;

    begin
        a_tb <= '1' after 100ns, '0' after 150ns, '1' 300ns;

        