entity ffd is
    port(
        clk : in bit;
        d : in bit;
        arst : in bit;
        q : out bit
    );
end;

architecture ffd_arq of ffd is

    -- Parte Declarativa --

begin

    -- Parte Descriptiva --
    process (clk, arst)
    begin
        
        if arst = '1' then
            q <= '0';
        elsif clk'event and clk = '1' then
            q <= d;
        end if;

    end process;

end;