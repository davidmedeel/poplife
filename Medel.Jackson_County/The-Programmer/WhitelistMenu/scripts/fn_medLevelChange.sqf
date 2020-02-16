#include "..\..\script_macros.hpp"
/*
    Author: Maxence Lyon
    Altis DEV: https://altisdev.com/user/maxence-lyon
    Teamspeak 3: ts.the-programmer.com
    Web site: www.the-programmer.com
    Steam: « Une Vache Sur CS – Maxence », please leave a message on my profile who says the exact reason before adding me.

    Terms of use:
    	- This file is forbidden unless you have permission from the author. If you have this file without permission to use it please do not use it and do not share it.
    	- If you have permission to use this file, you can use it on your server however it is strictly forbidden to share it.
    	- Out of respect for the author please do not delete this information.

    License number:
    Server's name:
    Owner's name:
*/
private ["_unit","_type","_displayName","_sideFlag","_varName","_bool"];
if (FETCH_CONST(life_adminlevel) < 1) exitWith {closeDialog 0;};
if ((lbCurSel 29551) isEqualTo -1) exitWith {hint localize "STR_NOTF_didNotSelectPlayer"};
_unit = lbData [29551,(lbCurSel 29551)];
_unit = call compile format ["%1",_unit];
if (isNil "_unit") exitWith {};
if (isNull _unit) exitWith {};

_value = lbData[29552,(lbCurSel 29552)];
_value = parseNumber (_value select [8,count _value - 1]);

[getPlayerUID _unit,_value] remoteExecCall ["max_whitelist_fnc_updateMedLevel",2];

hint format [(["STR_SUCCES_CHANGE_MED_LEVEL_X"] call max_whitelist_fnc_localize),_unit getVariable ["realname",name _unit],_value];
[1,format [(["STR_SUCCES_GET_CHANGED_MED_LEVEL"] call max_whitelist_fnc_localize),name player,_value]] remoteExecCall ["life_fnc_broadcast",_unit];