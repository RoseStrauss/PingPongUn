library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity bot2 is
    Port ( clk : in std_logic;
           timeSg : in STD_LOGIC;
           reset : in STD_LOGIC;
           botOut : out  STD_LOGIC);
end bot2;

architecture Behavioral of bot2 is
  signal temp: std_logic_vector(6 downto 0);
  signal cmp : unsigned(9 downto 0);
begin
  process(reset, timeSg)
  begin
    if reset='1' then
      cmp<="0000000000";
      temp <= "1111111";
    elsif rising_edge(clk) then
      if timesg='1' then
        cmp<="0000000000";
      end if;
      if cmp<="1111111110" then
        cmp<=cmp+"0000000001";
      end if;
      if(cmp="1111111110") then
        temp(1) <= temp(0);
        temp(2) <= temp(1);
        temp(3) <= temp(2);
        temp(4) <= temp(3);
        temp(5) <= temp(4);
        temp(6) <= temp(5);
        temp(0) <= not temp(6);
      else
        temp(1) <= temp(1);
        temp(2) <= temp(2);
        temp(3) <= temp(3);
        temp(4) <= temp(4);
        temp(5) <= temp(5);
        temp(6) <= temp(6);
        temp(0) <= temp(0);
      end if;
    end if;
    botOut <= (temp(0) and not(temp(2)))
           or (temp(0) and temp(6))
           or (not(temp(2)) and temp(4))
           or (not(temp(5)) and temp(6));
  end process;
end Behavioral;
