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

if ((lbCurSel 29552) isEqualTo -1) exitWith {hint (["STR_YOU_MSUT_SELECT_WHITELIST"] call max_whitelist_fnc_localize)};
_type = lbData[29552,(lbCurSel 29552)];

if (_type select [0,8] == "coplevel") exitWith {hint (["STR_CANT_REMOVE_COP_LEVEL"] call max_whitelist_fnc_localize);};
if (_type select [0,8] == "medlevel") exitWith {hint (["STR_CANT_REMOVE_MED_LEVEL"] call max_whitelist_fnc_localize);};

if(!isClass (missionConfigFile >> "Licenses" >> _type)) exitWith {};
_displayName = M_CONFIG(getText,"Licenses",_type,"displayName");
_sideFlag = M_CONFIG(getText,"Licenses",_type,"side");
_varName = LICENSE_VARNAME(_type,_sideFlag);
_bool = false;

[_unit,_varName,_bool,player,_displayName] remoteExecCall ["max_whitelist_fnc_whitelist",_unit];
hint format [(["STR_SUCCES_REMOVE_WHITELIST"] call max_whitelist_fnc_localize),localize _displayName,_unit getVariable ["realname",name _unit]];
