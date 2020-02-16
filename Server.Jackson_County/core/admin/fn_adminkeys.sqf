#include <macro.h>
/*
	File: fn_adminKeys.sqf
    Author: tenshi
*/
private["_curTarget","_vehicle","_nearVehicles"];
_curTarget = cursorTarget;
_vehicle = cursorTarget;

if(__GETC__(life_adminlevel) < 1) exitWith {closeDialog 0; hint localize "STR_ANOTF_ErrorLevel";};

if(!isNull _curTarget) then {

	if(!(_vehicle in life_vehicles)) then
	{
		life_vehicles set[count life_vehicles,_vehicle];
	};


} else {

	_nearVehicles = nearestObjects[getPos player,["Car","Air","Ship","Truck"],10];
	if(count _nearVehicles > 0) then
	{
		{
			if(!isNil "_vehicle") exitWith {}; //Kill the loop.

				if(!(_x in life_vehicles)) then
					{
					life_vehicles set[count life_vehicles,_x];
					};

		} foreach _nearVehicles;
	};


};
