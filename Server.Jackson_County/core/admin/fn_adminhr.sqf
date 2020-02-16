#include <macro.h>
/*
    File: fn_adminHR.sqf
    Author: tenshi
*/
private["_unit","_name"];

if(__GETC__(life_adminlevel) < 1) exitWith {closeDialog 0;};

_unit = lbData[2902,lbCurSel (2902)];
_unit = call compile format["%1", _unit];
if(isNil "_unit") exitwith {};
if(isNull _unit) exitWith {};

_name = name _unit;

	_unit setDamage 0;
	{_unit setVariable [_x, 0, true] } forEach ["cabeza", "pecho", "brazos", "piernas"];
	_unit setVariable ["sangrando", [0, 0, 0, 0], true];
	_unit setVariable ["inconsciente", false, true];
	_unit setVariable ["cegado", false, true];
	_unit setVariable ["toxicidad", 0, true];
	_unit setVariable ["dolor", false];
	_unit setVariable ["culpables", [[], [], [], [], [], [], [], [], [], []], true];
	_unit setVariable ["organos", [true, true, true], true];
	vehicle _unit setDamage 0;
	life_hunger = 100;
	life_thirst = 100;
	cutText[format["%1 Curado/Reparado !",_name],"PLAIN"];