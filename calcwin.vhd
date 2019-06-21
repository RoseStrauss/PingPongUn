----------------------------------------------------------------------------------
-- Company:
-- Engineer:
--
-- Create Date:    14:04:39 05/13/2019
-- Design Name:
-- Module Name:    calcwin - Behavioral
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

entity calcwin is
    Port ( pres : in  STD_LOGIC_VECTOR (4 downto 0);
           win : out  STD_LOGIC_VECTOR (1 downto 0);
           clk : in  STD_LOGIC);
end calcwin;

architecture Behavioral of calcwin is
signal mem : std_logic_vector(4 downto 0);
  begin
  calc : process(clk)
    begin
    if clk'event and clk='1' then
      if (mem="00101" or mem="11111") and pres="11011" then
        win<="01";
      elsif (mem="10010" or mem="01000") and pres="01100" then
        win<="10";
      else
        win<="00";
      end if;
      mem<=pres;
    end if;
  end process calc;
end architecture Behavioral;
