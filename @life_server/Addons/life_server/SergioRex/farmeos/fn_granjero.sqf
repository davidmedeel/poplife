_param = _this select 0;
_veh = _this select 1;
 
 if (("tl" call ica_fnc_expToLevel) >= 1) then { 
 
if (_param isEqualTo "trabajo") exitWith {
 
if ((player getvariable "trabajo_granjero_activo") > 0) exitwith {};
    //empieza a trabajar
    player setvariable ["trabajo_granjero_activo",1,true];

    //vars
    _time = 60 * 10;
    _ruta_random = round (random 4);
    _veh = nearestObject [player, "stv_Tractor"];  
    _finTrayecto = 0;
    _zonaGranjero = "Linea1";
    _solo1Vez=0;
   
   
    if(_ruta_random == 0) then {
        _zonaGranjero = "Linea1";  
    };
 
    if(_ruta_random == 1) then {
        _zonaGranjero = "Linea2";
    };
 
    if(_ruta_random == 2) then {
        _zonaGranjero = "Linea3";
    };
	
    if(_ruta_random == 3) then {
        _zonaGranjero = "Linea4";
    };
	
    if(_ruta_random == 4) then {
        _zonaGranjero = "Linea5";
    };
 
    _posDestino = getMarkerPos _zonaGranjero;
   

	
    //creamos flecha
    _flechaDir = "Sign_Arrow_Direction_F" createVehicleLocal (position _veh);
    _flechaDir attachTo [_veh, [0,0,2.2]];
    _fromTo = ((position  _veh ) vectorFromTo  _posDestino);
    _flechaDir setDir ((_fromTo select 0) atan2 (_fromTo select 1)) - (getDir _veh);
 
    sleep 1;
    hint "Todo listo, ve a trabajar por los campos  y seras recompensado";
    sleep 1;
 
//loop cuenta atras
while {_time > 0} do {
 
    //distancia
   
    _metros =  _veh distance _posDestino;
 
    //actu flecha
    _fromTo = ((position  _veh ) vectorFromTo _posDestino);
    _flechaDir setDir ((_fromTo select 0) atan2 (_fromTo select 1)) - (getDir _veh);
 
    //tiempo
     sleep 1;
     _time = _time - 1;
 
    hintSilent format["Destino: %3 \n Tiempo : %1 \n Distancia: %2m ", [((_time)/480)+.01,"HH:MM"] call BIS_fnc_timetostring,round (_metros), _zonaGranjero];
 
 
    /// si muere paramos el contador
   if !(alive player) then {   _time = 0;     };
 
   
    // el tio se toca los huevos pues no cobras
   
    if (_time <= 0 ) then {
           
       hint "Que tio mas lento, no te pagaremos nada por tu trabajo, vuelve a empezar la ruta holgazan";
       player setvariable ["trabajo_granjero_activo",0,true];
 
       _time = 0;
     
     };
 
 
         //llegamos al destino
 
    if(_metros < 15 )then {  
 
        hint "Buen trabajo ya puedes ir a cobrar.";
 
        //ha llegado a su destino final ya puede cobrar
 
        player setvariable ["pagar_granjero",1,true];
 
        _time = 0;
 
    };
};
 
 
 
};
 
if (_param isEqualTo "cobrarTrabajo") exitWith {
 
if ((count (nearestObjects [player, ["man"], 10]))>1) exitwith {hint "De uno en uno por favor"};
 
if ((player getvariable "pagar_granjero") == 0) exitwith {hint "Trabaja primero, que te crees que eres politico?�?"};
 
 
   
    if ((player getvariable "pagar_granjero") > 0) exitwith {
            hint "Fantastico, Sara te aprueba y has trabajado duro, aqui tienes tu recompensa.";
			_flechaDir = nearestObject [player, "Sign_Arrow_Direction_F"];
			deleteVehicle _flechaDir;
             			
            _pago = 6500;
			[5] call ica_fnc_ganoExp;
            //pagamos
            pop_din = pop_din + _pago;
			["pop_cajaalimentos", 10] call ica_fnc_item;
			["+10 caja alimento"] call ica_fnc_infolog;
			
			
 
          player setvariable ["pagar_granjero",0,true];
          player setvariable ["trabajo_granjero_activo",0,true];
       
    };
 
 
 
};
 
if (_param isEqualTo "solicito") exitWith {
 
    if ((count (nearestObjects [player, ["man"], 10]))>1) exitwith {hint "De uno en uno por favor"};
 
 
    if (pop_din < 5000) exitwith {hint "La fianza del tractor son 5000 €"};
    pop_din = pop_din - 5000;
	if (player getvariable ["TractorON", false]) exitWith {hint "Acaparador, ya tienes un tractor."};
    _veh = "stv_Tractor" createvehicle position player;
    player setvariable ["pagar_granjero",0,true];
    _veh setvariable ["propietario",name player,true];
	player moveInDriver _veh;
	
	player setvariable ["TractorON",true,true];
   
 
//add actions
_veh  addAction["<t color='#FF0000'>Empezar trabajo para granjero</t>", {["trabajo"] spawn ica_fnc_granjero}];
 
 
    player setvariable ["uniforme",uniform player,true];
	player setvariable ["sombrero",Headgear player,true];
    player addHeadgear "rds_Villager_cap1";
    player  forceAddUniform "TRYK_shirts_BLK_PAD_YEL";
 
 
};
 
 
if (_param isEqualTo "fianza") exitWith {
 
 
	
    if ((count (nearestObjects [player, ["man"], 10]))>1) exitwith {hint "De uno en uno por favor"};
    _veh = nearestObject [player, "stv_Tractor"];
    if (isnil "_veh") exitwith {hint "No veo cerca ning�n tractor"};
    if ((player distance _veh)>10) exitwith {hint "Acerca el tractor"};
    _propietario = _veh getvariable "propietario";
    if (name player != _propietario) exitwith {hint "Este tractor no esta registrada a tu nombre"};
    deletevehicle _veh;
	removeUniform player;
    removeHeadgear player;
    _uniforme = player getvariable "uniforme";
	_sombrero = player getvariable "sombrero";
    player forceAddUniform _uniforme;
	player addHeadgear _sombrero;
    pop_din = pop_din + 5000;
	_flechaDir = nearestObject [player, "Sign_Arrow_Direction_F"];
	//_flechaDir = "Sign_Arrow_Direction_F"; 
	deleteVehicle _flechaDir;
    hint "Todo listo, tractor guardado en el ayuntamiento, vuelve a por m�s trabajo cuando quieras";
    player setvariable ["trabajo_granjero_activo",0,true];
	player setvariable ["TractorON",false,false];
};
} else { hint "Sin estudios no haces nada!";};