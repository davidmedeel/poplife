#include <macro.h>
/*
    File: fn_adminMenu.sqf
    Author: Bryan "Tonic" Boardwine
    
    Description:
    Opens the admin menu, sorry nothing special in here. Take a look for yourself.
*/
if(__GETC__(life_adminlevel) < 1) exitWith {closeDialog 0;};
if (dialog) exitWith {};
private["_display","_list","_side"];
createDialog "Menu_Admin";
disableSerialization;
waitUntil {!isNull (findDisplay 2900)};

if(__GETC__(life_adminlevel) < 1) exitWith {closeDialog 0;};

/*switch(__GETC__(life_adminlevel)) do
{
    case 1: {
		ctrlShow [2904,false];
		ctrlShow [2905,false];
		ctrlShow [2906,false];
		ctrlShow [2907,false];
		ctrlShow [2908,false];
		//ctrlShow [2909,false];
		ctrlShow [2910,false];
		ctrlShow [2911,false];
		ctrlShow [2912,false];
		ctrlShow [2913,false];
		ctrlShow [2914,false];
		ctrlShow [2915,false];
		ctrlShow [2916,false];
		ctrlShow [2918,false];
		ctrlShow [2950,false];
		ctrlShow [2919,false];
		//ctrlShow [6900,false];
		//ctrlShow [6847,false];
		//ctrlShow [2052,false];
	};
    case 2: {
	ctrlShow [2905,false];ctrlShow [2906,false];ctrlShow [2907,false];ctrlShow [2909,false];ctrlShow [2910,false];ctrlShow [2911,false];ctrlShow [2914,false];ctrlShow [2915,false];ctrlShow [2917,false];ctrlShow [2918,false]
	}; 
	case 3: {};
    case 4: {};
};*/
while {!(isNull (findDisplay 2900))} do {
if (isNull (findDisplay 2900)) exitWith{};
_display = findDisplay 2900;
_list = _display displayCtrl 1500;
_txt = ctrlText (_display displayCtrl 1400);
if((_txt != '') && (_txt != 'Buscar jugador'))then	{
	_txt = toLower _txt;
	lbClear _list;
	{
	_nombre = _x getVariable["realname",name _x];
	if((toLower _nombre) find _txt > -1)then {
		_side = switch(side _x) do {case west: {"Cop"}; case civilian : {"Civ"}; case independent : {"Med"}; default {"Unknown"};};
		_list lbAdd format["%1 - %2", _x getVariable["realname",name _x],_side];
		_list lbSetdata [(lbSize _list)-1,str(_x)];
	};
	} foreach playableUnits;
	lbSort [_list, "ASC"];
	waitUntil {(ctrlText (_display displayCtrl 1400)) != _txt || (isNull (findDisplay 2900))};
};
if (_txt isEqualTo '' || _txt isEqualTo 'Buscar jugador') then {
	lbClear _list;

	{
		_side = switch(side _x) do {case west: {"Cop"}; case civilian : {"Civ"}; case independent : {"Med"}; default {"Unknown"};};
		_list lbAdd format["%1 - %2", _x getVariable["realname",name _x],_side];
		_list lbSetdata [(lbSize _list)-1,str(_x)];
	} foreach playableUnits;
	lbSort [_list, "ASC"];
	waitUntil {(ctrlText (_display displayCtrl 1400)) != '' || (isNull (findDisplay 2900)) || (ctrlText (_display displayCtrl 1400)) != 'Buscar jugador'};
};
uiSleep 0.1;
};
/*
lbClear _list;

{
    _side = switch(side _x) do {case west: {"Cop"}; case civilian : {"Civ"}; case independent : {"Med"}; default {"Unknown"};};
    _list lbAdd format["%1 - %2", _x getVariable["realname",name _x],_side];
    _list lbSetdata [(lbSize _list)-1,str(_x)];
} foreach playableUnits;
lbSort [_list, "ASC"]; // ica
*/
if(__GETC__(life_adminlevel) < 1) exitWith {closeDialog 0;};