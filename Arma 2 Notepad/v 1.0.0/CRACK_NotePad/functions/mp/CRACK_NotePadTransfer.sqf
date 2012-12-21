_playerName = (CRACK_gvar_NotePadTransfer select 0);
_isRequest = (CRACK_gvar_NotePadTransfer select 3);

// If requesting only titles
if (_isRequest == 1) then {
	
	if ((_playerName == player) OR (typename (_playerName getvariable ["CRACK_var_old_NotePad", 69]) != typename (69))) then {
		
		_titles = [];
		_strings = [];
		_characterArray = [];
		_contents = [];
		
		if (_playerName == player) then {
			
			_contents = CRACK_var_NotePad_contents;
			
		} else {
			
			if (typename (_playerName getvariable ["CRACK_var_old_NotePad", 69]) != typename (69)) then {
				
				_contents = _playerName getvariable "CRACK_var_old_NotePad";
				
			};
			
		};
		
		{
			_titles = _titles + [(_x select 0)];
		} foreach _contents;
		
		{
			_characterArray = _characterArray + toArray(_x);
		} foreach _titles;
		
		_isTruncated = false;
		
		_characterCount = count _characterArray;
		
		if (_characterCount > 20000) then {
			
			_text = format["%1's NotePad contains over %2 Bytes of data - Too large to send", (name _player), _characterCount];
			if (isserver) then {[_text, "CRACK_NotePad", [false, false, true] ] call CBA_fnc_debug;};
			
			{
				_titles = _titles - [(_titles select ((count _titles) - 1))];
				{
					_characterArray = _characterArray + toArray(_x);
				} foreach _titles;
				if (_characterCount <= 20000) exitwith {};
			} foreach _titles;
			
			_isTruncated = true;
			
		};
		
		CRACK_gvar_NotePadTransfer = [_playerName, _titles, ["", ""], 0, _isTruncated];
		publicvariable "CRACK_gvar_NotePadTransfer";
		
	};
	
};

// If requesting complete data
if (_isRequest == 2) then {
	
	if ((_playerName == player) OR (typename (_playerName getvariable ["CRACK_var_old_NotePad", 69]) != typename (69))) then {
		
		_title = (CRACK_gvar_NotePadTransfer select 2) select 0;
		_strings = [];
		_characterArray = [];
		_contents = [];
		
		if (_playerName == player) then {
			
			_contents = CRACK_var_NotePad_contents;
			
		} else {
			
			if (typename (_playerName getvariable ["CRACK_var_old_NotePad", 69]) != typename (69)) then {
				
				_contents = _playerName getvariable "CRACK_var_old_NotePad";
				
			};
			
		};
		
		{
			
			if ((_x select 0) == _title) exitwith {_strings = (_x select 1);};
			
		} foreach _contents;
		
		{
			_characterArray = _characterArray + toArray(_x);
		} foreach _strings;
		
		_isTruncated = false;
		
		_characterCount = count _characterArray;
		
		if (_characterCount > 20000) then {
			
			_text = format["%1's NotePad contains over %2 Bytes of data - Too large to send", (name _player), _characterCount];
			if (isserver) then {[_text, "CRACK_NotePad", [false, false, true] ] call CBA_fnc_debug;};
			
			{
				_strings = _strings - [(_strings select ((count _strings) - 1))];
				{
					_characterArray = _characterArray + toArray(_x);
				} foreach _strings;
				if (_characterCount <= 20000) exitwith {};
			} foreach _strings;
			
			_isTruncated = true;
			
		};
		
		CRACK_gvar_NotePadTransfer = [_playerName, [""], [_title, _strings], 0, _isTruncated];
		publicvariable "CRACK_gvar_NotePadTransfer";
		
	};
	
};