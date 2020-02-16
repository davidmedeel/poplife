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
private ["_display","_list1","_list2","_side"];
disableSerialization;

waitUntil {!isNull (findDisplay 29550)};

_display = findDisplay 29550;
(_display displayCtrl 45545) ctrlSetText (["STR_MENU_HEADER"] call max_whitelist_fnc_localize);
(_display displayCtrl 5447) ctrlSetText (["STR_MENU_PLAYERS"] call max_whitelist_fnc_localize);
(_display displayCtrl 44544) ctrlSetText (["STR_MENU_WHITELISTS"] call max_whitelist_fnc_localize);
(_display displayCtrl 8550) ctrlSetText (["STR_MENU_ADD"] call max_whitelist_fnc_localize);
(_display displayCtrl 54656) ctrlSetText (["STR_MENU_REMOVE"] call max_whitelist_fnc_localize);
//(_display displayCtrl 29553) ctrlSetText (["STR_CATEGORY_1"] call max_whitelist_fnc_localize);
//(_display displayCtrl 29554) ctrlSetText (["STR_CATEGORY_2"] call max_whitelist_fnc_localize);
(_display displayCtrl 29555) ctrlSetText (["STR_CATEGORY_3"] call max_whitelist_fnc_localize);
(_display displayCtrl 29556) ctrlSetText (["STR_CATEGORY_4"] call max_whitelist_fnc_localize);

_list1 = _display displayCtrl 29551;
_list2 = _display displayCtrl 29552;

lbClear _list1;
lbClear _list2;

{
	_side = switch (side _x) do {case west: {(["STR_SIDE_WEST"] call max_whitelist_fnc_localize)}; case civilian: {(["STR_SIDE_CIVILIAN"] call max_whitelist_fnc_localize)}; case independent: {(["STR_SIDE_INDEPENDENT"] call max_whitelist_fnc_localize)}; default {(["STR_SIDE_UNKNOWN"] call max_whitelist_fnc_localize)};};
    _list1 lbAdd format ["%1 - %2", _x getVariable ["realname",name _x],_side];
    if (_x getVariable ["realname",name _x] isEqualTo name player) then {
    	_list1 lbSetColor [(lbSize _list1)-1,[0,255,0,1]];
	};
    _list1 lbSetdata [(lbSize _list1)-1,str(_x)];
} forEach playableUnits;

_list2 lbAdd (["STR_CHOOSE_CATEGORY"] call max_whitelist_fnc_localize);
