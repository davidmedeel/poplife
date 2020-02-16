
["rex_fnc_alertas", {


	_param = _this select 0;
	_alerta = _this select 1;


		if (_param isEqualTo "init") exitwith {

			switch (_alerta) do {
				case "alerta1": {
				hint "La alerta actual es Alerta 1";			

				};
				default {
					hint "La alerta actual es Alerta 0";
				};
			};

		};


},false] call usa_server_compilar;