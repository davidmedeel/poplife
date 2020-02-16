/*
	Srcipt base hecho por Aiden para ProjectGamers V2 
	Editado por Sergio Rex
*/
["genxx_fnc_basuracarcel", {

_param = _this select 0;
spawnpos = selectRandom [
	[9287.95,9475.2,0.00143909],
	[9289.24,9496.35,0.00143909],
	[9304.45,9499.34,0.00143909],
	[9299.52,9478.41,0.00143909]

];


/*if (_param isEqualTo "creo") exitWith { 
	basura = "Land_GarbageBags_F" createVehicle spawnpos;

	[
		basura,											// Object the action is attached to
		"Recoger Basura",										// Title of the action
		"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_connect_ca.paa",	// Idle icon shown on screen
		"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_connect_ca.paa",	// Progress icon shown on screen
		"_this distance _target < 3",						// Condition for the action to be shown
		"_caller distance _target < 3",						// Condition for the action to progress
		{},													// Code executed when action starts
		{player playMoveNow "AinvPknlMstpSnonWnonDnon_AinvPknlMstpSnonWnonDnon_medic"},			// Code executed on every progress tick
		{ 
			deleteVehicle basura; hintSilent "Puedes ir a por la siguiente bolsa!"; 
			basuras = basuras + 1; 
			if (basuras isEqualTo 10) exitWith {
				hintSilent "Has terminado tu ronda!";
			 	player setvariable ["Recogiendo", false];
			 	};
			 	["creo"] spawn genxx_fnc_basuracarcel; 
		},				// Code executed on completion
		{ hintSilent "¡Has dejado toda la basura tirada\n Te han subido la condena por mal comportamiento"
		},													// Code executed on interrupted
		[],													// Arguments passed to the scripts as _this select 3
		floor random [2,4,8],											// Action duration [s]
		0,													// Priority
		true,												// Remove on completion
		false												// Show in unconscious state 
	] remoteExec ["BIS_fnc_holdActionAdd", 0, basura];	// MP compatible implementation
};*/

if (_param isEqualTo "Contenedor") exitWith {
	if !(player getvariable "llevobolsa") exitWith {hint "No tienes la bolsa de basura";};
	
	//Poner si eres donador que baje 2

	basurastiempo = basurastiempo - 1;

		_bolsapuesta = nearestObject [player, "stv_bolsa_basura_visual"];

        if (isNull attachedTo _bolsapuesta) exitWith {
                hint "No cargas ning�na bolsa o hay otra cerca en el piso.";
            };
        _tienebolsa = _bolsapuesta getvariable "basurabolsa";
        if (_tienebolsa  isEqualTo  0)exitwith{ hint "No tienes nada que descargar." };

        _bolsapuesta setvariable["basurabolsa", 0, true];
        detach _bolsapuesta;
        deleteVehicle _bolsapuesta;
        hint "Descargado ...";

		systemChat format ["Te quedan %1 bolsa(s).",basurastiempo];

		["crearmierda"] spawn genxx_fnc_basuracarcel;





player setVariable ["llevobolsa",false];
};

if (_param isEqualTo "Empezar") exitWith {
	
		if !(player getVariable "llevobolsa") exitWith {hint "No llevas la bolsa de basura";};


		bolsabasuraxd attachto [player, [ 0.3, -0.1, -0.3 ], "Pelvis"];

		bolsabasuraxd setVariable ["basurabolsa", 1, true];

		//"Lleva la bolsa al contenedor" remoteexec ["hint"];
		player setvariable ["llevobolsa",true];

		[] spawn rex_fnc_accionbasura;


};

if (_param isEqualTo "init") exitWith {
	//basuras = 0; //ponemos basuras a 0
	if !(player getVariable "life_is_arrested") exitWith {hintSilent "¡No eres un preso! ¿Qué haces aquí?"}; // si no estás en la carcel no te deja
	if (player getVariable "recogiendo") exitWith { // si estas recogiendo
		hintSilent "¡Ve a por la otra bolsa primero!"; // si estás recogiendo basuras y le das otra vez al npc no te deja
	};
	if (player getVariable "life_is_arrested") exitWith { //si estas preso

	//	basurastiempo = 10; 
		_minnutos = parseNumber life_arrestMinutes; 
		
		basurastiempo = _minnutos;

		["crearmierda"] spawn genxx_fnc_basuracarcel;

		//bolsabasura2 = "stv_bolsa_basura_visual" createVehicle spawnpos;

		//deleteVehicle bolsabasura2;

	//	["Empezar"] spawn genxx_fnc_basuracarcel;
	};
};


if (_param isEqualTo "crearmierda") exitwith {
	if (basurastiempo isEqualTo 0) exitwith {hint "Por tu empeño trabajando por el bien de la cárcel el servicio penitenciario ha decidodo ponerte en libertad."; sleep 5; ["salircarcel"] spawn genxx_fnc_basuracarcel;};

		bolsabasura2 = "Land_GarbageBags_F" createVehicle spawnpos;

 [ 
	bolsabasura2, 
	"Recoger la bolsa de basura", 
	"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_connect_ca.paa", 
	"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_connect_ca.paa", 
	"_this distance _target < 3", 
	"_caller distance _target < 3", 
	{}, 
	{player playMoveNow "AinvPknlMstpSnonWnonDnon_AinvPknlMstpSnonWnonDnon_medic"}, 
	{  
	player setVariable ["llevobolsa",true];
	["Empezar"] spawn genxx_fnc_basuracarcel;
	bolsabasuraxd = "stv_bolsa_basura_visual" createvehicle position player;
	bolsabasura2 remoteexec ["deleteVehicle"];
	}, 
	{ hintSilent "¡Recoge la bolsa de basura que has tirado!" 
	}, 
	[], 
	floor random [2,4,8], 
	0, 
	true, 
	false 
	] remoteExec ["BIS_fnc_holdActionAdd", 0, bolsabasura2];


};

if (_param isEqualTo "salircarcel") exitwith {

		/*salirdelacarcel = true;
		While {salirdelacarcel} do {
			sleep 20;*/

		//Salimos de la carcel suuuuhhhh
		if (basurastiempo isEqualTo 0) exitWith {
			salirdelacarcel = false;
			[1] call fnc_releaseprison;
		};
	};	

},false] call usa_server_compilar;


["rex_fnc_accionbasura", {

	contenedor_carcel enableSimulation false;  contenedor_carcel allowDamage false; [ 
	contenedor_carcel, 
	"Dejar bolsa de basura", 
	"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_connect_ca.paa", 
	"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_connect_ca.paa", 
	"_this distance _target < 3", 
	"_caller distance _target < 3", 
	{}, 
	{player playMoveNow "AinvPknlMstpSnonWnonDnon_AinvPknlMstpSnonWnonDnon_medic"}, 
	{  
	["Contenedor"] spawn genxx_fnc_basuracarcel; 
	}, 
	{ hintSilent "¡Recoge la bolsa de basura que has tirado!" 
	}, 
	[], 
	floor random [2,4,8], 
	0, 
	true, 
	false 
	] remoteExec ["BIS_fnc_holdActionAdd", 0, contenedor_carcel];


},false] call usa_server_compilar;