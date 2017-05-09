/* -*- C -*- ****************************************************************
 *
 *  System        : 
 *  Module        : 
 *  Object Name   : $RCSfile$
 *  Revision      : $Revision$
 *  Date          : $Date$
 *  Author        : $Author$
 *  Created By    : Robert Heller
 *  Created       : Wed Jul 22 11:06:42 2015
 *  Last Modified : <170509.1150>
 *
 *  Description	
 *
 *  Notes
 *
 *  History
 *	
 ****************************************************************************
 *
 *    Copyright (C) 2015  Robert Heller D/B/A Deepwoods Software
 *			51 Locke Hill Road
 *			Wendell, MA 01379-9728
 *
 *    This program is free software; you can redistribute it and/or modify
 *    it under the terms of the GNU General Public License as published by
 *    the Free Software Foundation; either version 2 of the License, or
 *    (at your option) any later version.
 *
 *    This program is distributed in the hope that it will be useful,
 *    but WITHOUT ANY WARRANTY; without even the implied warranty of
 *    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *    GNU General Public License for more details.
 *
 *    You should have received a copy of the GNU General Public License
 *    along with this program; if not, write to the Free Software
 *    Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
 *
 * 
 *
 ****************************************************************************/


/** @defgroup TclwiringpiModule TclwiringpiModule
 *  @brief    WiringPi Tcl bindings module.
 * 
 * This module provides Tcl bindings to the Wiring Pi library.  All of the
 * functions defined in the Wiring Pi C library are made available as Tcl 
 * commands.  Please see the documentation for the Wiring Pi C library.
 * 
 * @author Robert Heller \<heller\@deepsoft.com\>
 */

%module Tclwiringpi
%{
#include <wiringPi.h>
#include <wiringPiI2C.h>
#include <wiringPiSPI.h>
#include <mcp23008.h>
#include <mcp23017.h>
static const char rcsid[] = "@(#) : $Id$";
%}

%include typemaps.i

%{
#undef SWIG_name
#define SWIG_name "Tclwiringpi"
#undef SWIG_version
#define SWIG_version "1.0.0"
 /* Dummys to deal with include file hookeyness. */
 int  wiringPiSetupPiFace (void) {return 0;}
 int  wiringPiSetupPiFaceForGpioProg (void) {return wiringPiSetupPiFace();}
 /* Broken Include file (defines functions that are not defined or used. */
 unsigned int  digitalRead8        (int pin) {return 0;}
 void digitalWrite8       (int pin, int value) {return;}
%}

%include <wiringPi.h>
%include <wiringPiI2C.h>
%include <wiringPiSPI.h>
%include <mcp23008.h>
%include <mcp23017.h>
