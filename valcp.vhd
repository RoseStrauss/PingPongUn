----------------------------------------------------------------------------------
-- Company:
-- Engineer:
--
-- Create Date:    11:15:08 05/15/2019
-- Design Name:
-- Module Name:    valcp - Behavioral
-- Project Name:
-- Target Devices:
-- Tool versions:
-- Description:
--
-- Dependencies:
--
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity valcp is
    Port ( players : in  STD_LOGIC_VECTOR (3 downto 0);
           rules : in  STD_LOGIC_VECTOR (5 downto 0);
           ballstate1 : in  STD_LOGIC_VECTOR (4 downto 0);
           ballstate2 : in  STD_LOGIC_VECTOR (4 downto 0);
           serv1,serv2 : in std_logic;
           endgame : in std_logic;
           valcp1 : out  STD_LOGIC;
           valcp2 : out  STD_LOGIC;
           incrclk1 : out  STD_LOGIC;
           incrclk2 : out  STD_LOGIC);
end valcp;

architecture Behavioral of valcp is
  signal jg1,jd1,jg2,jd2 : std_logic;
  begin
    def : process(rules)
    begin
      if rules(3)='0' then
        jg1<=players(0) or players(1);
        jd1<=players(2) or players(3);
        jg2<='0';
        jd2<='0';
      else
        jg1<=players(0);
        jg2<=players(1);
        jd1<=players(2);
        jd2<=players(3);
      end if;
    end process def;
  c1 : entity work.valline(Behavioral) port map(nope=>endgame,serv=>serv1,jg=>jg1,jd=>jd1,ballstate=>ballstate1,modvit=>rules(5),incrclk=>incrclk1,valcp=>valcp1);
  c2 : entity work.valline(Behavioral) port map(nope=>endgame,serv=>serv2,jg=>jg2,jd=>jd2,ballstate=>ballstate2,modvit=>rules(5),incrclk=>incrclk2,valcp=>valcp2);
end Behavioral;
