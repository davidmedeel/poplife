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
/*
    File: fn_updatePartial.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Takes partial data of a player and updates it, this is meant to be
    less network intensive towards data flowing through it for updates.
*/
private ["_uid","_value","_query"];
_uid = [_this,0,"",[""]] call BIS_fnc_param;
_value = [_this,1,0,[0]] call BIS_fnc_param;

if (_uid isEqualTo "") exitWith {}; //Bad.
_query = "";

_query = format ["UPDATE players SET coplevel='%1' WHERE playerid='%2'",_value,_uid];

if (_query isEqualTo "") exitWith {};
[_query,1] call DB_fnc_asyncCall;
