----------------------------------------------------------------------------------
-- Company:
-- Engineer:
--
-- Create Date:    14:06:18 05/03/2019
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

entity affball1 is
    Port ( ballstate : in  STD_LOGIC_VECTOR (4 downto 0);
           affline : out  STD_LOGIC_VECTOR (7 downto 0));
end entity affball1;

architecture Behavioral of affball1 is
  -- signal temp : STD_LOGIC_VECTOR(3 downto 0);

begin
  process(ballstate)
    begin
      -- temp <= ballstate(3 downto 0);
    case ballstate(3 downto 0) is
      when "0000" => affline <= "10000000";
      when "0001" => affline <= "01000000";
      when "0010" => affline <= "00100000";
      when "0011" => affline <= "00010000";
      when "0100" => affline <= "00001000";
      when "0101" => affline <= "00000100";
      when "0110" => affline <= "00000010";
      when "0111" => affline <= "00000001";

      when "1111" => affline <= "10000000";
      when "1000" => affline <= "00000001";

      when others => affline <= "00000000";
    end case;
  end process;
end Behavioral;
