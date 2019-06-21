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

entity valline is
    Port ( jg : in  STD_LOGIC;
           jd : in  STD_LOGIC;
           serv : in std_logic;
           ballstate : in  STD_LOGIC_VECTOR (4 downto 0);
           modvit : in std_logic;
           nope : in std_logic;
           incrclk : out  STD_LOGIC;
           valcp : out  STD_LOGIC);
end valline;

architecture Behavioral of valline is

signal boup : std_logic_vector(4 downto 0);

begin

calc : process(jg,jd)
  begin
      if nope='1' then
        valcp<='0';
        incrclk<='0';
      elsif modvit='1' then
        case ballstate is
          when "00110"|"00111"|"01000"=>
            valcp<=jd;
            incrclk<=jd;
          when "10001"|"10000"|"11111"=>
            valcp<=jg;
            incrclk<=jg;
          when "00101"|"11011"=>
            valcp<=jd;
            incrclk<='0';
          when "10010"|"01100"=>
            valcp<=jg;
            incrclk<='0';
          when "10100"=>
            if serv='1' then
              valcp<=jd;
            else
              valcp<='0';
            end if;
            incrclk<='0';
          when "00011"=>
            if serv='1' then
              valcp<=jg;
            else
              valcp<='0';
            end if;
            incrclk<='0';
          when others=>
            valcp<='0';
            incrclk<='0';
          end case;
        else
          case ballstate is
            when "00111"=>
              valcp<=jd;
              incrclk<=jd;
            when "10000"=>
              valcp<=jg;
              incrclk<=jg;
            when "00101"|"11011"|"00110"|"01000"=>
              valcp<=jd;
              incrclk<='0';
            when "10010"|"01100"|"10001"|"11111"=>
              valcp<=jg;
              incrclk<='0';
            when "00011"=>
              if serv='1' then
                valcp<=jg;
              else
                valcp<='0';
              end if;
              incrclk<='0';
            when "10100"=>
              if serv='1' then
                valcp<=jd;
              else
                valcp<='0';
              end if;
              incrclk<='0';
            when others=>
              valcp<='0';
              incrclk<='0';
            end case;
          end if;
  end process calc;
end Behavioral;
