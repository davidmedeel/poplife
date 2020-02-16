//
// Esto es un experimento, y este es social (por lo del gobierno y tal, jaja salu2)
//
// Comandos:
// [usa_alcalde_menu] call usa_fnc_Gobierno;

["usa_fnc_Gob", {


//_param = _this select 0;

//if(_param isEqualTo "init") exitwith {
	_alcalde = (player getVariable ["alcaldeFunciones",1]);
	if!(_alcalde) exitwith {hint "No eres el alcalde.";};

	//Creamos dialog


	//Funciones de sueldos.
	_sueldoFunc1 = player setVariable ["sueldoPD",1000];//esto es temporal EQUIde
	_sueldoFunc2 = player setVariable ["sueldoGOV",1000];//esto es temporal EQUIde
	_sueldoFunc3 = player setVariable ["sueldoEMS",1000];//esto es temporal EQUIde

	while {true} do {
		{
			//if(player getVariable "PoliciaDeServicio" => 1) then {
			_poli = (player getVariable "PoliON");
			if(_poli) then {
				hint "policia de servicio + de 1";
				systemChat "Has recibido una nueva paga del Estado.";

				/*_select = format["SELECT * FROM facciones WHERE nombre ='GOB'"]

				pop_atmdin = pop_atmdin + _sueldoFunc1; //Pagamos lo establecido por el Gobierno. Cuando eso ya tal y lo pongo bien.

				//Si el gobierno no tiene suficiente dinero mandamos mensaje.
				hint "No has podido recibir tu paga del gobierno, por favor, acuda a las oficinas para más información.";*/

				//Restamos dinero de gobierno para dar las paguitas.
				_query = format ["UPDATE facciones SET bank='%1' WHERE nombre='GOB'",_value]; // UPDATE facciones SET bank = '251000' WHERE nombre = "GOB";
				if (_query isEqualTo "") exitWith {};
				//[_query,1] call DB_fnc_asyncCall; //Actualizamos BD
			};
			// Current result is saved in variable _x	
		} forEach playableUnits;

		sleep 60; //560; //Esperamos 9 minutillos (only for testing purposes)
	};
},false] call usa_server_compilar;

["usa_fnc_Gob_Desc", { 
	
	Desc = Desc - 0.05; //5% de descuento. (Por defecto está el Desc en 1)

},false] call usa_server_compilar;
