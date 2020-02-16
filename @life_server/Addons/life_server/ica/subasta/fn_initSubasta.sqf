
/*
por: Icaruk
	["init"] spawn ica_fnc_initSubasta;
	["almacen1"] spawn ica_fnc_initSubasta;
*/

_param = _this select 0;

_tiempoSubasta = (60 * 15);
_tiempoReset = (60 * 60);
// _tiempoSubasta = 10;
// _tiempoReset = 10;

if (_param isEqualTo "init") exitWith {
	
	subastaActual = "";
	Almacen1 = ["", 0, _tiempoSubasta];
	Almacen2 = ["", 0, _tiempoSubasta];
	Comercios = ["", 0, _tiempoSubasta];
	Transportes = ["", 0, _tiempoSubasta];
	Mineria = ["", 0, _tiempoSubasta];

	benAlmacen1 = 0;
	benAlmacen2 = 0;
	benComercios = 0;
	benTransportes = 0;
	benMineria = 0;
};


//[[8, "Subastalia informa", [0,1,0], 1.8, format ['La subasta "%1" empezará en 5 minutos', _param], [1,1,1], 1.4], "ica_fnc_anuncio", CIVILIAN, false, false] call life_fnc_MP;
[8, "Subastalia informa", [0,1,0], 1.8, format ['La subasta "%1" empezará en 5 minutos', _param], [1,1,1], 1.4] remoteexec ["ica_fnc_anuncio",civilian];

while {true} do {
	missionNamespace setVariable [_param, [(missionnamespace getVariable _param) select 0, (missionnamespace getVariable _param) select 1, ((missionnamespace getVariable _param) select 2) - 1]]; // [subasta, tiempo]
	
	if (((missionnamespace getVariable _param) select 2) <= 0) exitWith {		// tiempo llega a 0 y acabo el loop
		_gente = [];
		{_gente = _gente + [name _x]} forEach PlayableUnits;
		
		if (((missionnamespace getVariable _param) select 0) in _gente) then {
			//[[(missionnamespace getVariable _param) select 0, (missionnamespace getVariable _param) select 1], 'ica_fnc_ganoSubasta', true, true] call life_fnc_MP; // [quien, cuanto]
			[(missionnamespace getVariable _param) select 0, (missionnamespace getVariable _param) select 1] remoteexec ["ica_fnc_ganoSubasta",-2];
			subastaActual = "";
			publicVariableServer "subastaActual";
			sleep _tiempoReset;
			missionnamespace setVariable [_param, ["", 0, _tiempoSubasta]];
		} else {
			subastaActual = "";
			publicVariableServer "subastaActual";
			missionnamespace setVariable [_param, ["", 0, _tiempoSubasta]];
			//[format ['La subasta "%1" se tiene que reiniciar porque el ganador ha dejado de existir (no es broma).', _param],"systemChat",nil,false] call life_fnc_MP;
			[format ['La subasta "%1" se tiene que reiniciar porque el ganador ha dejado de existir (no es broma).', _param]] remoteexec ["systemChat",nil];
		};
	};
	sleep 1;
};	
