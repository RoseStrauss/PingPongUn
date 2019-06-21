----------------------------------------------------------------------------------
-- Company:
-- Engineer:
--
-- Create Date:    16:32:46 06/11/2019
-- Design Name:
-- Module Name:    clkline - Behavioral
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

entity clkline is
    Port ( clksys : in  STD_LOGIC;
           rst : in std_logic;
           valcpline : in std_logic;
           modclk : in  STD_LOGIC_VECTOR (3 downto 0);
           clkout : out  STD_LOGIC);
end clkline;

architecture Behavioral of clkline is
  signal cptf,cptp,rate : unsigned(14 downto 0);
begin
  proc1 : process (clksys,rst,cptp)
    begin
      if rst='1' then
        cptp<="000000000000000";
      elsif rising_edge(clksys) then
        cptp<=cptf;
      end if;
      if cptp>=rate or valcpline='1' then
        cptf<="000000000000000";
      else
        cptf<=cptp+"000000000000001";
      end if;
    end process;
    clkout<='1' when cptp="000000000000000" else '0';
    with modclk select
      rate<="111111011110100" when "0000",
            "101111100110111" when "0001",
            "100111101011000" when "0010",
            "011111101111010" when "0011",
            "010111110011011" when "0100",
            "010011110101100" when "0101",
            "001111110111101" when "0110",
            "001100101100100" when "0111",
            "001011000110111" when "1000",
            "001001100001011" when "1001",
            "001000101110100" when "1010",
            "000111111011110" when others;
end Behavioral;
