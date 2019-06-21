----------------------------------------------------------------------------------
-- Company:
-- Engineer:
--
-- Create Date:    14:30:24 05/07/2019
-- Design Name:
-- Module Name:    modrnd - Behavioral
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

entity modrnd is
    Port ( reset : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           rbit_out : out STD_LOGIC);
end modrnd;

architecture rand of modrnd is
  signal lfsr : std_logic_vector(3 downto 0);
  signal feedback : std_logic;
begin
  feedback <=not(lfsr(3) xor lfsr(2));
  sr_pr : process(clk)
  begin
    if(rising_edge(clk)) then
      if(reset='1') then
        lfsr<=(others =>'0');
      else
        lfsr<=lfsr(2 downto 0) & feedback;
      end if;
    end if;
  end process sr_pr;
  rbit_out<=lfsr(3);

end architecture rand;
