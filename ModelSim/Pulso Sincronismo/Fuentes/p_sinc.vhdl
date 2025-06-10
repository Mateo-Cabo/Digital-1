entity p_sinc is
    port(
        clk : in bit;
        rst : in bit;
        ena : in bit;
        s : out bit
    );
end;

architecture p_sinc_arq of p_sinc is

    -- Parte Declarativa --

    component contNb is
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
    end component;

    constant N : natural := 4;


    signal aux2:  bit_vector(N-1 downto 0);

begin

    -- Parte Descriptiva --
    cont: contNb

        port map(
            clk => clk,
            rst => rst,
            ena => ena,
            Q_s => aux2
        );

    process(aux2)
        
    begin
        if aux2 = "0010" then
            s <= '1';
        end if;

        if aux2 = "0100" then
            s <= '0';
        end if;

    end process;
end;