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
params [
	["_unit",objNull,[objNull]],
	["_varName","",[""]],
	["_bool",false,[false]],
	["_from",objNull,[objNull]],
    ["_displayName","",[""]]
];

if (isNull _unit || isNull _from) exitWith {};
if (player != _unit) exitWith {};
missionNamespace setVariable [_varName,_bool];

if !(_bool) then {
    hint format [(["STR_WHITELIST_REMOVED"] call max_whitelist_fnc_localize),localize _displayName,_from getVariable ["realname",name _from]];
} else {
    hint format [(["STR_WHITELIST_ADDED"] call max_whitelist_fnc_localize),localize _displayName,_from getVariable ["realname",name _from]];
};

[2] call SOCK_fnc_updatePartial;
