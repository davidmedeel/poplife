#include <macro.h>
/*
    File: fn_adminTeleport.sqf
    Author: ColinM9991
    Credits: To original script author(s)
    Description:
    Teleport to chosen position.
*/
if(__GETC__(life_adminlevel) < 1) exitWith {closeDialog 0;};

closeDialog 0;
tele={
    _pos = [_this select 0, _this select 1, _this select 2];
    (vehicle player) setpos [_pos select 0, _pos select 1, 0];
    onMapSingleClick "";
    openMap [false, false];
    hint "Te has teletransportado a la posicion indicada.";
	//[format ["%1 ha usado la funcion TP.", name player], "hint", true, false, false] call BIS_fnc_MP;
};
openMap [true, false];
onMapSingleClick "[_pos select 0, _pos select 1, _pos select 2] call tele";