----------------------------------------------------------------------------------
-- Company:
-- Engineer:
--
-- Create Date:    17:54:05 05/14/2019
-- Design Name:
-- Module Name:    affball - Behavioral
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

entity affball is
    Port ( rules : in  STD_LOGIC_VECTOR (5 downto 0);
           ballstate1 : in  STD_LOGIC_VECTOR (4 downto 0);
           ballstate2 : in  STD_LOGIC_VECTOR (4 downto 0);
           affline1 : out  STD_LOGIC_VECTOR (7 downto 0);
           affline2 : out  STD_LOGIC_VECTOR (7 downto 0));
end affball;

architecture Behavioral of affball is
  signal tmpout1 : STD_LOGIC_VECTOR(7 downto 0);
  signal tmpout2 : STD_LOGIC_VECTOR(7 downto 0);
begin
  l1 : entity work.affball1(Behavioral) port map(ballstate => ballstate1, affline => tmpout1);
  l2 : entity work.affball2(Behavioral) port map(ballstate => ballstate2, affline => tmpout2);
  process(tmpout1, tmpout2)
  begin
    if rules(3)='0' then
      --une ligne, ballstate1 sur affline1 et 2
      affline1 <= tmpout1;
      affline2 <= tmpout1;
    elsif rules(3)='1' then
      --deux lignes, ballstate1 sur affline1, ballstate2 sur affline2
      affline1 <= tmpout1;
      affline2 <= tmpout2;
    end if;
  end process;

end Behavioral;
