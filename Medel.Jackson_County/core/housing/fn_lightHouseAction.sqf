/*
	Author: Bryan "Tonic" Boardwine

	Description:
	Lights up the house.
*/
private["_house"];
_house = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _house) exitWith {};
if(!((typeOf _house) in listaCasas)) exitWith {};

if(isNull (_house getVariable ["lightSource",ObjNull])) then {
	//[[_house,true],"life_fnc_lightHouse",true,false] call life_fnc_MP;
	[_house,true] remoteexec ["life_fnc_lightHouse"];
} else {
	//[[_house,false],"life_fnc_lightHouse",true,false] call life_fnc_MP;
	[_house,false] remoteexec ["life_fnc_lightHouse"];
};