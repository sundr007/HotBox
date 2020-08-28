# HotBox
A benchtop hot box used to test electronics at elevated ambient temperature.  Kicad PCB, STM32 firmware, OpenScad Mechanical

I use this when I'm testing electronics on my benchtop.  I put this box on top of what I'm testing to raise the ambient temperature.
This box can raise the ambient temperature up to 55C.

The design consists of a finger edge laser cut acrylic box that has a circuit board assembly mount in the top center of it.  I put some sort of loose foam on the bottom edge of the box so it can nicely sit on top of wires and cables without air gaps.  

The circuit board assembly consists of a 2 layer PCB meant to fit PCBWAY's cheap board special (hint,they're $1 a piece for QTY 5).  On the PCB there is a ST NUCLEO-G431KB board which is an easy way to add a microcontroller.  There's 2 buttons to control temperature setpoint, a 7 segment display to display temperature, a peltier plate that acts as the heating element, and an Intel LGA1155 processor fan to spread the heat from the peltier plate.

This is my 2nd iteration of this.

![](3D.png?raw=true)

![](PCB.png?raw=true)
