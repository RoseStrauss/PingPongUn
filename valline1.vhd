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

entity valline1 is
    Port ( jg : in  STD_LOGIC;
           jd : in  STD_LOGIC;
           ballstate : in  STD_LOGIC_VECTOR (4 downto 0);
           modvit : in std_logic;
           incrclk : out  STD_LOGIC;
           valcp : out  STD_LOGIC);
end valline1;

architecture Behavioral of valline1 is

signal boup : std_logic_vector(4 downto 0);

begin

calc : process(jg,jd)
  begin
      if modvit='1' then
        case ballstate is
          when "00110" | "00111" | "01000"=>
            valcp<=jd;
            incrclk<=jd;
          when "10001" | "10000" | "11111"=>
            valcp<=jg;
            incrclk<=jg;
          when "01100" | "00101" | "00011"=>
            valcp<=jd;
            incrclk<='0';
          when "10100" | "11011" | "10010"=>
            valcp<=jg;
            incrclk<='0';
          when others=>
            valcp<='0';
            incrclk<='0';
          end case;
        else
          case ballstate is
            
  end process calc;
end Behavioral;
