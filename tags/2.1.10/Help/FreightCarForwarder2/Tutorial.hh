0 Tutorial

The Freight Car Forwarder is a program designed to simulate freight car
traffic on your model railroad.  It does this by matching types of
freight cars with industries.  Specific types of freight cars are meant
to carry specific types of commidities and specific industries produce
or consume specific types of commidities.

Before you start using the Freight Car Forwarder system, you should
carefully study the <Files> and <File Formats> sections of the
reference section.   These files describe the system layout (system
file), the industries (industry file), the train that will move the
cars (trains file), and the cars themselves (the cars file).  There are
some additional files, including an owner's file and a car types file,
as well as a file for statistics.  All of these files are plain text
files -- you will need a plain text file editor (such as Notepad under
MS-Windows or gedit under many versions of Linux) to create and
generally edit these files. The only files that are ever modified by
the Freight Car Forwarder system are the cars files and the statistics
file. You should [not] edit the statistics file--this file is
automatically generated by the Freight Car Forwarder system.  While it
is possible to use tools available as part of the Freight Car Forwarder
system to edit cars in the cars file, it is probably best to use a
regular text editor to add, modify, or delete cars in a wholesale
manor.  All of the other files are treated as "constant data" by the
Freight Car Forwarder system, which will load the data into memory and
not modify that data.

Table of contents:

  1 <Loading System Data>
  2 <Assigining Cars>
  3 <Running Trains>
  4 <Printing Yard And Switch Lists>
  5 <Saving the Cars file>
  6 <Generating Reports>
  7 <Other activities>

1 Loading System Data

The Freight Car Forwarder starts loading data by opening and reading
the system file, using either the file menu's Open... item or open file
button on the toolbar.  This file contains the path names of the other
files, which are assumed to be relative to the directory (folder) that
contains the system file.  All of the system data is loaded into a
large data structure, which is then used by the program to simulate car
movements. Only car data is altered by the Freight Car Forwarder and the only
files that ever get re-written are the cars and statistics files.  The
other data files are never altered by the Freight Car Forwarder.  These
file can be edited using a plain text editor, such as Notepad
(MS-Windows) or Emacs (UNIX), should this be needed, as industries or
trains are added or removed, etc.

1 Assigining Cars

  In order to move cars, the cars need to be "assigned", that is, they
need to have a destination set, either to be loaded (if empty) or
unloaded (is loaded).  The Car Assignment procedure performs this task.

1 Running Trains

  Once cars has been assigned, they need to be moved.  Cars are moved on
trains, and this is done with the run trains procedures.  There are
three of these procedures: Run All Trains in Operating Session, Run
Boxmoves, and Run One Train at a time.  The run trains procedures
simulate the actual movement of cars and determines which trains will
move which cars and in what order.  From this simulation, a set of yard
and switch lists can be generated and printed out for use during your
operating session.

1 Printing Yard And Switch Lists

  Once the trains have been run, yard and switch lists can be printed
out, using the print yard lists menu.

1 Saving the Cars file

Once you have assigned cars, simulated train movements and created your
Yard and Switch Lists, you should save the cars file.  You should now
be ready to run your trains in an operating session.  If your session
went off well, you will be ready to make car assignments for your next
session.  If there were problems during the operating session (such as
bad ordered cars or late trains), you might have to make adjustments
before running the car assignment process for the next session.  You
would use the car editor to make these adjustments.

1 Generating Reports

  Various reports can also be generated and printed using the reports
menu. 

1 Other activities

  Other activities include adding, removing, and editing cars and
displaying various state information, such as assigned and unassigned
cars, car movement information, lists of trains, and lists of
industries, stations, and divisions.