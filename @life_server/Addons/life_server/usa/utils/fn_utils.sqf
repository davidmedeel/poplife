["usa_fnc_tiempo", {

	_param1 = _this select 0;

	skipTime _param1;
}, false] call usa_server_compilar;


["usa_fnc_loop", {

	params[
	"_code",
	["_sleep",0,[0]]
	];

	for "_i" from 0 to 1 step 0 do {
		call _code;
		sleep _sleep;
	};

}, false] call usa_server_compilar;

["usa_fnc_createsTask", {

	_quien = _this select 0;
	_pos = _this select 1;
	_nombreTarea = _this select 2;
	//Opcional
	_desc = _this select 3;
	_descC = _this select 4;
	_descH = _this select 5;
	
	[player, [_nombreTarea], [_desc, _descC, _descH], [0,0,0] ,1, 2, true] call BIS_fnc_taskCreate;  
	[_nombreTarea,_pos] call BIS_fnc_taskSetDestination;
    [_nombreTarea,"ASSIGNED",true] call BIS_fnc_taskSetState;

}, false] call usa_server_compilar;

["usa_fnc_borrarTask", {
	_nombreTarea = _this select 0;

//	[_nombreTarea,"CANCELED",false] call BIS_fnc_taskSetState;
	[_nombreTarea, player] call BIS_fnc_deleteTask;
	["chino2", player] call BIS_fnc_deleteTask;
}, false] call usa_server_compilar;
