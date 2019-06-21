library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

entity affscore is
    Port ( winner : in  STD_LOGIC_VECTOR (1 downto 0);
           reset : in  STD_LOGIC;
           clksys : in std_logic;
           score_gauche1 : out  STD_LOGIC_VECTOR (3 downto 0);
           score_droite1 : out  STD_LOGIC_VECTOR (3 downto 0);
           score_gauche2 : out  STD_LOGIC_VECTOR (3 downto 0);
           score_droite2 : out  STD_LOGIC_VECTOR (3 downto 0);
           endgame : out STD_LOGIC);
end affscore;

architecture Behavioral of affscore is
signal memwin : std_logic;
begin

  Points : process(winner, reset)

  variable compteur_gauche : integer;
  variable compteur_droite : integer;
  variable nope : integer;

  begin

    if reset = '1' then
      nope:=0;
      memwin<='1';
      compteur_droite:=0;
      compteur_gauche:=0;
      score_gauche1<="0000"; --0
      score_droite1<="0000"; --0
      score_gauche2<="0000"; --0
      score_droite2<="0000"; --0
      endgame<='0';

    elsif rising_edge(clksys) then
      if winner="00" then
        memwin<='0';
      end if;
      if winner="01" and memwin='0' then
        memwin<='1';
        compteur_droite:=compteur_droite + 1;
      elsif winner="10" and memwin='0' then
        memwin<='1';
        compteur_gauche:=compteur_gauche + 1;
      elsif winner="11" and memwin='0' then
        memwin<='1';
        compteur_droite:=compteur_droite + 1;
        compteur_gauche:=compteur_gauche + 1;
      else
        compteur_droite:=compteur_droite;
        compteur_gauche:=compteur_gauche;
      end if;
      if compteur_gauche=21 and compteur_droite=20 and nope=0 then
        compteur_gauche:=23;
        compteur_droite:=22;
      elsif compteur_droite=21 and compteur_gauche=20 and nope=0 then
        compteur_droite:=23;
        compteur_gauche:=22;
      elsif compteur_gauche=22 and compteur_droite=24 then
        nope:=1;
        compteur_gauche:=20;
        compteur_droite:=21;
      elsif compteur_droite=22 and compteur_gauche=24 then
        nope:=1;
        compteur_gauche:=21;
        compteur_droite:=20;
      elsif compteur_gauche=23 and compteur_droite=23 then
        compteur_gauche:=20;
        compteur_droite:=20;
      elsif compteur_gauche=23 and compteur_droite=24 then
        compteur_gauche:=22;
        compteur_droite:=23;
      elsif compteur_droite=23 and compteur_gauche=24 then
        compteur_gauche:=23;
        compteur_droite:=22;
      else
        compteur_gauche:=compteur_gauche;
        compteur_droite:=compteur_droite;
      end if;
    end if;
    if compteur_gauche=0 then --00
      score_gauche1<="0000"; --0
      score_gauche2<="0000"; --0
    elsif compteur_gauche=1 then
      score_gauche1<="0001";
      score_gauche2<="0000";
    elsif compteur_gauche=2 then
      score_gauche1<="0010";
      score_gauche2<="0000";
    elsif compteur_gauche=3 then
      score_gauche1<="0011";
      score_gauche2<="0000";
    elsif compteur_gauche=4 then
      score_gauche1<="0100";
      score_gauche2<="0000";
    elsif compteur_gauche=5 then
      score_gauche1<="0101";
      score_gauche2<="0000";
    elsif compteur_gauche=6 then
      score_gauche1<="0110";
      score_gauche2<="0000";
    elsif compteur_gauche=7 then
      score_gauche1<="0111";
      score_gauche2<="0000";
    elsif compteur_gauche=8 then
      score_gauche1<="1000";
      score_gauche2<="0000";
    elsif compteur_gauche=9 then
      score_gauche1<="1001";
      score_gauche2<="0000";
    elsif compteur_gauche=10 then
      score_gauche1<="0000";
      score_gauche2<="0001";
    elsif compteur_gauche=11 then
      score_gauche1<="0001";
      score_gauche2<="0001";
    elsif compteur_gauche=12 then
      score_gauche1<="0010";
      score_gauche2<="0001";
    elsif compteur_gauche=13 then
      score_gauche1<="0011";
      score_gauche2<="0001";
    elsif compteur_gauche=14 then
      score_gauche1<="0100";
      score_gauche2<="0001";
    elsif compteur_gauche=15 then
      score_gauche1<="0101";
      score_gauche2<="0001";
    elsif compteur_gauche=16 then
      score_gauche1<="0110";
      score_gauche2<="0001";
    elsif compteur_gauche=17 then
      score_gauche1<="0111";
      score_gauche2<="0001";
    elsif compteur_gauche=18 then
      score_gauche1<="1000";
      score_gauche2<="0001";
    elsif compteur_gauche=19 then
      score_gauche1<="1001";
      score_gauche2<="0001";
    elsif compteur_gauche=20 then
      score_gauche1<="0000";
      score_gauche2<="0010";
    elsif compteur_gauche=21 then --gauche winner
      score_gauche1<="0001"; --1
      score_gauche2<="0010"; --1
      endgame<='1';
    elsif compteur_gauche=22 then
      score_gauche1<="1111";
      score_gauche2<="1111";
    else
      score_gauche1<="1100";
      score_gauche2<="1100";
    end if;

    if compteur_droite=0 then --00
      score_droite1<="0000"; --0
      score_droite2<="0000"; --0
    elsif compteur_droite=1 then
      score_droite1<="0001";
      score_droite2<="0000";
    elsif compteur_droite=2 then
      score_droite1<="0010";
      score_droite2<="0000";
    elsif compteur_droite=3 then
      score_droite1<="0011";
      score_droite2<="0000";
    elsif compteur_droite=4 then
      score_droite1<="0100";
      score_droite2<="0000";
    elsif compteur_droite=5 then
      score_droite1<="0101";
      score_droite2<="0000";
    elsif compteur_droite=6 then
      score_droite1<="0110";
      score_droite2<="0000";
    elsif compteur_droite=7 then
      score_droite1<="0111";
      score_droite2<="0000";
    elsif compteur_droite=8 then
      score_droite1<="1000";
      score_droite2<="0000";
    elsif compteur_droite=9 then
      score_droite1<="1001";
      score_droite2<="0000";
    elsif compteur_droite=10 then
      score_droite1<="0000";
      score_droite2<="0001";
    elsif compteur_droite=11 then
      score_droite1<="0001";
      score_droite2<="0001";
    elsif compteur_droite=12 then
      score_droite1<="0010";
      score_droite2<="0001";
    elsif compteur_droite=13 then
      score_droite1<="0011";
      score_droite2<="0001";
    elsif compteur_droite=14 then
      score_droite1<="0100";
      score_droite2<="0001";
    elsif compteur_droite=15 then
      score_droite1<="0101";
      score_droite2<="0001";
    elsif compteur_droite=16 then
      score_droite1<="0110";
      score_droite2<="0001";
    elsif compteur_droite=17 then
      score_droite1<="0111";
      score_droite2<="0001";
    elsif compteur_droite=18 then
      score_droite1<="1000";
      score_droite2<="0001";
    elsif compteur_droite=19 then
      score_droite1<="1001";
      score_droite2<="0001";
    elsif compteur_droite=20 then
      score_droite1<="0000";
      score_droite2<="0010";
    elsif compteur_droite=21 then
      score_droite1<="0001"; --1
      score_droite2<="0010"; --1
      endgame<='1';
    elsif compteur_droite=22 then
      score_droite1<="1111";
      score_droite2<="1111";
    else
      score_droite1<="1100";
      score_droite2<="1100";
    end if;

  end process;

end Behavioral;
