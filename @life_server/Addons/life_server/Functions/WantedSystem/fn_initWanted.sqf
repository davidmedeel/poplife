/*
	Creado por Rosen
*/

private ["_query","_queryResult","_lista"];
//_query = format["SacarDelitos"];
_query = format["SELECT list from wanted"];


_queryResult = [_query,2,true] call DB_fnc_asyncCall;
{
_lista = [_x select 0] call DB_fnc_mresToArray;
if(typeName _lista== "STRING") then {
	_lista = call compile format["%1", _lista];
};
life_wanted_list = _lista;
} forEach _queryResult;