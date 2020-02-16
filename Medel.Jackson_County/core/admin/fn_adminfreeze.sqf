#include <macro.h>
/*
    File: fn_adminFreeze.sqf
    Author: ColinM9991

    Description: Freezes selected player
*/
if(__GETC__(life_adminlevel) < 1) exitWith {closeDialog 0; hint localize "STR_ANOTF_ErrorLevel";};

private["_unit"];
_unit = lbData[2902,lbCurSel (2902)];
_unit = call compile format["%1", _unit];
if(isNil "_unit") exitWith {};
if(isNull _unit) exitWith {};
if(_unit == player) exitWith {hint localize "STR_ANOTF_Error";};

[player] remoteexeccall ["life_fnc_freezePlayer",_unit];
[0,format["ADMIN: %1 congelado / descongelado por %2.",_unit,profileName]] remoteexeccall ["life_fnc_broadcast",-2];