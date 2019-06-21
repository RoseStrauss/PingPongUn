----------------------------------------------------------------------------------
-- Company:
-- Engineer:
--
-- Create Date:    10:25:53 04/29/2019
-- Design Name:
-- Module Name:    fuswin - Behavioral
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

entity fuswin is
    Port ( winner1 : in  STD_LOGIC_VECTOR (1 downto 0);
           winner2 : in  STD_LOGIC_VECTOR (1 downto 0);
           rules : in std_logic;
           winner : out  STD_LOGIC_VECTOR (1 downto 0));
end fuswin;

architecture Behavioral of fuswin is
begin
  c2 :process(winner1, winner2)
  begin
      if rules='0' then
        winner(0)<=winner1(0);
        winner(1)<=winner1(1);
      else
        winner(1)<=winner1(1) or winner2(1);
        winner(0)<=winner1(0) or winner2(0);
    end if;
  end process c2;
end Behavioral;
