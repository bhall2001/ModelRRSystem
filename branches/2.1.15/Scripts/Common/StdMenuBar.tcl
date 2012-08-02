#* 
#* ------------------------------------------------------------------
#* Role PlayingDB V2.0 by Deepwoods Software
#* ------------------------------------------------------------------
#* StdMenuBar.tcl - Standardized Menubar support code.
#* Created by Robert Heller on Sat Aug  8 09:41:22 1998
#* ------------------------------------------------------------------
#* Modification History: 
#* $Log$
#* Revision 1.3  2005/11/04 19:06:37  heller
#* Nov 4, 2005 Lockdown
#*
#* Revision 1.2  2004/04/14 23:09:55  heller
#* Misc. fixes.
#*
#* Revision 1.1  1999/12/23 20:12:08  heller
#* Initial revision
#*
#* Revision 1.5  1999/07/13 01:30:12  heller
#* Fix documentation: spelling, punctuation, etc.
#*
#* Revision 1.4  1999/04/20 13:15:09  heller
#* Final changes
#*
#* Revision 1.3  1999/03/28 06:20:44  heller
#* Update on-line help.
#*
#* Revision 1.2  1998/12/27 20:49:36  heller
#* Fix spelling errors
#*
#* Revision 1.1  1998/12/27 17:17:54  heller
#* Initial revision
#*
#* ------------------------------------------------------------------
#* Contents:
#* ------------------------------------------------------------------
#*  
#*     Role Playing DB -- A database package that creates and maintains
#* 		       a database of RPG characters, monsters, treasures,
#* 		       spells, and playing environments.
#* 
#*     Copyright (C) 1995,1998  Robert Heller D/B/A Deepwoods Software
#* 			51 Locke Hill Road
#* 			Wendell, MA 01379-9728
#* 
#*     This program is free software; you can redistribute it and/or modify
#*     it under the terms of the GNU General Public License as published by
#*     the Free Software Foundation; either version 2 of the License, or
#*     (at your option) any later version.
#* 
#*     This program is distributed in the hope that it will be useful,
#*     but WITHOUT ANY WARRANTY; without even the implied warranty of
#*     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#*     GNU General Public License for more details.
#* 
#*     You should have received a copy of the GNU General Public License
#*     along with this program; if not, write to the Free Software
#*     Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
#* 
#*  
#* 

#@Chapter:StdMenuBar.tcl -- Create standard menubars
#@Label:StdMenuBar.tcl
#$Id$
# This file contains code to create a standard Motif style menubar.
# A standard menubar contains ``File'', ``Edit'', ``View'', ``Options'',
# and ``Help'' pulldown menus.  The ``File'', ``Edit'', and ``Help'' menus
# have standard menu items.
#
# The menubars and menus generated by the procedures in this file fill the
# standards set forth in the Motif Style Guide.

proc MakePullDown {menu args} {
# This procedure creates a pulldown menu and adds the items specified
# in its argument list.
# <in> menu -- the menu to create.
# <in> args -- the items to place in the menu.
# [index] MakePullDown!procedure

  menu $menu -tearoff {0}
  foreach a $args {
    eval [concat $menu add $a]
  }
}

proc MakeFilePullDown {menu} {
# This procedure creates a standard File menu.
# <in> menu -- the menu to create.
# [index] MakeFilePullDown!procedure

 MakePullDown $menu \
	{command -label {New} -underline {0}} \
        {command -label {Open...} -underline {0}} \
        {command -label {Save} -underline {0}} \
        {command -label {Save As...} -underline {5}} \
        {command -label {Print...} -underline {0}} \
	{command -label {Close} -underline {0}} \
	{command -label {Exit} -underline {1}}
}

proc MakeEditPullDown {menu} {
# This procedure creates a standard Edit menu.
# <in> menu -- the menu to create.
# [index] MakeEditPullDown!procedure

    MakePullDown $menu \
	{command -label {Undo} -underline {0}} \
	{command -label {Cut} -underline {2}} \
	{command -label {Copy} -underline {0}} \
	{command -label {Paste} -underline {0}} \
	{command -label {Clear} -underline {1}} \
	{command -label {Delete} -underline {0}} \
	{command -label {Select All}} \
	{command -label {De-select All}}
}

proc MakeHelpPullDown {menu} {
# This procedure creates a standard Help menu.
# <in> menu -- the menu to create.
# [index] MakeHelpPullDown!procedure

    MakePullDown $menu \
	[list command -label {On Context...} -state {active} -underline {3} -command "tixHelp::HelpContext \[tixHelp::GetTopLevelOfFocus $menu\]"] \
	{command -label {On Help...} -underline {3} -command {tixHelp::HelpTopic Help}} \
	[list command -label {On Window...} -underline {3} -command "tixHelp::HelpWindow \[tixHelp::GetTopLevelOfFocus $menu\]"] \
	{command -label {On Keys...} -underline {3} -command {tixHelp::HelpTopic Keys}} \
	{command -label {Index...} -underline {0} -command {tixHelp::HelpTopic Index}} \
	{command -label {Tutorial...} -underline {0} -command {tixHelp::HelpTopic Tutorial}} \
	{command -label {On Version...} -underline {3} -command {tixHelp::HelpTopic Version}} \
	{command -label {Warranty...} -command {tixHelp::HelpTopic Warranty}} \
	{command -label {Copying...} -command {tixHelp::HelpTopic Copying}} \
	{command -label {Registering...} -command {tixHelp::HelpTopic Registering}}
}

proc MakeStandardMenuBar {{name .menuBar} {toplevel .}} {
# This procedure creates a standard Motif style menu bar.  If this is run under
# Tcl/Tk 8.0, then the menu / .toplevel config -menu .menu hack
# is used.  For older versions of Tcl/Tk, a conventional horizontal frame of
# menubuttons is packed into the top of the toplevel.
# <in> name -- the name of the menu bar.
# <in> toplevel -- the name of the toplevel to pack the menu into.
# [index] MakeStandardMenuBar!procedure


  global tk_version
  if {$tk_version < 8.0} {
# Pre 8.0 systems: create a frame of menubuttons
    frame $name -borderwidth {2} -relief {raised}
    pack $name -in $toplevel -fill x
    menubutton $name.fileMb \
	 -menu $name.fileMb.menu \
	 -padx {4} \
	 -pady {3} \
	 -text {File} \
	 -underline {0}
    pack $name.fileMb -side left
    MakeFilePullDown $name.fileMb.menu

    menubutton $name.editMb \
	 -menu $name.editMb.menu \
	 -padx {4} \
	 -pady {3} \
	 -text {Edit} \
	 -underline {0}
    pack $name.editMb -side left
    MakeEditPullDown $name.editMb.menu

    menubutton $name.viewMb \
	    -menu $name.viewMb.menu \
	    -padx {4} \
	    -pady {3} \
	    -text {View} \
	    -underline {0}
    pack $name.viewMb -side left

    MakePullDown $name.viewMb.menu

    menubutton $name.optionsMb \
	    -menu $name.optionsMb.menu \
	    -padx {4} \
	    -pady {3} \
	    -text {Options} \
	    -underline {0}
    pack $name.optionsMb -side left

    MakePullDown $name.optionsMb.menu

    menubutton $name.helpMb \
	    -menu $name.helpMb.menu \
	    -padx {4} \
	    -pady {3} \
	    -text {Help} \
	    -underline {0}
    pack $name.helpMb -side right

    MakeHelpPullDown $name.helpMb.menu 
  } else {
# 8.0 or later: create a menu bar menu and configure it into the toplevel
    menu $name -tearoff 0
    $toplevel configure -menu $name    
    $name add cascade -label {File} -menu $name.file -underline {0}
    MakeFilePullDown $name.file
    $name add cascade -label {Edit} -menu $name.edit -underline {0}
    MakeEditPullDown $name.edit
    $name add cascade -label {View} -menu $name.view -underline {0}
    MakePullDown $name.view
    $name add cascade -label {Options} -menu $name.options -underline {0}
    MakePullDown $name.options
    $name add cascade -label {Help} -menu $name.help -underline {0}
    MakeHelpPullDown $name.help
# Special platform dependent menu items:
    global tcl_platform
    if {$tcl_platform(platform) == "macintosh"} {
#     MacOS gets an "apple" menu.
      $name add cascade -label {Apple} -menu $name.apple
      MakePullDown $name.apple
    }
    if {$tcl_platform(platform) == "windows"} {
#     MS-Windows gets a "system" menu.
      $name add cascade -label {System} -menu $name.system
      MakePullDown $name.system
    }
  }
}

proc remoSp {string} {
# Procedure to remove random whitespace characters.
# <in> string -- the string to remove space from.
# [index] remoSp!procedure

  if {[regsub "\[ \t\]" "$string" {} newstring] > 0} {
    return "$newstring"  } else {
    return "$string"  }
}

proc AddExtraMenuButton {buttonLabel {mbar .menuBar}} {
# Procedure to add an extra menu button to a menu bar.  Typically this would be
# something like a ``Windows'' or ``Special'' menu.
# <in> buttonLabel -- the menu button label.
# <in> mbar -- the menubar to add the menu button to.
# [index] AddExtraMenuButton!procedure

  set menu "[string tolower [remoSp $buttonLabel]]"
  global tk_version
  if {$tk_version < 8.0} {
    set mbName $menu
    append mbName "Mb"
    menubutton $mbar.$mbName \
	-menu $mbar.$mbName.menu \
	-text "$buttonLabel"
    pack $mbar.$mbName -side left
    MakePullDown $mbar.$mbName.menu
  } else {
    $mbar add cascade -label "$buttonLabel" -menu $mbar.$menu
    MakePullDown $mbar.$menu
  }
}

proc GetMenuByName {label {mbar .menuBar}} {
# Procedure to fetch the menu associated with the named label.
# <in> label -- the label to look for.
# <in> mbar -- the menu bar to search.
# [index] GetMenuByName!procedure

  global tk_version
  if {$tk_version < 8.0} {
    foreach c [winfo children $mbar] {
      if {[string compare "$label" "[$c cget -text]"] == 0} {
        return "[$c cget -menu]"
      }
    }
    return {}
  } else {
    if {[catch [list $mbar entrycget "$label" -menu] menu]} {
      return {}
    } else {
      return $menu
    }
  }
}

proc DeleteMenuByName {label {mbar .menuBar}} {
# Procedure to delete a menu button from a menu bar.
# <in> label -- the menu button to delete.
# <in> mbar -- the menubar to delete the menu button from.
# [index] DeleteMenuByName!procedure

  global tk_version
  if {$tk_version < 8.0} {
    foreach c [winfo children $mbar] {
      if {[string compare "$label" "[$c cget -text]"] == 0} {
        catch [list destroy "[$c cget -menu]"]
	catch [list destroy $c]
	return 1
      }
    }
    return 0
  } else {
    catch [list destroy "[$mbar entrycget $label -menu]"]
    catch [list $mbar delete $label]
    return 1
  }
}

package provide StdMenuBar 1.0
