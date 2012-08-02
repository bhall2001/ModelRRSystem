* 
* ------------------------------------------------------------------
* Tutorial.hh - Tutorial for the resistor calculator
* Created by Robert Heller on Sat Jan 20 14:55:56 2007
* ------------------------------------------------------------------
* Modification History: $Log$
* Modification History: Revision 1.1  2007/02/01 20:00:53  heller
* Modification History: Lock down for Release 2.1.7
* Modification History:
* Modification History: Revision 1.1  2002/07/28 14:03:50  heller
* Modification History: Add it copyright notice headers
* Modification History:
* ------------------------------------------------------------------
* Contents:
* ------------------------------------------------------------------
*  
*     Model RR System, Version 2
*     Copyright (C) 1994,1995,2002-2005  Robert Heller D/B/A Deepwoods Software
* 			51 Locke Hill Road
* 			Wendell, MA 01379-9728
* 
*     This program is free software; you can redistribute it and/or modify
*     it under the terms of the GNU General Public License as published by
*     the Free Software Foundation; either version 2 of the License, or
*     (at your option) any later version.
* 
*     This program is distributed in the hope that it will be useful,
*     but WITHOUT ANY WARRANTY; without even the implied warranty of
*     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
*     GNU General Public License for more details.
* 
*     You should have received a copy of the GNU General Public License
*     along with this program; if not, write to the Free Software
*     Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
* 
*  
*
0 Tutorial
The Resistor Calculator program aids in calculating dropping resistors
for LEDs and low-voltage lamps commonly used on model railroads.  It
implements Ohm's Law to perform the calculation and then finds the
nearest stock value and also displays the color bands for typical carbon
resistors.

The calculator takes three input values, the supply voltage, the voltage
across the load (LED or lamp) and the load current the LED or lamp
operates at.  These values are entered along with the units they are in.
Then the calculate button is pushed and the results are displayed.  The
results can also be saved to a text file, which can be printed or
otherwise refered to later.

