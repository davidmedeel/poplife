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
if (player getVariable ["menote",false]) exitWith {};
if (player getVariable ["Escorting",false]) exitWith {};
if (vehicle player != player) exitWith {};
_vehicle = vehicle player;
if (speed player > 10) exitWith {};

if (player getVariable ["playerSurrender",false]) exitWith {
    player setVariable ["playerSurrender",false,true];
    player setVariable ["restrained",false,true];
    //player setvariable ["esposado",false,true];
};

player setVariable ["playerSurrender",true,true];
player setVariable ["restrained",true,true];
//player setvariable ["esposado",true,true];
_haveWeapon = false;

if !(currentWeapon player isEqualTo "") then {
    player action ["SwitchWeapon",player,player,100];
    _haveWeapon = true;
    uiSleep 3;
};

life_disable_getIn = true;
life_disable_getOut = false;
_state = vehicle player;
while {player getVariable ["playerSurrender",false]} do {
    if !(player getVariable ["playerSurrender",false]) exitWith {};
    if !(currentWeapon player isEqualTo "") exitWith {player setVariable ["playerSurrender",false,true];};
    if (isNull objectParent player) then {
        player playAction "The_Programmer_Surrender";
    };

    if (player getVariable ["menote",false]) exitWith {};

    if ((getNumber (missionConfigFile >> "Max_Settings_Restrain" >> "disable_sprint")) isEqualTo 1) then {
        player allowSprint false;
    };

    if (!(player getVariable "restrained") || vehicle player != _state) then {
        if (!alive player) exitWith {
            player setVariable ["restrained",false,true];
            //player setvariable ["esposado",false,true];
            player setVariable ["Escorting",false,true];
            player setVariable ["transporting",false,true];
            player setVariable ["playerSurrender",false,true];
            detach player;
        };

        if (!(isNull objectParent player) && life_disable_getIn) then {
            player action ["eject",vehicle player];
        };

        if (!(isNull objectParent player) && !(vehicle player isEqualTo _vehicle)) then {
            _vehicle = vehicle player;
        };

        if (isNull objectParent player && life_disable_getOut) then {
            player moveInCargo _vehicle;
        };

        if (!(isNull objectParent player) && life_disable_getOut && (driver (vehicle player) isEqualTo player)) then {
            player action ["eject",vehicle player];
            player moveInCargo _vehicle;
        };

        if (!(isNull objectParent player) && life_disable_getOut) then {
            _turrets = [[-1]] + allTurrets _vehicle;
            {
                if (_vehicle turretUnit [_x select 0] isEqualTo player) then {
                    player action ["eject",vehicle player];
                    sleep 1;
                    player moveInCargo _vehicle;
                };
            } forEach _turrets;
        }; 
    };
    uiSleep 1;
};

if (player getVariable ["menote",false]) exitWith {};
player setVariable ["restrained",false,true];
//player setvariable ["esposado",false,true];
player allowSprint true;

if (_haveWeapon) then {
    player switchMove "default";
} else {
    player switchMove "AmovPercMstpSlowWrflDnon_SaluteIn";
};
