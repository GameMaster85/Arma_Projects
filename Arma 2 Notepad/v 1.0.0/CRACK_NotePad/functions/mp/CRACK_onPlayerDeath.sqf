_unit = _this select 0;
_killer = _this select 1;

_unit setvariable ["CRACK_gvar_thisUnitDied", player, true];

_unit setvariable ["CRACK_var_old_NotePad", CRACK_var_NotePad_contents];

CRACK_var_NotePadCopyBlocked = false;