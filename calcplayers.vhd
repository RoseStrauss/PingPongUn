library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity calcplayers is
    Port ( rules : in  STD_LOGIC_VECTOR (5 downto 0);
           j1 : in  STD_LOGIC;
           j2 : in  STD_LOGIC;
           j3 : in  STD_LOGIC;
           j4 : in  STD_LOGIC;
           bot1 : in  STD_LOGIC;
           bot2 : in  STD_LOGIC;
           players : out  STD_LOGIC_VECTOR (3 downto 0));
end calcplayers;

architecture Behavioral of calcplayers is
begin
  process(j1,j2,j3,j4,bot1,bot2)
  begin
    players <= "0000";
    players(0) <= j1;
    players(1) <= j2;
    if rules(2) = '0' then              -- "xxx0xx"
      players(2) <= j3;
      players(3) <= j4;
    elsif rules(2 downto 1) = "10" then -- "xxx10x"
      players(2) <= bot1;          -- "xxx101"
      if rules(3)='0' then
        players(3) <= '0';
      else
        players(3)<=bot2;
      end if;
    elsif rules(2 downto 1) = "11" then -- "xxx11x"
      players(2) <= j3;
      players(3) <= bot1;
    end if;
  end process;
end Behavioral;
