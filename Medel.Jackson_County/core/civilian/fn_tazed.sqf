/*
	File: fn_tazed.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Starts the tazed animation and broadcasts out what it needs to.
*/
private["_unit","_shooter","_curWep","_curMags","_attach"];
_unit = [_this,0,Objnull,[Objnull]] call BIS_fnc_param;
_shooter = [_this,1,Objnull,[Objnull]] call BIS_fnc_param;
if(isNull _unit OR isNull _shooter) exitWith {player allowDamage true; life_istazed = false;};

if(_shooter isKindOf "Man" && alive player) then
{
	if(!life_istazed) then
	{


		//SUICIDE BOMB
		if(vest player == "A3L_SuicideVest") then
		{
		private["_bomb"];
		_bomb="HelicopterExploSmall"createvehiclelocal(getPos player);
		if(alive player) then {player setDamage 1;};
		//[[0,format["%1 Fue Tasado y exploto el Chaleco bomba!",name player]],"life_fnc_broadcast",true,false] call life_fnc_MP;
		[0,format["%1 Fue Tasado y exploto el Chaleco bomba!",name player]] remoteexec  ["life_fnc_broadcast"];
		};



		life_istazed = true;
		_curWep = currentWeapon player;
		_curMags = magazines player;
		_attach = if(primaryWeapon player != "") then {primaryWeaponItems _unit} else {[]};
		{player removeMagazine _x} foreach _curMags;
		player removeWeapon _curWep;
		player addWeapon _curWep;
		if(count _attach != 0 && primaryWeapon _unit != "") then
		{
			{
				_unit addPrimaryWeaponItem _x;
			} foreach _attach;
		};
		if(count _curMags != 0) then
		{
			{player addMagazine _x;} foreach _curMags;
		};

	//	[[_unit],"life_fnc_tazeSound",true,false] call life_fnc_MP;
		[_unit] remoteexec ["life_fnc_tazeSound"];
		_obj = "land_cluttercutter_small_f" createVehicle (getPosATL _unit);
		_obj setPosATL (getPosATL _unit);
		//[[player,"AinjPfalMstpSnonWnonDf_carried_fallwc"],"life_fnc_animSync",true,false] call life_fnc_MP;
		[player,"AinjPfalMstpSnonWnonDf_carried_fallwc"] remoteexec ["life_fnc_animSync"];
		// [[_unit,"AinjPfalMstpSnonWnonDf_carried_fallwc"],"fnc_animsync",true,false] call life_fnc_MP;
		//[[0,"STR_NOTF_Tazed",true,[profileName, _shooter getVariable["realname",name _shooter]]],"life_fnc_broadcast",true,false] call life_fnc_MP;
		[0,"STR_NOTF_Tazed",true,[profileName, _shooter getVariable["realname",name _shooter]]] remoteexec ["life_fnc_broadcast"];
		_unit attachTo [_obj,[0,0,0]];
		disableUserInput true;
		sleep 15;
		//[[player,"amovppnemstpsraswrfldnon"],"life_fnc_animSync",true,false] call life_fnc_MP;
		[player,"amovppnemstpsraswrfldnon"] remoteexec ["life_fnc_animSync"];
		if(!(player getVariable["Escorting",false])) then {
			detach player;
		};
		life_istazed = false;
		player allowDamage true;
		disableUserInput false;
	};
}
	else
{
	_unit allowDamage true;
	life_iztazed = false;
};