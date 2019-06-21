----------------------------------------------------------------------------------
-- Company:
-- Engineer:
--
-- Create Date:    18:06:37 05/14/2019
-- Design Name:
-- Module Name:    valline - Behavioral
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

entity valline2 is
    Port ( jg : in  STD_LOGIC;
           jd : in  STD_LOGIC;
           ballstate : in  STD_LOGIC_VECTOR (4 downto 0);
           modvit : in std_logic;
           serv:in std_logic;
           incrclk : out  STD_LOGIC;
           valcp : out  STD_LOGIC);
end valline2;

architecture Behavioral of valline2 is

signal boup : std_logic_vector(4 downto 0);

begin

calc : process(jg,jd,serv)
begin
    if serv='1' then
      boup<="10111";
    end if;
    if ballstate=boup then
      incrclk<='0';
      valcp<='0';
    else
      case ballstate is
        when "00011"=>
          incrclk<='0';
          valcp<=jg and serv;
          if (jg and serv)='1' then
            boup<=ballstate;
          end if;
        when "10100" =>
          incrclk<='0';
          valcp<=(jd and serv);
          if(jd and serv)='1' then
            boup<=ballstate;
          end if;
        when "00101" | "01100"=>
          incrclk<='0';
          valcp<=jg;
          if jg='1' then
            boup<=ballstate;
          end if;
        when "00110" | "01000"=>
          if modvit='1' then
            incrclk<='0';
          else
            incrclk<=jg;
          end if;
          valcp<=jg;
          if jg='1' then
            boup<=ballstate;
          end if;
        when "00111"=>
          valcp<=jg;
          incrclk<=jg;
          if jg='1' then
            boup<=ballstate;
          end if;
        when "10010" | "11011"=>
          incrclk<='0';
          valcp<=jd;
          if jd ='1' then
            boup<=ballstate;
          end if;
        when "10001" | "11111" =>
          if modvit='1' then
            incrclk<='0';
          else
            incrclk<=jd;
          end if;
          valcp<=jd;
          if jd='1' then
            boup<=ballstate;
          end if;
        when "10000"=>
          incrclk<=jd;
          valcp<=jd;
          if jd='1' then
            boup<=ballstate;
          end if;
        when others=>
          valcp<='0';
          incrclk<='0';
          boup<="10111";
        end case;
    end if;
  end process calc;
end Behavioral;
