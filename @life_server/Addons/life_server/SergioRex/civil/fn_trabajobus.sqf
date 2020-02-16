/*
Script creador por Sergio Rex
Sin terminar
*/


//_destino = ["parada1","parada2"];

["usa_fnc_initbus", { 

		if (player getvariable "TrabajandoBus") exitWith {hint "Ya estas trabajando";};

		//Creo el autobus
		autobus = "agora_ratp" createVehicle position player;

		player setVariable ["TrabajandoBus",true];

		[] spawn usa_fnc_rutabus1;


},false] call usa_server_compilar;

["usa_fnc_rutabus1", {
			
		//Defino el tiempo
		ruta1_tiempo = 200;

		//Pongo la ruta
		_Destino2 = "ruta_1";
		posDestino = getMarkerPos "parada1";

		//Empezamos el while con todo lo necesario definido
		while {ruta1_tiempo > 0} do {

		//Defino la variable que cuenta los metros
		metrosxd = autobus distance posDestino;

		sleep 1;

		//Restamos 1 segundo
		ruta1_tiempo = ruta1_tiempo - 1;

		//Cuando estoy cerca paramos el while
		if(metrosxd < 7 )then { 

		//Finalizo el while con el tiempo
		ruta1_tiempo = 0;

		hint "Espera que se suban los pasajeros";

		[20, "Subiendose los pasajeros..."] spawn ica_fnc_barrita;
		autobus setfuel 0;
		[autobus, [0, 0, 1]] call ica_fnc_setVelocityRas;
		sleep 20;

		autobus setfuel 1;
		player setvariable ["PagaBus",1];

		sleep 1;
		hint "Recuerda que puedes ir a cobrar o continuar el viaje, (Tienes una accion en la rueda del raton para continuar el viaje)";

		//Pongo la accion para continuar el viaje
		autobus addaction ["Continuar ruta", {[] spawn usa_fnc_rutabus2}];

		};


		hintsilent format ["Tiempo %1\nDestino %2 \nDistancia %3M",ruta1_tiempo,_Destino2, round (metrosxd)];
			};
},false] call usa_server_compilar;

["usa_fnc_rutabus2", { 

		autobus removeAction 0;


		ruta1_tiempo = 200;

		_Destino2 = "ruta_2";
		posDestino = getMarkerPos "parada2";


		while {ruta1_tiempo > 0} do {

		metrosxd = autobus distance posDestino;

		sleep 1;
		ruta1_tiempo = ruta1_tiempo - 1;


		if(metrosxd < 7 )then { 
		ruta1_tiempo = 0;
		hint "Espera que se suban los pasajeros";

		[20, "Subiendose los pasajeros..."] spawn ica_fnc_barrita;
		autobus setfuel 0;
		[autobus, [0, 0, 1]] call ica_fnc_setVelocityRas;
		sleep 20;

		autobus setfuel 1;
		player setvariable ["PagaBus",2];

		sleep 1;
		hint "Recuerda que puedes ir a cobrar o continuar el viaje, (Tienes una accion en la rueda del raton para continuar el viaje)";

		autobus addaction ["Continuar ruta (Out)", {[] spawn ica_fnc_trabajobus}];

		};


		hintsilent format ["Tiempo %1\nDestino %2 \nDistancia %3M",ruta1_tiempo,_Destino2, round (metrosxd)];
			};

},false] call usa_server_compilar;

["usa_fnc_cobrobus", {

	pagabus = 0;

	varaiblepaga = player getvariable "PagaBus";

	switch {varaiblepaga} do {

	case 1: {pagabus = 1;};
	case 2: {pagabus = 2;};
	case 3: {pagabus = 3;};

	};


	if (varaiblepaga isEqualTo 1) exitWith {hint "hiciste una parada";};
	if (varaiblepaga isEqualTo 2) exitWith {hint "hiciste dos parada";};
	if (varaiblepaga isEqualTo 3) exitWith {hint "hiciste tres parada";};

},false] call usa_server_compilar;