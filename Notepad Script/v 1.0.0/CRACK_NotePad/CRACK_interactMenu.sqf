private ["_menuDef", "_target", "_params", "_menuName", "_menuRsc", "_menus", "_aliveStatus"];

// _this==[_target, _menuNameOrParams]
_target = _this select 0;
_params = _this select 1;

_menuName = "";
_menuRsc = "popup";

if (typeName _params == typeName []) then {
	if (count _params < 1) exitWith {diag_log format["Error: Invalid params: %1, %2", _this, __FILE__];};
	_menuName = _params select 0;
	_menuRsc = if (count _params > 1) then {_params select 1} else {_menuRsc};
} else {
	_menuName = _params;
};
//-----------------------------------------------------------------------------

_sameSide = false;
_isHuman = false;
_isDead = false;
_isBlocked = false;
_players = [];
_players = playableunits;
if ((typeName _players) != (typeName [])) then {_players = [player];}; // For singleplayer debugging + no errors

if ((_players find _target) != -1) then {_isHuman = true; if ((side _target) == (side player)) then {_sameSide = true;};};

if (_players find (_target getvariable ["CRACK_gvar_thisUnitDied", 69]) != -1) then {_isDead = true;};

if (_target getvariable ["CRACK_var_NotePadCopyBlocked", false]) then {_isBlocked = true;};

_menus = [
	[
		["main", "Main Menu", _menuRsc],
		[
			["Copy NotePad",
				{ [_target] execVM "CRACK_NotePad\functions\mp\CRACK_copyNotePad.sqf"; },
				"", "", "", -1,
				1, (((_isHuman) AND (_sameSide) AND !(_isBlocked)) OR _isDead)
			]
		]
	]
];


//-----------------------------------------------------------------------------
_menuDef = [];
{
	if (_x select 0 select 0 == _menuName) exitWith {_menuDef = _x};
} forEach _menus;

if (count _menuDef == 0) then {
	hintC format ["Error: Menu not found: %1\n%2\n%3", str _menuName, if (_menuName == "") then {_this}else{""}, __FILE__];
	diag_log format ["Error: Menu not found: %1, %2, %3", str _menuName, _this, __FILE__];
};

_menuDef // return value
