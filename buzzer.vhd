library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

entity buzzer is
    Port ( clksys : in std_logic;
           valcp1 : in  STD_LOGIC;
           valcp2 : in  STD_LOGIC;
           endgame : in  STD_LOGIC;
           buzzout : out  STD_LOGIC);
end buzzer;

architecture Behavioral of buzzer is
  signal cmp,rate,sound : unsigned(15 downto 0);
  signal mem : std_logic;
  signal ind : unsigned(3 downto 0);
begin
   process(clksys)
   begin
     if rising_edge(clksys) then
       if valcp1='1' or valcp2='1' then
         cmp<="0000000000000000";
         rate<="0001111110111101";
         sound<="0000000000000000";
       elsif endgame='1' and mem='1' then
         mem<='0';
         cmp<="0000000000000000";
         rate<="1111110111101000";
         sound<="0000000001000000";
       elsif endgame='0' then
         mem<='1';
      else
         cmp<="1111111111111111";
      end if;
      if cmp<=rate then
        cmp<=cmp+"0000000000000001";
        ind<=ind+"0001";
        buzzout<=sound(to_integer(ind));
      else
        buzzout<='1';
      end if;
    end if;
  end process;
end Behavioral;
