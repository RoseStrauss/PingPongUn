library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity rules is
    Port ( modes : in  STD_LOGIC_VECTOR (2 downto 0);
           difficulty : in  STD_LOGIC_VECTOR (2 downto 0);
           start : in  STD_LOGIC;
           reset : in STD_LOGIC;
           rules : out  STD_LOGIC_VECTOR (5 downto 0);
           realStart : out STD_LOGIC );
end rules;

architecture Behavioral of rules is

signal temp : STD_LOGIC_VECTOR(2 downto 0);
signal tempRules : STD_LOGIC_VECTOR(5 downto 0);

begin

    CalcStart : process(start, reset)
    begin
      if(reset='1') then
        temp<="000";
      elsif(start='1') then
        temp(2)<=temp(1);
        temp(1)<=temp(0);
        temp(0)<='1';
      end if;

    end process;

    ModeProcess : process(start)
    begin
      if(temp="001") then
        if modes="000"or modes="111" then -- si la position 111 existe sur le sélecteur
          tempRules(0)<='0';
          tempRules(1)<='0';
          tempRules(2)<='0';
          --1v1
        elsif modes="001" then
          tempRules(0)<='1';
          tempRules(1)<='0';
          tempRules(2)<='0';
          --1v2
        elsif modes="010" then
          tempRules(0)<='0';
          tempRules(1)<='1';
          tempRules(2)<='0';
          --2v2
        elsif modes="011" then
          tempRules(0)<='1';
          tempRules(1)<='1';
          tempRules(2)<='1';
          --2 v ordi+1
        elsif modes="100" then
          tempRules(0)<='0';
          tempRules(1)<='1';
          tempRules(2)<='1';
          --1 v ordi+1
        elsif modes="101" then
          tempRules(0)<='1';
          tempRules(1)<='0';
          tempRules(2)<='1';
          --2 v ordi
        elsif modes="110" then
          tempRules(0)<='0';
          tempRules(1)<='0';
          tempRules(2)<='1';
          -- 1 v ordi
        end if;
      end if;
        --seuls les bits 5,4,3 sont changés

    end process ModeProcess;

    DifficultyProcess : process(start)
    begin
      if(temp="011") then
        if ((difficulty="000") or (difficulty="111") or (difficulty="011")) then -- si la position 111 et 011 existe sur le sélecteur
          tempRules(3)<='0';
          tempRules(4)<='0';
          tempRules(5)<='0';
          --facile parfait
        elsif difficulty="001" then
          tempRules(3)<='1';
          tempRules(4)<='0';
          tempRules(5)<='0';
          --moyen parfait
        elsif difficulty="010" then
          tempRules(3)<='1';
          tempRules(4)<='1';
          tempRules(5)<='0';
          --difficile parfait
        elsif difficulty="100" then
          tempRules(3)<='1';
          tempRules(4)<='1';
          tempRules(5)<='1';
          --difficile temp
        elsif difficulty="101" then
          tempRules(3)<='1';
          tempRules(4)<='0';
          tempRules(5)<='1';
          --moyen temp
        elsif difficulty="110" then
          tempRules(3)<='0';
          tempRules(4)<='0';
          tempRules(5)<='1';
          --facile temp
        end if;
      end if;
      --seuls les bits 5,4,3 sont changés

    end process DifficultyProcess;

    CheckTemp: process(temp)
    begin
      if temp="000" then
        realstart<='0';
        rules<="000000";
      elsif(temp="111") then
        realStart <= temp(2);
        rules <= tempRules;
      end if;
    end process;

end Behavioral;
