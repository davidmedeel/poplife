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
private ["_cop","_vehicle"];
_cop = [_this,0,objNull,[objNull]] call BIS_fnc_param;
_vehicle = vehicle player;
if (isNull _cop) exitWith {};

player setVariable ["menote",true];
if (player getVariable ["playerSurrender",false]) then {player setVariable ["playerSurrender",false,true];};

[] spawn {
    _time = time;
    waitUntil {(time - _time) > (getNumber (missionConfigFile >> "Max_Settings_Restrain" >> "automatic_unrestrain_time"))};

    player setVariable ["restrained",false,true];
    player setVariable ["Escorting",false,true];
    player setVariable ["transporting",false,true];
    detach player;
    titleText[localize "STR_Cop_ExcessiveRestrain","PLAIN"];
};

titleText[format [localize "STR_Cop_restrained",_cop getVariable ["realname",name _cop]],"PLAIN"];

life_disable_getIn = true;
life_disable_getOut = false;
_state = vehicle player;

while {player getVariable "restrained"} do {
    if (isNull objectParent player) then {
        player playAction "The_Programmer_Restrain";
    };

    if ((getNumber (missionConfigFile >> "Max_Settings_Restrain" >> "disable_sprint")) isEqualTo 1) then {
        player allowSprint false;
    };

    if (!(player getVariable "restrained") || vehicle player != _state) then {
        if (!alive player) exitWith {
            player setVariable ["restrained",false,true];
            player setVariable ["Escorting",false,true];
            player setVariable ["transporting",false,true];
            detach player;
        };

        if (!alive _cop) then {
            player setVariable ["Escorting",false,true];
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

player setVariable ["menote",false];
player allowSprint true;

if (alive player) then {
    player switchMove "AmovPercMstpSlowWrflDnon_SaluteIn";
    player setVariable ["Escorting",false,true];
    player setVariable ["transporting",false,true];
    detach player;
};
