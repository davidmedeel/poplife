/*
	File: fn_robPerson.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Getting tired of adding descriptions...
*/
private["_robber"];
_robber = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _robber) exitWith {}; //No one to return it to?

if(pop_din > 0) then
{
	if (_robber getVariable "PoliON") then 
	{
		pop_din = 0;
		//[[pop_din],"life_fnc_robReceive",_robber,false] call life_fnc_MP;
		[pop_din] remoteexec ["life_fnc_robReceive",_robber];
	} else {
	//[[pop_din],"life_fnc_robReceive",_robber,false] call life_fnc_MP;
	[pop_din] remoteexec ["life_fnc_robReceive",_robber];
	//[[getPlayerUID _robber,_robber getVariable["realname",name _robber],"211"],"life_fnc_wantedAdd",false,false] call life_fnc_MP;
	[getPlayerUID _robber,_robber getVariable["realname",name _robber],"211"] remoteexec ["life_fnc_wantedAdd",2];
	//[[1,"STR_NOTF_Robbed",true,[_robber getVariable["realname",name _robber],profileName,[pop_din] call life_fnc_numberText]],"life_fnc_broadcast",nil,false] call life_fnc_MP;
	[1,"STR_NOTF_Robbed",true,[_robber getVariable["realname",name _robber],profileName,[pop_din] call life_fnc_numberText]] remoteexec ["life_fnc_broadcast",nil];
	pop_din = 0;
	};
}
	else
{
	if (_robber getVariable "PoliON") then 
	{
		hint "No hay dinero que retirar";
	} else {
	//[[2,"STR_NOTF_RobFail",true,[profileName]],"life_fnc_broadcast",_robber,false] call life_fnc_MP;
	[2,"STR_NOTF_RobFail",true,[profileName]] remoteexec ["life_fnc_broadcast",_robber];
	};
};