library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity bot1 is
    Port ( timeSg : in STD_LOGIC;
           reset : in STD_LOGIC;
           botOut : out  STD_LOGIC);
end bot1;

architecture Behavioral of bot1 is
  signal temp: std_logic_vector(6 downto 0);
begin
  process(reset, timeSg)
  begin
    if reset='1' then
      temp <= "0000000";
    elsif timeSg='1' then
      temp(1) <= temp(0);
      temp(2) <= temp(1);
      temp(3) <= temp(2);
      temp(4) <= temp(3);
      temp(5) <= temp(4);
      temp(6) <= temp(5);
      temp(0) <= not temp(6);
    end if;
    botOut <= (temp(0) and not(temp(2)))
           or (temp(0) and temp(6))
           or (not(temp(2)) and temp(4))
           or (not(temp(5)) and temp(6));
  end process;
end Behavioral;
