----------------------------------------------------------------------------------
-- Company:
-- Engineer:
--
-- Create Date:    15:34:21 05/07/2019
-- Design Name:
-- Module Name:    main1 - Behavioral
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

entity main1 is
    Port ( clk1 : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           valcp1 : in  STD_LOGIC;
           endgame : in  STD_LOGIC;
           start : in  STD_LOGIC;
           clk : in std_logic;
           realstart : in std_logic;
           serv : out std_logic;
           ballstate1 : out  STD_LOGIC_VECTOR (4 downto 0);
           winner1 : out  STD_LOGIC_VECTOR(1 downto 0));
end main1;

architecture archimain1 of main1 is
type etat is (j1sa,j1sb,j1a,j1b,j1c,j1d,j1e,j1f,j1g,j1h,j2sa,j2sb,j2a,j2b,j2c,j2d,j2e,j2f,j2g,j2h);
signal rnd,tempo : std_logic;
signal epres,efut : etat;
begin
  c1 : entity work.modrnd(rand) port map(reset=>start, clk=>clk, rbit_out=>rnd);
  combi : process(epres,clk,valcp1)
  begin
    case epres is
      when j1sa=>
        serv<='1';
        if valcp1='1' then
          efut<=j1d;
        else
          efut<=j1sb;
        end if;
      when j1sb=>
        serv<='1';
        if valcp1='1' then
          efut<=j1d;
        else
          efut<=j1sa;
        end if;
      when j1a=>
        serv<='0';
        if clk1='1' then
          efut<=j1b;
        else
          efut<=epres;
        end if;
      when j1b=>
        serv<='0';
        if clk1='1' then
          efut<=j1c;
        else
          efut<=epres;
        end if;
      when j1c=>
        serv<='0';
        if clk1='1' then
          efut<=j1d;
        else
          efut<=epres;
        end if;
      when j1d=>
        serv<='0';
        if clk1='1' then
          efut<=j1e;
        else
          efut<=epres;
        end if;
      when j1e=>
        serv<='0';
        if valcp1='1' then
          efut<=j1sb;
        else
          efut<=j1f;
        end if;
      when j1f=>
        serv<='0';
        if valcp1='1' then
          efut<=j2b;
        else
          efut<=j1g;
        end if;
      when j1g=>
        serv<='0';
        if valcp1='1' then
          efut<=j2a;
        else
          efut<=j1h;
        end if;
      when j1h=>
        serv<='0';
        if valcp1='1' then
          efut<=j2a;
        else
          efut<=j1sb;
        end if;
      when j2a=>
        serv<='0';
        if clk1='1' then
          efut<=j2b;
        else
          efut<=epres;
        end if;
      when j2b=>
        serv<='0';
        if clk1='1' then
          efut<=j2c;
        else
          efut<=epres;
        end if;
      when j2c=>
        serv<='0';
        if clk1='1' then
          efut<=j2d;
        else
          efut<=epres;
        end if;
      when j2d=>
        serv<='0';
        if clk1='1' then
          efut<=j2e;
        else
          efut<=epres;
        end if;
      when j2e=>
        serv<='0';
        if valcp1='1' then
          efut<=j2sb;
        else
          efut<=j2f;
        end if;
      when j2f=>
        serv<='0';
        if valcp1='1' then
          efut<=j1b;
        else
          efut<=j2g;
        end if;
      when j2g=>
        serv<='0';
        if valcp1='1' then
          efut<=j1a;
        else
          efut<=j2h;
        end if;
      when j2h=>
        serv<='0';
        if valcp1='1' then
          efut<=j1a;
        else
          efut<=j2sb;
        end if;
      when j2sb=>
        serv<='1';
        if valcp1='1' then
          efut<=j2d;
        else
          efut<=j2sa;
        end if;
      when j2sa=>
        serv<='1';
        if valcp1='1' then
          efut<=j2d;
        else
          efut<=j2sb;
        end if;
      when others=>
        efut<=j2sb;
      end case;
    end process combi;

    reg : process(rst,clk,endgame,realstart)
    begin
      if rst='1' then
        tempo<='1';
        if rnd='1' then
          epres<=j1sa;
        else
          epres<=j2sa;
        end if;
      elsif realstart='1' then
        if endgame='1' then
            epres<=j2sb;
        elsif rising_edge(clk) then
          if ((valcp1='1' or clk1='1') and tempo='1') then
            tempo<='0';
            if (epres=j2e and efut=j2sb) or (epres=j2h and efut=j2sb) then
              winner1<="01";
            elsif (epres=j1e and efut=j1sb) or (epres=j1h and efut=j1sb) then
              winner1<="10";
            else
              winner1<="00";
            end if;
            epres<=efut;
          else
            tempo<='1';
          end if;
        end if;
      else
        epres<=epres;
      end if;
    end process reg;

    tmpproc : process(efut)
    begin
      case epres is
        when j1sa=>ballstate1<="00011";
        when j1sb=>ballstate1<="01100";
        when j1a=>ballstate1<="00001";
        when j1b=>ballstate1<="00010";
        when j1c=>ballstate1<="00011";
        when j1d=>ballstate1<="00100";
        when j1e=>ballstate1<="00101";
        when j1f=>ballstate1<="00110";
        when j1g=>ballstate1<="00111";
        when j1h=>ballstate1<="01000";
        when j2sa=>ballstate1<="10100";
        when j2sb=>ballstate1<="11011";
        when j2a=>ballstate1<="10110";
        when j2b=>ballstate1<="10101";
        when j2c=>ballstate1<="10100";
        when j2d=>ballstate1<="10011";
        when j2e=>ballstate1<="10010";
        when j2f=>ballstate1<="10001";
        when j2g=>ballstate1<="10000";
        when others=> ballstate1<="11111";
      end case;
    end process tmpproc;
end archimain1;
