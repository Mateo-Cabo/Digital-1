library ieee ;
use ieee.std_logic_1164.all;

entity mux2b is
    port(
        a : in bit;
        b : in bit;
        c : in bit;
        s : out bit
    );
end;

architecture mux2b_arq of mux2b is

    -- Parte Declarativa --

begin
    -- Parte Descriptiva --
    process(a, b, c)
    begin

        if c='1' then
            s <= a;
        else 
            s <= b;
        end if;
    
    end process;
end;