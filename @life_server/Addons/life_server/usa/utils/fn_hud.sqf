	//		/|\ 	/|\		//		///////////////////////////////////
	//		     -			//		//	By usa esto es un hud y tal	//
	//	     	---			//		/////////////////////////////////
   ///////////////////////////   

["usa_fnc_hud", {
	diag_log "HUD [USA]";
	//Llamamos al rsc del hud.
	//("hud" call BIS_fnc_rscLayer) cutRsc ["hud","PLAIN", 1, false];
	("hud" call BIS_fnc_rscLayer) cutRsc ["hud","PLAIN"];

	disableSerialization;
	_ui = uiNamespace getVariable "hud";
	_salud = _ui displayCtrl 1000;
	_comida = _ui displayCtrl 1003;
	_agua = _ui displayCtrl 1001;

	while {true} do 
	{
		//Actualizamos dinero
		/*switch (damage player) do {
			case damage player >= 90: {_salud = ctrlSetStructuredText parseText format ["<t size='0.95' font='PuristaMedium' color='#18f124' align='right'>MUY SALUDABLE</t>"];};
			case damage player >= 50: {_salud = ctrlSetStructuredText parseText format ["<t size='0.95' font='PuristaMedium' color='#18f124' align='right'>ALGO SALUDABLE</t>"];};
			case damage player >= 30: {_salud = ctrlSetStructuredText parseText format ["<t size='0.95' font='PuristaMedium' color='#18f124' align='right'>POCO SALUDABLE</t>"];};
			case damage player <= 30: {_salud = ctrlSetStructuredText parseText format ["<t size='0.95' font='PuristaMedium' color='#18f124' align='right'>JODIDO</t>"];};

			default { };
		};*/
		if((damage player) >= 90) {{_salud = ctrlSetStructuredText parseText ["<t size='0.95' font='PuristaMedium' color='#18f124' align='right'>MUY SALUDABLE</t>"];
		} else if((damage player) >= 50) {{_salud = ctrlSetStructuredText parseText ["<t size='0.95' font='PuristaMedium' color='#18f124' align='right'>ALGO SALUDABLE</t>"];
		} else if((damage player) >= 30) {{_salud = ctrlSetStructuredText parseText ["<t size='0.95' font='PuristaMedium' color='#18f124' align='right'>POCO SALUDABLE</t>"];
		} else if((damage player) <= 30) {{_salud = ctrlSetStructuredText parseText ["<t size='0.95' font='PuristaMedium' color='#18f124' align='right'>JODIDO</t>"];};
		//Actualizamos vida y to eso	
		sleep 1;
	};
},false] call usa_server_compilar;