#include <macro.h>

switch (playerSide) do {

    // Policias
    case west: {

		if ((__GETC__(life_coplevel) == 0) && (__GETC__(life_adminlevel) == 0)) then {
			["NotWhitelisted", false, true] call BIS_fnc_endMission;
			sleep 35;
		};

		player setVariable ["rank", (__GETC__(life_coplevel)), true];
		player setVariable ["copLevel",1,true];
	};

	// Civiles
	case civilian: {

		if (life_is_arrested) then {
			noSpawn = true;
			life_is_arrested = false;
			[player,false,life_arrestMinutes,life_arrestReason] call fnc_sendtojail;
		};
		[] call life_fnc_zoneCreator;
		
		//Rex test
		if (__GETC__(life_coplevel) >= 1) then {
		player setVariable ["license_civ_EMSON",false];
		license_civ_policiaon = false;
		player setVariable ["copLevel",1,true];
	 };

		if (__GETC__(life_mediclevel) >= 1) then {
		player setVariable ["license_civ_policiaon",false];
		license_civ_policiaon = false;
		player setVariable ["copLevel",1,true];
	 };
	 
	};

	// Médicos
	case independent: {

		if ((__GETC__(life_medicLevel)) < 1) exitWith {
			["Notwhitelisted", FALSE, TRUE] call BIS_fnc_endMission;
			sleep 35;
		};
		player setVariable ["copLevel",1,true];
	};

	// Servicios pubicos
	case opfor: {

		if ((__GETC__(life_oplevel) == 0) && (__GETC__(life_adminlevel) == 0)) then {
			["NotWhitelisted", false, true] call BIS_fnc_endMission;
			sleep 35;
		};

	};
};

private ["_value"];

_value = parseNumber(ctrlText 9922);
if (_value < 0) exitWith {};
if (_value > 999999) exitWith {};
waitUntil {!(isNull (findDisplay 46))};

if (isNil {noSpawn}) then {
	[] call life_fnc_spawnMenu;
	waitUntil {!isNull (findDisplay 38500)};
    waitUntil {isNull (findDisplay 38500)};
};

player addRating 9999999;

/*rex if ((["pop_linterna"] call ica_fnc_tengo) == 0) then {
	["pop_linterna"] call ica_fnc_item;
};*/
