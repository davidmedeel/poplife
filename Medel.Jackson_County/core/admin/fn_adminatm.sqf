#include <macro.h>
/*
	File: fn_adminATM.sqf
    Author: tenshi	
*/

if(__GETC__(life_adminlevel) < 5) exitWith {closeDialog 0;};

[] call life_fnc_atmMenu;