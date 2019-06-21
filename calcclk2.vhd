----------------------------------------------------------------------------------
-- Company:
-- Engineer:
--
-- Create Date:    13:17:21 05/21/2019
-- Design Name:
-- Module Name:    calcClk - Behavioral
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
use IEEE.numeric_std.all;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity calcClk2 is
    Port ( rst : in  STD_LOGIC;
           rules : in  STD_LOGIC_VECTOR (5 downto 0);
           winner : in  STD_LOGIC_VECTOR (1 downto 0);
           incrclk : in  STD_LOGIC;
           clksys : in std_logic;
           modifclk : out  STD_LOGIC_VECTOR (3 downto 0));
end calcClk2;

architecture Behavioral of calcClk2 is
  signal comp : unsigned (2 downto 0);
  signal tmp : unsigned(3 downto 0);
  begin
    calcnext : process(rst,winner,incrclk,clksys)
    begin
      if(rst='1' or winner(0)='1' or winner(1)='1') then
        if rules(4)='0' then
          tmp<="0000";
          comp<="000";
        else
          tmp<="0010";
          comp<="000";
        end if;
      elsif rising_edge(clksys) then
        if incrclk='1' and tmp<"1011" then
          if rules(5)='1' then
            comp<=comp+"001";
            if std_logic_vector(comp)="101" then
              comp<="000";
              tmp<=tmp+"0001";
            end if;
          else
            tmp<=tmp+"0001";
          end if;
        end if;
      end if;
      modifclk<=std_logic_vector(tmp);
    end process;

end Behavioral;
