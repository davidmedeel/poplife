#include <macro.h>
/*
	Author: Bryan "Tonic" Boardwine

	Description:
	Deposits money into the players gang bank.
*/
private["_value"];
_value = parseNumber(ctrlText 2702);

//Series of stupid checks
if(_value > 999999) exitWith {hint localize "STR_ATM_GreaterThan";};
if(_value < 0) exitWith {};
if(!([str(_value)] call life_fnc_isnumeric)) exitWith {hint localize "STR_ATM_notnumeric"};
if(_value > medel_atmdin) exitWith {hint localize "STR_NOTF_NotEnoughFunds"};

__SUB__(medel_atmdin,_value);
_gFund = grpPlayer getVariable ["gang_bank",0];
_gFund = _gFund + _value;
grpPlayer setVariable ["gang_bank",_gFund,true];

hint format[localize "STR_ATM_DepositGang",[_value] call life_fnc_numberText];
[] call life_fnc_atmMenu;
[6] call SOCK_fnc_updatePartial; //Silent Sync
//[[1,grpPlayer],"TON_fnc_updateGang",false,false] call life_fnc_MP;
[1,grpPlayer] remoteexec ["TON_fnc_updateGang",2];
