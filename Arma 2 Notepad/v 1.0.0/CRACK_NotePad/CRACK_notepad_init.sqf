CRACK_fnc_createNoteStrings = {
	
	_strings = [];
	
	// Making Strings for Array
	for "_j" from 6 to 26 do {
		_string = "";
		_strings = _strings + [_string];
	};
	
	_strings
};

_strings = call CRACK_fnc_createNoteStrings;

if (isserver) then {
	
	if (isnil "CRACK_gvar_NotePadTransfer") then {
		
		// Format: [PlayerName, ["List","of","Titles"], [NoteTitle, ["List","of","Strings"]], TransferDirectionNumber, isTruncated]
		CRACK_gvar_NotePadTransfer = ["",[""],["", _strings], 0, false];
		publicvariable "CRACK_gvar_NotePadTransfer";
		
	};
	
};

if (!isdedicated) then {
	
	if (isnil "CRACK_var_NotePadInUse") then {CRACK_var_NotePadInUse = false;};
	if (isnil "CRACK_var_NotePadCopyBlocked") then {CRACK_var_NotePadCopyBlocked = false;};
	if (isnil "CRACK_var_RemindersDisabled") then {CRACK_var_RemindersDisabled = false;};
	if (isnil "CRACK_var_notepadpages") then {CRACK_var_notepadpages = 15;};
	if (isnil "CRACK_var_notepadlines") then {CRACK_var_notepadlines = 15;};
	if (isnil "CRACK_var_notepadcurrentpage") then {CRACK_var_notepadcurrentpage = 0;};
	if (isnil "CRACK_var_notepadlb") then {CRACK_var_notepadlb = [];};
	if (isnil "CRACK_var_reminderTitleArray") then {CRACK_var_reminderTitleArray = [];};
	if (isnil "CRACK_var_reminderHandleArray") then {CRACK_var_reminderHandleArray = [];};
	if (isnil "CRACK_var_NotePad_contents") then {
		
		// Initializing Variables
		CRACK_var_NotePad_contents = [];
		
		// Adding Pages to Main Array
		for "_j" from 1 to CRACK_var_notepadpages do {
			_pagename = format["Page %1",_j];
			CRACK_var_NotePad_contents = CRACK_var_NotePad_contents + [[_pagename,_strings]];
		};
	};
	
	if ((player getvariable ["CRACK_var_old_NotePad", 69]) == 69) then {player setvariable ["CRACK_var_old_NotePad", CRACK_var_NotePad_contents];};
	
	waituntil {!isnil "CRACK_gvar_NotePadTransfer";};
	
	"CRACK_gvar_NotePadTransfer" addPublicVariableEventHandler {[] execVM "CRACK_NotePad\functions\mp\CRACK_NotePadTransfer.sqf";};

	["player", [ace_sys_interaction_key_self], -99999, ["CRACK_NotePad\CRACK_selfInteractMenu.sqf", "main"]] call CBA_ui_fnc_add;
	
	if (ismultiplayer) then {
		[["Man"], [ace_sys_interaction_key], -99999, ["CRACK_NotePad\CRACK_interactMenu.sqf", "main"]] call CBA_ui_fnc_add;
	};
	
	CRACK_var_notePadEHIndex = player addMPEventHandler ["mpkilled", {blah = _this execVM "CRACK_NotePad\functions\mp\CRACK_onPlayerDeath.sqf";}];
	
	//[] execVM "CRACK_NotePad\CRACK_NotePad_Briefing.sqf";
	
};