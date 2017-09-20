// EPOCH_giveAttributes
//[[[cog import generate_private_arrays ]]]
private ["_addPlus","_celcuis","_currentVal","_customVarIndex","_customVarLimits","_customVarNames","_customVarsInit","_data","_defaultVarValues","_limits","_max","_min","_newValue","_return","_varName"];
//[[[end]]]
params ["_selectedVarName",["_data",0],["_randomizeData",0]];
_addPlus = if (_data > 0) then {"+"} else {""};
_return = "";

_customVarsInit = ["CfgEpochClient", "customVarsDefaults", EPOCH_customVarsDefaults] call EPOCH_fnc_returnConfigEntryV2;
_customVarNames = _customVarsInit apply {_x param [0,""]};
_defaultVarValues = _customVarsInit apply {_x param [1,0]};
_customVarLimits = _customVarsInit apply {_x param [2,[]]};

_customVarIndex = _customVarNames find _selectedVarName;
if (_customVarIndex != -1) then {
    _varName = format["EPOCH_digest%1",_selectedVarName];
    _limits = _customVarLimits select _customVarIndex;
	_limits params [["_max",100],["_min",0]];
	if (_max isEqualType "") then {
		_max = missionNamespace getVariable [_max, 0];
	};
	if (_min isEqualType "") then {
		_min = missionNamespace getVariable [_min, 0];
	};
	_currentVal = missionNamespace getVariable [_varName, 0];
	if (_randomizeData isEqualTo 1) then {
		_data = round(random _data);
	};
    if (_data != 0) then {
    	_newValue = ((_currentVal + _data) min _max) max _min;
    	missionNamespace setVariable [_varName, _newValue];
    	if (_selectedVarName == "Temp") then {
    		_celcuis = _data call EPOCH_convertTemp;
    		_return = format["%1: %2%3°F %2%4°C",(localize format["str_epoch_pvar_%1",_selectedVarName]),_addPlus,_data,_celcuis];
    	} else {
    		_return = format["%1: %2%3", (localize format["str_epoch_pvar_%1",_selectedVarName]), _addPlus, _data];
    	};
    };
};

_return
