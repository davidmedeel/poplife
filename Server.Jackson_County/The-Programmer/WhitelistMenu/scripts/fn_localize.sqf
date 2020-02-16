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
_key = [_this,0,"",[""]] call BIS_fnc_param;
_lang = getText (missionConfigFile >> "Max_Settings_WhitelistMenu" >> "default_lang");

_return = _key;
_cfgEntry = missionConfigFile >> "WhitelistMenu_Localization" >> _key;

if (isClass _cfgEntry) then {
	_return = getText (_cfgEntry >> _lang);
};

_return