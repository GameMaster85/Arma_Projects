=====================================
Arma 2 NotePad
Version: 1.0.0
Release date: 9/13/2012
Author(s): Crackman (Dylan Plecki)
Multiplayer compatible: Yes
=====================================

An unofficial addon (script) for the PC game "Arma 2: Operation Arrowhead" by Bohemia Interactive.


=====================================
DESCRIPTION
=====================================

This addon adds a NotePad and a Reminder System to the popular military simulator Arma 2.
It allows for multiple page, multiple line Notes that can be accessed in-game and on the map,
and for a built-in reminder system that will hint the player a custom reminder after a certain amount of minutes.


=====================================
REQUIREMENTS
=====================================

Arma 2 - version [1.20] - Bohemia Interactive
Arma 2: Operation Arrowhead - version [1.50] - Bohemia Interactive
British Armed Forces - version [1.00] - Bohemia Interactive
Private Military Contractors - version [1.00] - Bohemia Interactive
ACE 2 - v570
CBA - v187

 
=====================================
INSTALLATION
=====================================

As this is just a script for now, put the CRACK_NotePad folder into your mission director and
call the syntax below in your init.sqf


=====================================
TECHNICAL DETAILS
=====================================

Description.ext:
	
	Add this next line:
	
	#include "CRACK_NotePad\CRACK_diag.hpp"


Script Syntax:
	
	Call the next line locally for each player that you wish to run it, SCRIPT IS COMPLETELY LOCALIZED

	if (!isdedicated) then {nul = [] execVM "CRACK_NotePad\CRACK_notepad_init.sqf";};
 
 
=====================================
KNOWN ISSUES
=====================================

Crappy looking GUI

 
=====================================
VERSION HISTORY
=====================================

First Release
 

=====================================
LICENSE
=====================================

None. Free to use!


=====================================
CREDITS
=====================================
 
Crackman

And anyone from ACE/CBA/BI


=====================================
CONTACT DETAILS
=====================================
 
dylanplecki@gmail.com
or by PM via unitedoperations.net @ crackman