#include <macro.h>
/*
	File: fn_adminArsenal.sqf
    Author: xSamiVS
*/
if(__GETC__(life_adminlevel) < 4) exitWith {closeDialog 0; hint "";};

closeDialog 0;
["Open",true] spawn BIS_fnc_arsenal;