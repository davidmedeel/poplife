/*

Control de velocidad
por: Apecengo

Recibe una llamada desde un trigger.

MAL, CAMBIAR
Parámetros:
	0: Número, límite de velocidad
	1: String, nombre público del radar
	2: Jugador, jugador que va en el vehículo

[limite, "Nombre del radar", jugador] call ape_fn_controlvelocidad;
[120, "Autopista Morrison-Lakeside PK.5", player] ape_fn_controlvelocidad

Condición trigger:
this && (local player) && (vehicle player in thisList)

Script en el trigger:
[120, "Nombre autopista", player] call ape_fnc_controlvelocidad

*/

params ["_limit", "_name", "_speed", "_player"];

private["_fineCalc", "_vehicle", "_speed", "_trigger", "_license", "_fine", "_percentage", "_plate", "_points", "_speeltime", "_text"];

_vehicle = vehicle _player;
_speed = speed _vehicle;
_speed = round _speed;

// Comprobar que se haya superado el límite de velocidad
if(_speed <= _limit) exitWith {};

// Comprobar que el jugador esté montado a un vehículo
if(_player == _vehicle) exitWith {};

// Comprobar que el jugador sea civil
if(side _player != civilian) exitWith {};

// Comprobar que el jugador sea el conductor
if(_player != driver _vehicle) exitWith {};

// Los radares tienen un margen de error...
// Si el límite es = o menor de 100, es el límite + 10
if(_limit <= 100) then {
	_trigger = _limit + 10;
} else {
	// Si el límite es +100, el margen es 110% del límite
	_trigger = round (limit * 1.10);
};

if(_speed < _trigger) exitWith {};

// Aquí estaría bien añadir un sleep random de x tiempo para que la gente tenga la incertidumbre de si le ha saltado o no...
// _tiempo = random 15;
// sleep _tiempo (...)
//sleep _sleeptime;

playSound "fotoradar";
cutText ["","WHITE OUT",0.5];
cutText ["","WHITE IN",0.5];

// Ahora, la cantidad también depende de la velocidad a la que íbamos...
// Para simplificarlo, lo haré en base a una función con un máximo, pero siguiendo una fórmula

_fineCalc = [_limit, _speed] call ica_fnc_calcmulta;

_fine = _fineCalc select 0;

// Si encima no tiene el permiso de conducir, le sumamos un plus fijo
_license = license_civ_driver;

if(!_license) then {
	_fine = _fine + 500; // Cantidad a sumar si no tiene el carnet
};

_points = _fineCalc select 1;

_plate = _vehicle getVariable "matricula";

_text = format ["CIRCULAR A %1 KM/H, TENIENDO LIMITADA LA VELOCIDAD A %2 KM/H. CINEMOMETRO MULTAPOP QUE HA SIDO SOMETIDO AL CONTROL METEOROLÓGICO LEGALMENTE ESTABLECIDO.", _speed, _limit];

// Llamamos al sistema de sanciones
[_fine, _points, _text, _name, _plate, true] spawn ica_fnc_sancion;


// ... y ya estaría.

/*
private ["_limit","_speed","_conductor","_ticket","_ticketWL"];
_conductor = _this select 0;
_speed = _this select 1;
_limit = _this select 2;
//if (vehicle _conductor isequalto _conductor) exitwith {};
if !(((driver vehicle _conductor) == _conductor)) exitwith {};
_dueno = (vehicle _conductor) getVariable "vehicle_info_owners" select 0 select 1;
//_duenoID = (vehicle _conductor) getVariable "vehicle_info_owners" select 0 select 0;
//_ticket = 1500;//perm set amount ticket
_ticket = (_speed - _limit) * 100;//variable ticket for licensed driver
_ticketWL = (_speed - _limit) * 200;//variable ticket for unlicensed driver
//diag_log format["Ticket Fine: %1 - Sp: %2 -- Limit: %3",_ticket,_speed,_limit];
if (_speed > _limit) then {
	if (side _conductor == civilian) then {
			if(isNil "puntos_carnet") then {puntos_carnet = 0};
			if(isNil "life_speedCaught") then {life_speedCaught = 0};
			diag_log format["Dueño del vehiculo:%1 :: Velocidad:%2 :: Limite de velocidad:%3 ::Multa: %4",_dueno,round _speed,_limit,[_ticket] call life_fnc_numberText];
			//player say3d "PhotoSound";//photosound and ppEffects from prellers radar script
			sleep 0.05;
			"colorCorrections" ppEffectEnable true;
			"colorCorrections" ppEffectAdjust [1, 15, 0, [0.5, 0.5, 0.5, 0], [0.0, 0.5, 0.0, 1],[0.3, 0.3, 0.3, 0.05]];
			"colorCorrections" ppEffectCommit 0;
			sleep 0;
			"colorCorrections" ppEffectAdjust [1, 1, 0, [1, 1, 1, 0.0], [1, 1, 1, 1],  [1, 1, 1, 1]];
			"colorCorrections" ppEffectCommit 0.05;
			sleep 0.05;
			"colorCorrections" ppEffectEnable false;
			sleep 0.1;
			"colorCorrections" ppEffectEnable true;
			"colorCorrections" ppEffectAdjust [1, 15, 0, [0.5, 0.5, 0.5, 0], [0.0, 0.5, 0.0, 1],[0.3, 0.3, 0.3, 0.05]];
			"colorCorrections" ppEffectCommit 0;
			sleep 0;
			"colorCorrections" ppEffectAdjust [1, 1, 0, [1, 1, 1, 0.0], [1, 1, 1, 1],  [1, 1, 1, 1]];
			"colorCorrections" ppEffectCommit 0.05;
			sleep 0.05;
			"colorCorrections" ppEffectEnable false;
		if(license_civ_driver || license_civ_trucking ) then {
			puntos_carnet = puntos_carnet - 1;
			if(puntos_carnet == 0) exitWith {
					systemChat format["Te quedan %1 puntos del carnet!!!",puntos_carnet];
					hint parseText format ["<t color='#ffffff'><t size='2'><t align='center'>Speed Radar<br/><t color='#ff0000'><t align='center'><t size='1.5'>Velocidad: %1 km/h<br/><t color='#ffffff'><t align='center'><t size='1'> Limite de velocidad: %2 km/h<br/><t color='#ffffff'><t align='center'><t size='1'>Dueño del vehiculo: %3<br/>El dueño del vehiculo ha sido añadido a la lista de criminales",round _speed,_limit,_dueno];
					[2] call SOCK_fnc_updatePartial;
			};
			[_ticket,_speed,_limit] remoteExec ["life_fnc_multa",player];
			/*
			if(life_cash <= _ticket) then
			{
				if(life_atmcash <= _ticket) exitWith
				{
					hint parseText format ["<t color='#ffffff'><t size='2'><t align='center'>Speed Radar<br/><t color='#ff0000'><t align='center'><t size='1.5'>Speed: %1 km/h<br/><t color='#ffffff'><t align='center'><t size='1'>Speed Limit: %2 km/h<br/><t color='#ffffff'><t align='center'><t size='1'>Driver: %3<br/><t color='#ffffff'><t align='center'><t size='1'>Fine: %4€<br/>Since you are broke and cannot pay, you now have a warrant out for you instead",round _speed,_limit,name _conductor,[_ticket] call life_fnc_numberText];
					[[getPlayerUID _conductor,name _conductor,"120S"],"life_fnc_wantedAdd",false,false] spawn life_fnc_MP;
				};
				life_atmcash = life_atmcash - _ticket;
				hint parseText format ["<t color='#ffffff'><t size='2'><t align='center'>Speed Radar<br/><t color='#ff0000'><t align='center'><t size='1.5'>Speed: %1 km/h<br/><t color='#ffffff'><t align='center'><t size='1'>Speed Limit: %2 km/h<br/><t color='#ffffff'><t align='center'><t size='1'>Driver: %3<br/><t color='#ffffff'><t align='center'><t size='1'>Fine: %4€",round _speed,_limit,name _conductor,[_ticket] call life_fnc_numberText];
				diag_log "Ticket paid from player bank";
				[1] call SOCK_fnc_updatePartial;
			} else {

				life_cash = life_cash - _ticket;
				hint parseText format ["<t color='#ffffff'><t size='2'><t align='center'>Speed Radar<br/><t color='#ff0000'><t align='center'><t size='1.5'>Speed: %1 km/h<br/><t color='#ffffff'><t align='center'><t size='1'>Speed Limit: %2 km/h<br/><t color='#ffffff'><t align='center'><t size='1'>Driver: %3<br/><t color='#ffffff'><t align='center'><t size='1'>Fine: $%4",round _speed,_limit,name _conductor,[_ticket] call life_fnc_numberText];
				diag_log "Ticket paid from player cash";
				[0] call SOCK_fnc_updatePartial;
			};

		} else {
					life_speedCaught = life_speedCaught + 1;
					(format ["Un vehiculo (%2) con dueño(s): %1, han sido vistos por un radar en coordenadas %3 conduciendo sin carnet (%4 vez/veces)",_dueno,getText(configFile >> "CfgVehicles" >> (typeOf (vehicle _conductor)) >> "displayName"),mapGridPosition _conductor,life_speedCaught]) remoteexeccall ["hint",_conductor];


					[_ticketWL,_speed,_limit] remoteExec ["life_fnc_multa",player];
					/*
					if(life_cash <= _ticketWL) then
					{
						if(life_atmcash <= _ticketWL) exitWith
						{
							hint parseText format ["<t color='#ffffff'><t size='2'><t align='center'>Speed Radar<br/><t color='#ff0000'><t align='center'><t size='1.5'>Speed: %1 km/h<br/><t color='#ffffff'><t align='center'><t size='1'>Speed Limit: %2 km/h<br/><t color='#ffffff'><t align='center'><t size='1'>Driver: %3<br/><t color='#ffffff'><t align='center'><t size='1'>Fine: %4€<br/>Since you are broke and cannot pay, you now have a warrant out for you instead",round _speed,_limit,name _conductor,[_ticketWL] call life_fnc_numberText];
							[[getPlayerUID _conductor,name _conductor,"120S"],"life_fnc_wantedAdd",false,false] spawn life_fnc_MP;
						};
						life_atmcash = life_atmcash - _ticketWL;
						hint parseText format ["<t color='#ffffff'><t size='2'><t align='center'>Speed Radar<br/><t color='#ff0000'><t align='center'><t size='1.5'>Speed: %1 km/h<br/><t color='#ffffff'><t align='center'><t size='1'>Speed Limit: %2 km/h<br/><t color='#ffffff'><t align='center'><t size='1'>Driver: %3<br/><t color='#ffffff'><t align='center'><t size='1'>Fine: $%4",round _speed,_limit,name _conductor,[_ticketWL] call life_fnc_numberText];
						//diag_log "Ticket paid from player bank";//for logging
						[1] call SOCK_fnc_updatePartial;
					} else {

						life_cash = life_cash - _ticketWL;
						hint parseText format ["<t color='#ffffff'><t size='2'><t align='center'>Speed Radar<br/><t color='#ff0000'><t align='center'><t size='1.5'>Speed: %1 km/h<br/><t color='#ffffff'><t align='center'><t size='1'>Speed Limit: %2 km/h<br/><t color='#ffffff'><t align='center'><t size='1'>Driver: %3<br/><t color='#ffffff'><t align='center'><t size='1'>Fine: $%4",round _speed,_limit,name _conductor,[_ticketWL] call life_fnc_numberText];
						//diag_log "Ticket paid from player cash";//for logging
						[0] call SOCK_fnc_updatePartial;

					};
		};
	};
//diag_log "Speed cam script done";//for logging
sleep 5;
*/
