/*
	File: fn_restrainAction.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Retrains the target.
*/
private["_unit"];
_unit = cursorTarget;
if(isNull _unit) exitWith {}; //Not valid
if((player distance _unit > 3)) exitWith {};
//if((_unit getVariable "restrained")) exitWith {};
if(_unit getVariable "PoliON") exitWith {};
if(player == _unit) exitWith {};
if(!isPlayer _unit) exitWith {};

if !((["pop_esposas"] call ica_fnc_tengo) >= 1) then {
	hint "No tienes esposas";
} else {
    ["pop_esposas", -1] call ica_fnc_item;
    //Broadcast!
    _unit say3D "handcuffs";
    _unit setVariable["restrained",true,true];
	_unit setvariable ["esposado",true,true];
    hint "El objetivo está esposado";
    //[[player], "life_fnc_restrain", _unit, false] call life_fnc_MP;
	
	[player] remoteExec ["max_restrain_fnc_restrain",_unit]; 
	
  //  [[0,"STR_NOTF_Restrained",true,[_unit getVariable["realname", name _unit], profileName]],"life_fnc_broadcast",west,false] call life_fnc_MP;
	[0,"STR_NOTF_Restrained",true,[_unit getVariable["realname", name _unit], profileName]] remoteExec ["life_fnc_broadcast"];
};