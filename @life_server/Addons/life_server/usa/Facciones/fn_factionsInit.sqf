//By usa
//23/10/19
//Uso NO permitido, si quieres utilizarlo este o cualquier otro que contenga "usa" en el comentario, deberás solicitar permiso a: usasergio2@gmail.com.

["usa_fnc_factionsInit", {
	diag_log "[USA] Facciones Init Loaded";

	{
		/*if(_x select 0 isEqualTo "GOB") then {
			SV_BANK_Gob = _x select 1;
			publicVariable "SV_BANK_Gob";
			true;
		};

		if(_x select 0 isEqualTo "PD") then {
			SV_BANK_PD = _x select 1;
			publicVariable "SV_BANK_PD";
			true;
		};

		if(_x select 0 isEqualTo "EMS") then {
			SV_BANK_EMS = _x select 1;
			publicVariable "SV_BANK_EMS";
			true;
		};
		if(_x select 0 != "EMS" && "PD" && "GOB") then {
			//Proximamente
			diag_log "[USA] Ninguna facción estatal.";
		};*/


		diag_log format ["[USA] Cargada facción: %1 || Dinero: %2",(_x select 0)];
	} forEach (["SELECT nombre,bank,history FROM facciones",1] call DB_fnc_asyncCall);//estaba en 2 para testig


},false] call usa_server_compilar;
