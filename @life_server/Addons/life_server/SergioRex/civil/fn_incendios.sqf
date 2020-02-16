//Por QuickSkill
//Editado por SergioRex

["rex_fnc_incendio", {

	_param = _this select 0;

	if (_param  isEqualTo "crearIncendio") exitWith {

		incendiotiempo = true;
		while {incendiotiempo} do {
			
			/*sleep (60 * 5);
			
			_rnd = ceil random 100;
			
			if (_rnd < 10) then {*/


	//if !({side _x  isEqualTo  INDEPENDENT } count playableUnits > 3 ) exitWith {};


	_zonaIncendio =  selectRandom ["incendio_2","incendio_3","incendio_4","incendio_5"];
	_pos = getMarkerPos _zonaIncendio;
	pos_incendio = _pos;
	publicVariable "pos_incendio";
	_coord = mapGridPosition _pos;
	_message = format["Atención a todos los ciudadanos, Se ha iniciado un incendio en coordenadas %1, porfavor evitar acercarse a la zona - Cuerpo de Bomberos de Metropolis.",_coord];

	[10, "Aviso", [1,0,0], 1.5, _message, [1,1,1], 1] remoteExec ["ica_fnc_anuncio"];

	markerFuego = format["marker_%1",floor(random 1000)];
	_marker = createMarker [ markerFuego, _pos];
	_marker setMarkerColor "ColorRed";
	_marker setMarkerText "!ATENCIÓN! Un incendio por esta zona!";
	_marker setMarkerType "hd_dot";

	[_pos] spawn {
	_posx = _this select 0;
	sleep 300;
	deleteMarker markerFuego;
	[] spawn { sleep 1800;
	{
		if (str _x find ": <no shape>" > -1) then {
				deleteVehicle _x;
		sleep 1;
		};

	} forEach nearestObjects [pos_incendio, [], 60];
	};
	};

	_fireDiametro = 50;
	_quemar = false;
	_humo = false;



		_trg = createTrigger ["EmptyDetector", _pos];
		_trg setTriggerArea [50, 50, 0, false];
		_trg setTriggerActivation ["CIV", "PRESENT", true];
		_trg setTriggerStatements ["this", "hint 'Cuidado estás cerca de un incendio, no te acerques o puedes quedar inconsciente por el humo.'", ""];
		
		_trgd = createTrigger ["EmptyDetector", _pos];
		_trgd setTriggerArea [10, 10, 0, false];
		_trgd setTriggerActivation ["CIV", "PRESENT", true];
		_trgd setTriggerStatements ["this", "_dano = getDammage player;player setDamage (_dano + 0.1)", ""];

		
	{
	_quemar = true;
	_arbol = false;

		if (str _x find ": t_" > -1) then {
			_quemar = true;
			_humo = false;
			_arbol = true;

		};


		if (_x isKindOf "house") then {

			_quemar = true;

		
				if (str _x find "lampstreet_small_f" > -1) then {
					_quemar = false;
					
				};
		


	
		
		};
		
		if(_quemar)then {
	_x setVariable ["efectos",[]];
	if (_arbol) then {
	_pos = [(getPos _x) select 0,(getPos _x) select 1,0];
	} else {
	_pos = getPos _x;
	};

	_fuente01 = "#particlesource" createVehicle _pos;
	_fuente01 setParticleClass "ObjectDestructionFire1Smallx";
	_fuente01 setParticleFire [0.3,1.0,0.1];

	_fuente07 = "#particlesource" createVehicle _pos;
	_fuente07 setParticleClass "BigDestructionFire";


	_fuente02 = "#particlesource" createVehicle _pos;
	_fuente02 setParticleClass "ObjectDestructionSmokeSmallx";

	_fuente06 = "#particlesource" createVehicle _pos;
	_fuente06 setParticleClass "ObjectDestructionSmoke2x";


	_li = "#lightpoint" createVehicle _pos;
	_li setLightBrightness 0.08;
	_li setLightAmbient [1,0.28,0.05];
	_li setLightColor [1,0.28,0.05];
	_li lightAttachObject [_x, [0,0,0]];

					if(random 100 > 70)then{
						_c4 = "DemoCharge_Remote_Ammo_Scripted" createVehicle position  _x;
						_c4 setDamage 1;  
		
					};

	_x setVariable ["efectos",[_fuente01,_fuente02,_fuente06,_fuente07,_li]];
					if(random 100 > 60)then{
	_x setDamage 1};
	sleep 20;
		};
	
	} forEach nearestObjects [_pos, [], _fireDiametro];

			sleep 600;

			};
		};

	//};

	//borrar fuego a X metros

	if (_param  isEqualTo "apagarFuego") exitWith {


	[10, "Apagando fuego ..."] spawn ica_fnc_barrita;
	{


	_arrayparticulas = _x getVariable "efectos";
	//if (isnil "_arrayparticulas") exitWith {hint "Aquí no hay nada que apagar...";};
	{deletevehicle _x;} foreach _arrayparticulas;

	
	sleep 1;
		
	} forEach nearestObjects [player, [], 10];

	};

},false] call usa_server_compilar;