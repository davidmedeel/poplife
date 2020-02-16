#include <macro.h>
/*
	File: fn_adminGDY.sqf
    Author: tenshi	
*/
if(__GETC__(life_adminlevel) < 4) exitWith {closeDialog 0; hint "";};

closeDialog 0;
["Open",true] spawn BIS_fnc_arsenal;