----------------------------------------------------------------------------------
-- Company:
-- Engineer:
--
-- Create Date:    15:22:35 06/07/2019
-- Design Name:
-- Module Name:    TOP - Behavioral
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

entity TOP is
  port( j1,j2,j3,j4,inclk,inreset,instart : in std_logic;
        inmode,indif : in std_logic_vector(2 downto 0);
        outscoregu,outscoregd,outscoredu,outscoredd : out std_logic_vector(3 downto 0);
        outlin1,outlin2 : out std_logic_vector(7 downto 0);
        outbuz : out std_logic);
end TOP;

architecture Behavioral of TOP is
  signal rulestmp : std_logic_vector(5 downto 0);
  signal ballstate1tmp,ballstate2tmp : std_logic_vector(4 downto 0);
  signal playerstmp,modclk1tmp,modclk2tmp : std_logic_vector(3 downto 0);
  signal winner1tmp,winner2tmp,wintottmp : std_logic_vector(1 downto 0);
  signal bot1tmp,bot2tmp,valcp1tmp,valcp2tmp,incrclk1tmp,incrclk2tmp,clk1tmp,clk2tmp,serv1tmp,serv2tmp,realstarttmp,endgametmp : std_logic;
begin
  c1 : entity work.main1(archimain1) port map(clk1=>clk1tmp,rst=>inreset,valcp1=>valcp1tmp,endgame=>endgametmp,start=>instart,clk=>inclk,realstart=>realstarttmp,winner1=>winner1tmp,ballstate1=>ballstate1tmp,serv=>serv1tmp);
  c2 : entity work.main1(archimain1) port map(clk1=>clk2tmp,rst=>inreset,valcp1=>valcp2tmp,endgame=>endgametmp,start=>instart,clk=>inclk,realstart=>realstarttmp,winner1=>winner2tmp,ballstate1=>ballstate2tmp,serv=>serv2tmp);
  c3 : entity work.affball(Behavioral) port map(rules=>rulestmp,ballstate1=>ballstate1tmp,ballstate2=>ballstate2tmp,affline1=>outlin1,affline2=>outlin2);
  c4 : entity work.calcplayers(Behavioral) port map(rules=>rulestmp,j1=>j1,j2=>j2,j3=>j3,j4=>j4,bot1=>bot1tmp,bot2=>bot2tmp,players=>playerstmp);
  c5 : entity work.ordinateur(Behavioral) port map(rules=>rulestmp,rst=>inreset,clksys=>inclk,clkl1=>clk1tmp,clkl2=>clk2tmp,bot1=>bot1tmp,bot2=>bot2tmp);
  c6 : entity work.buzzer(Behavioral) port map(clksys=>inclk,valcp1=>valcp1tmp,valcp2=>valcp2tmp,endgame=>endgametmp,buzzout=>outbuz);
  c7 : entity work.valcp(Behavioral) port map(endgame=>endgametmp,serv1=>serv1tmp,serv2=>serv2tmp,players=>playerstmp,rules=>rulestmp,ballstate1=>ballstate1tmp,ballstate2=>ballstate2tmp,valcp1=>valcp1tmp,valcp2=>valcp2tmp,incrclk1=>incrclk1tmp,incrclk2=>incrclk2tmp);
  c8 : entity work.calcclk1(Behavioral) port map(rst=>inreset,rules=>rulestmp,winner=>winner1tmp,incrclk=>incrclk1tmp,clksys=>inclk,modifclk=>modclk1tmp);
  c9 : entity work.calcclk2(Behavioral) port map(rst=>inreset,rules=>rulestmp,winner=>winner2tmp,incrclk=>incrclk2tmp,clksys=>inclk,modifclk=>modclk2tmp);
  c10 : entity work.clkline(Behavioral) port map(clksys=>inclk,rst=>inreset,valcpline=>valcp1tmp,modclk=>modclk1tmp,clkout=>clk1tmp);
  c11 : entity work.clkline(Behavioral) port map(clksys=>inclk,rst=>inreset,valcpline=>valcp2tmp,modclk=>modclk2tmp,clkout=>clk2tmp);
  c12 : entity work.fuswin(Behavioral) port map(winner1=>winner1tmp,winner2=>winner2tmp,rules=>rulestmp(3),winner=>wintottmp);
  c13 : entity work.rules(Behavioral) port map(modes=>inmode,difficulty=>indif,start=>instart,reset=>inreset,rules=>rulestmp,realstart=>realstarttmp);
  c14 : entity work.affscore(Behavioral) port map(clksys=>inclk,winner=>wintottmp,reset=>inreset,score_gauche1=>outscoregu,score_gauche2=>outscoregd,score_droite1=>outscoredu,score_droite2=>outscoredd,endgame=>endgametmp);
end Behavioral;
