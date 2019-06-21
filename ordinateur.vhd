library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ordinateur is
    Port ( rules : in  STD_LOGIC_VECTOR (5 downto 0);
           rst : in STD_LOGIC;
           clkSys : in  STD_LOGIC;
           clkl1 : in  STD_LOGIC;
           clkl2 : in STD_LOGIC;
           bot1 : out  STD_LOGIC;
           bot2 : out  STD_LOGIC);
end ordinateur;

architecture Behavioral of ordinateur is
signal tmp : std_logic_vector(2 downto 0);
signal clk1, clk2, botTmp1, botTmp2 : std_logic;
begin
  defrules: process(rst)
  begin
    tmp <= rules(2 downto 0);
  end process defrules;

  beg: process(clkSys)
  begin
    if tmp(2)='1' then --bot sur ligne 1
      clk1 <= clkl1;
      bot1 <= bottmp1;
      if tmp(2 downto 1)="10" then --bot sur ligne 2
        clk2 <= clkl2;
        bot2 <= botTmp2;
      else
        clk2 <= '0';
        bot2 <= '0';
      end if;
    else
      clk1 <= '0';
      clk2 <= '0';
      bot1 <= '0';
      bot2 <= '0';
    end if;
  end process beg;
  c1 : entity work.bot1(Behavioral) port map(clk=>clksys,timeSg=>clk1,reset=>rst,botOut=>botTmp1);
  c2 : entity work.bot2(Behavioral) port map(clk=>clksys,timeSg=>clk2,reset=>rst,botOut=>botTmp2);
end Behavioral;
