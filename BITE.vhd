----------------------------------------------------------------------------------
-- Company:
-- Engineer:
--
-- Create Date:    17:05:54 05/24/2019
-- Design Name:
-- Module Name:    BITE - Behavioral
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

entity BITE is
    Port (
    azer:in std_logic;
    qsdf:out std_logic;
    caca : in std_logic_vector(6 downto 0);
    froscaca : out std_logic_vector(6 downto 0));
end BITE;

architecture Behavioral of BITE is
begin
froscaca<=caca;
qsdf<=azer;
end Behavioral;
