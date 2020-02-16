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
private ["_category","_display","_list"];
_category = _this select 0;
disableSerialization;

_display = findDisplay 29550;
_list = _display displayCtrl 29552;

lbClear _list;

switch (_category) do {
	//CATEGORY 1
	case 1: {
	/*	_list lbAdd "Entreprise";
		_list lbSetData [(lbSize _list)-1,"variable_licence_entreprise"];*/
	};
	//CATEGORY 2
	case 2: {
	};
	//CATEGORY 3
	case 3: {
		for "_i" from 0 to getNumber(missionConfigFile >> "Max_Settings_WhitelistMenu" >> "max_cop_level") do {
			_list lbAdd format [(["STR_COP_LEVEL_LIST"] call max_whitelist_fnc_localize),_i];
			_list lbSetData [(lbSize _list)-1,format ["coplevel%1",_i]];
		};

		/*_list lbAdd "Pilote aérien";
		_list lbSetData [(lbSize _list)-1,"cAir"];*/
	};
	//CATEGORY 4
	case 4: {
		for "_j" from 0 to getNumber(missionConfigFile >> "Max_Settings_WhitelistMenu" >> "max_medic_level") do {
			_list lbAdd format [(["STR_MED_LEVEL_LIST"] call max_whitelist_fnc_localize),_j];
			_list lbSetData [(lbSize _list)-1,format ["medlevel%1",_j]];
		};
	};
};
