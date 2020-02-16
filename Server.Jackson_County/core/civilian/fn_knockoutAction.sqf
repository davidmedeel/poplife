/*
	File: fn_knockoutAction.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Knocks out the target.
*/
private["_target"];
_target = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;

//Error checks
if(isNull _target) exitWith {};
if(!isPlayer _target) exitWith {};
if(player distance _target > 4) exitWith {};
life_knockout = true;
[[player,"CL3_anim_WeaponHit"],"life_fnc_animSync",nil,false] call life_fnc_MP;
//[player,"CL3_anim_WeaponHit"] remoteexec ["life_fnc_animSync",nil];
sleep 0.08;
[[_target,profileName],"life_fnc_knockedOut",_target,false] call life_fnc_MP;
//[_target,profileName] remoteexec ["life_fnc_knockedOut",_target];

sleep 3;
life_knockout = false;