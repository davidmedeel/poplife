/*
	File: fn_civLoadout.sqf
	Author: Bryan "Tonic" Boardwine
	Edited: Itsyuka

	Description:
	Loads the civs out with the default gear.
*/
private["_handle"];
_handle = [] spawn life_fnc_stripDownPlayer;
waitUntil {scriptDone _handle};


_uni = "U_C_Commoner1_1";
player forceAddUniform _uni;


{
	player addItem _x;
	player assignItem _x;
} forEach ["ItemMap", "ItemCompass", "ItemWatch", "ItemRadio"];

/*player addItem "tf_anprc148jem";
player assignItem "tf_anprc148jem";*/

// Canales por defecto de TFAR

/*[(call TFAR_fnc_activeSwRadio), 1, "512"] call TFAR_fnc_SetChannelFrequency;
[(call TFAR_fnc_activeSwRadio), 2, "512"] call TFAR_fnc_SetChannelFrequency;
[(call TFAR_fnc_activeSwRadio), 3, "512"] call TFAR_fnc_SetChannelFrequency;
[(call TFAR_fnc_activeSwRadio), 4, "512"] call TFAR_fnc_SetChannelFrequency;
[(call TFAR_fnc_activeSwRadio), 5, "512"] call TFAR_fnc_SetChannelFrequency;
[(call TFAR_fnc_activeSwRadio), 6, "512"] call TFAR_fnc_SetChannelFrequency;
[(call TFAR_fnc_activeSwRadio), 7, "512"] call TFAR_fnc_SetChannelFrequency;
[(call TFAR_fnc_activeSwRadio), 8, "512"] call TFAR_fnc_SetChannelFrequency;*/

[] call life_fnc_saveGear;

