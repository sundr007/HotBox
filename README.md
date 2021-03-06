# HotBox
![](Video.gif?raw=true)

![](Build_Pic.png?raw=true)

I use this when I'm testing electronics on my benchtop.  I put this box on top of what I'm testing to raise the ambient temperature.  This is convenient because I can leave my probes and other wires hooked up as is.
This box can raise the ambient temperature up to 55C.

The design consists of a finger edge laser cut acrylic box that has a circuit board assembly mount in the top center of it.  I put foam on the bottom edge of the box so it can nicely sit on top of wires and cables without air gaps.  

The circuit board assembly consists of a 2 layer PCB meant to fit PCBWAY's cheap board special (hint,they're $1 a piece for QTY 5).  On the PCB there is a ST NUCLEO-G431KB board which is an easy way to add a microcontroller.  There's 2 buttons to control temperature setpoint, a 7 segment display to display temperature, a peltier plate that acts as the heating element, and an Intel LGA1155 processor fan to spread the heat from the peltier plate.

I have built the current revision and found that it works as expected and I'm able to use it as I debug and test my electronics.

![](PCB.png?raw=true)

![](OpenScad.png?raw=true)
