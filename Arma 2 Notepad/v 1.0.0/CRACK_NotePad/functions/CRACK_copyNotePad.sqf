if (!ismultiplayer) then {
	
	_string = "";
	_line = "";

	_contents = CRACK_var_NotePad_contents select CRACK_var_notepadcurrentpage;

	_line = (_contents select 0) + "<br /><br />";

	{
		_line = _line + _x + "<br />";
	} foreach (_contents select 1);

	_string = _string + _line + "<br /><br />";

	copyToClipboard _string;

	hint "Page Copied to Clipboard";
	
} else {
	
	hint "copyToClipboard only works in SinglePlayer! Thank Bohemia Interactive for that.";
	
};