entity neg is
    port(
        a: in bit;
        b: out bit
    );
end;

architecture neg_arq of neg is

begin
    b <= not a;
end;