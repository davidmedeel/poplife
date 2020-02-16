
/*
por: quickskill pop to next level, 

La empresa - misiones - 

["generarmisionesINIT"] spawn ica_fnc_misionesLaEmpresa;

*/

_param = _this select 0;


if (_param  isEqualTo  "generarmisionesINIT") exitWith {

    //misiones

    [[NPC_EMPRESA_MISIONES, ["¿Qué es -La Empresa-?",{["empresaInfo"] spawn ica_fnc_misionesLaEmpresa;}]],"addAction",true,true] call BIS_fnc_MP;

    [[NPC_EMPRESA_MISIONES_2, ["¿Qué es -La Empresa-?",{["empresaInfo"] spawn ica_fnc_misionesLaEmpresa;}]],"addAction",true,true] call BIS_fnc_MP;

    [[NPC_EMPRESA_MISIONES_3, ["¿Qué es -La Empresa-?",{["empresaInfo"] spawn ica_fnc_misionesLaEmpresa;}]],"addAction",true,true] call BIS_fnc_MP;

   // [[NPC_EMPRESA_MISIONES_4, ["¿Qué es -La Empresa-?",{["empresaInfo"] spawn ica_fnc_misionesLaEmpresa;}]],"addAction",true,true] call BIS_fnc_MP;

  
    ////

  [[NPC_EMPRESA_MISIONES, ["Vender armas a  -La Empresa- Pistolas: 20.500€ Otras: 40.000€",{["misionVenderArmas"] spawn ica_fnc_misionesLaEmpresa;}]],"addAction",true,true] call BIS_fnc_MP;
 
    [[NPC_EMPRESA_MISIONES_2, ["La Empresa: Transporte de Drogas - Coste:40.000€ - Recompensa:70.000€ - Dificultad: 1",{["misionTransporteDrogas"] spawn ica_fnc_misionesLaEmpresa;}]],"addAction",true,true] call BIS_fnc_MP;
   
    [[NPC_EMPRESA_MISIONES_3, ["La Empresa: Transporte de Armas - Coste:120.000€ - Recompensa:180.000€ - Dificultad: 2",{["misionTransporteArmas"] spawn ica_fnc_misionesLaEmpresa;}]],"addAction",true,true] call BIS_fnc_MP;
   
   // [[NPC_EMPRESA_MISIONES_4, ["La Empresa: Médico Clandestino - Coste:0€ - Recompensa:50.000€ - Dificultad: 3",{["misionMedicoClandestino"] spawn ica_fnc_misionesLaEmpresa;}]],"addAction",true,true] call BIS_fnc_MP;
  

 
     //cobros 
    [[NPC_EMPRESA_COBROS, ["Cobrar trabajo Transporte de Drogas - Recompensa:70.000€ ",{["misionTransporteDrogasCobrar"] spawn ica_fnc_misionesLaEmpresa;}]],"addAction",true,true] call BIS_fnc_MP;
   
    [[NPC_EMPRESA_COBROS, ["Cobrar trabajo Transporte de Armas - Recompensa:180.000€",{["misionTransporteArmasCobrar"] spawn ica_fnc_misionesLaEmpresa;}]],"addAction",true,true] call BIS_fnc_MP;
   
   // [[NPC_EMPRESA_COBROS_MEDICO, ["Cobrar trabajo Médico Clandestino - Recompensa:50.000€ ",{["misionMedicoClandestinoCobrar"] spawn ica_fnc_misionesLaEmpresa;}]],"addAction",true,true] call BIS_fnc_MP;
  
 



};

//quien es la empresa

if (_param  isEqualTo  "empresaInfo") exitWith {

[[["- La Empresa -","<t align = 'center' size = '1.5' font='PuristaBold'>%1</t><br/>"],["","<br/>"],["Originalmente fundada por -Berto Romero aka Quickskill- es una organización criminal internacional, en algún momento su fundador perdió el control de esta y ahora se ha convertido en la organización más peligrosa a nivel mundial, entre sus actos favoritos está el robo, extorsión y asesinato, sin dejar de lado tráfico de armas y drogas y todo tipo de delitos, algunos piensan que ésta organización controla la mayoría de empresas referentes a nivel mundial: Goggly, microshit y apllee entre ellas, ten mucho cuidado si decides trabajar con ellos, no toleraran ningún contratiempo.","<t align = 'center' size = '0.8' color = '#ffffff'>%1</t>"]]] spawn BIS_fnc_typeText;
  

};

 //////////////
// missiones//
/////////////




//////////////////VENTA DE ARMAS //////////////////////////////////////////////////////////////////

if (_param  isEqualTo  "misionVenderArmas") exitWith {



  //cheeks
  if ((count (nearestObjects [player, ["man"], 10]))>1) exitwith {hint "De uno en uno, por favor"};

   

  //compramos armas equipadas
  _pWeap = primaryWeapon player;
  _hgWeapon= handgunWeapon player; 



         //si es un item troll caña linterna pancarta etc lo matamos
          if(_pWeap  isEqualTo  "pop_linterna" or _pWeap=="cl_fishing_rod" or _hgWeapon=="cl_picket_rtp" or _hgWeapon=="cl_picket_mlnw" or _hgWeapon=="cl_picket_ftp" or _hgWeapon=="cl_axe" or _hgWeapon=="max_knife" or _hgWeapon=="max_survivor_knife" or _pWeap=="cl_pick_axeweap") exitWith{


  hint "¿Te estás riendo de mi?";
  sleep 1;
  hint "Con -La Empresa- no se juega.";
  sleep 1;
  player setDamage 1;



          };
	//Rex comprobamos armas
		if ((_pWeap == "") or (_hgWeapon == "")) then {hint "No tienes ningun arma"};
		
        if( _pWeap != "") then{

         

      //quitar fusil

      player removeWeapon _pWeap;

            _exp = 3;
            _pago = 40000;

            //pagamos y damos exp

            stvrex_din = stvrex_din + _pago;
            ["exp",_exp] call ica_fnc_arrayexp;

            titleText["Buen arma, aquí tienes tus 40.000€", "PLAIN"];
				format ["%1 - (%2) ha vendido por %3€  - Dinero en banco : %4€ - Dinero en mano %5€ (Farmeo La Empresa Venta armas)", profileName,
	(getPlayerUID player),
	_pago,
	stvrex_atmdin,
	stvrex_din
	] remoteExecCall ["A3Log", 2];
            sleep 2;


          };

   



          //vendemos la pistola

        if( _hgWeapon != "") then{     

    

          //quitar pistola y pagar
           player removeWeapon _hgWeapon;

            _exp = 2;
            _pago = 22500;

            //pagamos y damos exp
            stvrex_din = stvrex_din + _pago;
            ["exp",_exp] call ica_fnc_arrayexp;

				format ["%1 - (%2) ha vendido por %3€  - Dinero en banco : %4€ - Dinero en mano %5€ (Farmeo La Empresa Venta armas)",	 profileName,
	(getPlayerUID player),
	_pago,
	stvrex_atmdin,
	stvrex_din
	] remoteExecCall ["A3Log", 2];

                titleText["Ésta pistola nos vendrá bien, toma 22.500€", "PLAIN"];
         


        }; 






};

///////////////////TRANSPORTES //////////////////////////

if (_param  isEqualTo  "misionTransporteDrogas") exitWith {



 if !({side _x  isEqualTo  WEST} count playableUnits >= 3) exitWith {hint "Tienen que estar al menos 3 policías conectados, sino, no es divertido."};


  if ((player getvariable "trabajo_transporte_droga_activo") > 0) exitwith {};



      _coste_mision = 40000;

   if (stvrex_din < _coste_mision) exitwith {hint "No tienes 40.000€"};

    //pagar mision
    stvrex_din = stvrex_din - _coste_mision;
    
    
    player setvariable ["trabajo_transporte_droga_activo",1,true];
	format ["%1 - (%2) ha iniciado mision transporte drogas - Dinero en banco : %3€ - Dinero en mano %4€ (La Empresa)", profileName,
	(getPlayerUID player),
	stvrex_atmdin,
	stvrex_din] remoteExecCall ["A3Log", 2];
  //vars


  _time = 60 *  20;
  _droga = "pop_coca_b";
  _drogaCantidad = 25;  

  //punto entrega
  _destino = "Cobros La Empresa";
  _posDestino = getMarkerPos "LaEmpresaMuelle";
  _metros =  player distance _posDestino;
    
  //hint info mision bonito
  
[[["- La Empresa -","<t align = 'center' size = '1.5' font='PuristaBold'>%1</t><br/>"],["","<br/>"],["Coge la droga de la caja y llévala al punto de entrega, está pesada al miligramo, por tu bien que no falte nada.","<t align = 'center' size = '0.8' color = '#ffffff'>%1</t>"]]] spawn BIS_fnc_typeText;

//delitos
//[[getPlayerUID player,profileName,"483"],"life_fnc_wantedAdd",false,false] call life_fnc_MP;
       
// add caja 
_cajaGTA =  "Box_NATO_Grenades_F" createVehicle position NPC_EMPRESA_MISIONES_2;

clearMagazineCargoGlobal _cajaGTA;
clearItemCargoGlobal _cajaGTA;
clearWeaponCargoGlobal _cajaGTA; 

  //agregar droga a la caja
  _cajaGTA addItemCargoGlobal [_droga, _drogaCantidad];
  
[_cajaGTA, 120] spawn ica_fnc_borrame;

  //timer mision
  while {_time > 0} do {


    //si voy en heli o avion  a tomar x culo


      if(  vehicle player isKindOf "Air")then{

          titleText["Misión Fallida - No puedes ir en helicóptero para realizar el transporte.", "PLAIN"]; 
         player setvariable ["trabajo_transporte_droga_activo",0,true];

        _time = 0;

      };

   
  

      //distancia   
      _metros =  player distance _posDestino;

  
      //tiempo
      sleep 1;
      _time = _time - 1;

      hintSilent format["Destino: %3 \n Tiempo : %1 \n Distancia: %2m ", [((_time)/60)+.01,"HH:MM"] call BIS_fnc_timetostring,round (_metros), _destino];
  

      /// si muere paramos el contador
      if !(alive player) then {   
        _time = 0;     
      };

    
    
      // el tio se toca los huevos pues no cobras
    
      if (_time <= 0 ) then {
            
         hint "Has tardado mucho en llegar, no queremos tratos con gente incompetente.";
         player setvariable ["trabajo_transporte_droga_activo",0,true];

        _time = 0;
     
      };


     //llegamos al destino

    if(_metros < 10 )then{ 

    titleText["Bien, ahora entrega la droga", "PLAIN"]; 

         
  

        //ha llegado a su destino final ya puede cobrar

        player setvariable ["pagar_transporte_droga",1,true];

        _time = 0;

        hint "";

    };



};//end while timer mision


 
};

if (_param  isEqualTo  "misionTransporteDrogasCobrar") exitWith {

  if ((count (nearestObjects [player, ["man"], 10]))>1) exitwith {hint "De uno en uno, por favor"};

  if ((player getvariable "pagar_transporte_droga")  isEqualTo  0) exitwith {hint "Trabaja primero, ¿qué te crees que eres político?"};



   
    if ((player getvariable "pagar_transporte_droga") > 0) exitwith {

      _cocaCantidad = ["pop_coca_b"] call ica_fnc_tengo;
      if(_cocaCantidad < 25)exitWith{

        [[["- La Empresa -","<t align = 'center' size = '1.5' font='PuristaBold'>%1</t><br/>"],["","<br/>"],["Falta droga...","<t align = 'center' size = '0.8' color = '#ffffff'>%1</t>"]]] spawn BIS_fnc_typeText;
  

      };

      //eliminar la coca
      ["pop_coca_b", -25] call ica_fnc_item;


          [[["- La Empresa -","<t align = 'center' size = '1.5' font='PuristaBold'>%1</t><br/>"],["","<br/>"],["Fantástico, has trabajado duro, -La empresa- siempre cumple, aquí está tu recompensa.","<t align = 'center' size = '0.8' color = '#ffffff'>%1</t>"]]] spawn BIS_fnc_typeText;
  

         //quickskill 
         
          _exp = 6;      
            _pago = 70000;

            //pagamos y damos exp

            stvrex_din = stvrex_din + _pago;
            ["exp",_exp] call ica_fnc_arrayexp;
			format ["%1 - (%2) ha entregado mision transporte drogas - Dinero en banco : %3€ - Dinero en mano %4€ (La Empresa)", profileName,
			(getPlayerUID player),
			stvrex_atmdin,
			stvrex_din] remoteExecCall ["A3Log", 2];
			
          player setvariable ["pagar_transporte_droga",0,true];
          player setvariable ["trabajo_transporte_droga_activo",0,true];
        
    };




};



//////////////TRANSPORTE DE ARMAS/////////////////

if (_param  isEqualTo  "misionTransporteArmas") exitWith {




  //cheeks
  if !({side _x  isEqualTo  WEST} count playableUnits >= 6) exitWith {hint "Tienen que estar al menos 6 policías conectados, sinó, no es divertido."};

  if ((count (nearestObjects [player, ["man"], 10]))>1) exitwith {hint "De uno en uno, por favor."};

  if ((player getvariable "trabajo_transporte_armas_activo") > 0) exitwith {};



          _coste_mision = 120000;

   if (stvrex_din < _coste_mision) exitwith {hint "No tienes 120.000 €"};

        stvrex_din = stvrex_din - _coste_mision;
    
    
    player setvariable ["trabajo_transporte_armas_activo",1,true];
	format ["%1 - (%2) ha iniciado mision transporte armas - Dinero en banco : %3€ - Dinero en mano %4€ (La Empresa)", profileName,
	(getPlayerUID player),
	stvrex_atmdin,
	stvrex_din] remoteExecCall ["A3Log", 2];
  //vars


  _time = 60 *  20;
  _arma = "hgun_Rook40_F";
  _armaCantidad = 2;
 
  _destino = "Cobros La Empresa";
  //punto entrega
  _posDestino = getMarkerPos "LaEmpresaMuelle";
  _metros =  player distance _posDestino;
    
  //hint info mision bonito
  
[[["- La Empresa -","<t align = 'center' size = '1.5' font='PuristaBold'>%1</t><br/>"],["","<br/>"],["Coge las armas de la caja y llévalas al punto de entrega, están contadas, por tu bien que no falte nada","<t align = 'center' size = '0.8' color = '#ffffff'>%1</t>"]]] spawn BIS_fnc_typeText;

//delitos
//[[getPlayerUID player,profileName,"4833"],"life_fnc_wantedAdd",false,false] call life_fnc_MP;

// add caja 
_cajaGTA =  "Box_NATO_Grenades_F" createVehicle position NPC_EMPRESA_MISIONES_3;

clearMagazineCargoGlobal _cajaGTA;
clearItemCargoGlobal _cajaGTA;
clearWeaponCargoGlobal _cajaGTA;   

  //agregar droga a la caja
  _cajaGTA addItemCargoGlobal [_arma, _armaCantidad];
  
 [_cajaGTA, 120] spawn ica_fnc_borrame;

  //timer mision
  while {_time > 0} do {

    
        //si voy en heli o avion  a tomar x culo
      if(  vehicle player isKindOf "Air")then{

          titleText["Mision Fallida - No puedes ir en helicóptero para realizar el transporte.", "PLAIN"]; 
         player setvariable ["trabajo_transporte_armas_activo",0,true];

        _time = 0;

      };

      //distancia   
      _metros =  player distance _posDestino;

  
      //tiempo
      sleep 1;
      _time = _time - 1;

      hintSilent format["Destino: %3 \n Tiempo : %1 \n Distancia: %2m ", [((_time)/60)+.01,"HH:MM"] call BIS_fnc_timetostring,round (_metros), _destino];
  

      /// si muere paramos el contador
      if !(alive player) then {   
        _time = 0;     
      };

    
    
      // el tio se toca los huevos pues no cobras
    
      if (_time <= 0 ) then {
            
         hint "Has tardado mucho en llegar, no queremos tratos con gente incompetente.";
         player setvariable ["trabajo_transporte_armas_activo",0,true];

        _time = 0;
     
      };
    
  


     //llegamos al destino

    if(_metros < 10 )then{  

           titleText["Bien, ahora entrega las armas.", "PLAIN"]; 

        //ha llegado a su destino final ya puede cobrar

        player setvariable ["pagar_transporte_armas",1,true];

        _time = 0;

        hint "";

    };



};//end while timer mision


 
};

if (_param  isEqualTo  "misionTransporteArmasCobrar") exitWith {

  if ((count (nearestObjects [player, ["man"], 10]))>1) exitwith {hint "De uno en uno, por favor"};

  if ((player getvariable "pagar_transporte_armas")  isEqualTo  0) exitwith {hint "Trabaja primero, ¿qué te crees que eres político?"};


 _pWeap = primaryWeapon player;
  _hgWeapon= handgunWeapon player; 

        if( _pWeap != "" or _hgWeapon != "" ) exitWith{

           titleText["Pon tus armas en la mochila, no te pagaremos mientras lleves armas equipadas.", "PLAIN"];
         };


   
    if ((player getvariable "pagar_transporte_armas") > 0) exitwith {

  _arma = "hgun_Rook40_F";
  _armaCantidad = 2;
            _armaCantidad = ["hgun_Rook40_F"] call ica_fnc_tengo;
      if(_armaCantidad < 4)exitWith{

        [[["- La Empresa -","<t align = 'center' size = '1.5' font='PuristaBold'>%1</t><br/>"],["","<br/>"],["Faltan armas en tu mochila...","<t align = 'center' size = '0.8' color = '#ffffff'>%1</t>"]]] spawn BIS_fnc_typeText;
  

      };

      //eliminar las armas
      [_arma, -2] call ica_fnc_item;


          [[["- La Empresa -","<t align = 'center' size = '1.5' font='PuristaBold'>%1</t><br/>"],["","<br/>"],["Fantástico, has trabajado duro, -La empresa- siempre cumple, aquí está tu recompensa.","<t align = 'center' size = '0.8' color = '#ffffff'>%1</t>"]]] spawn BIS_fnc_typeText;
  

            //quickskill 

            _exp = 6;
            _pago = 180000;

            //pagamos y damos exp

            stvrex_din = stvrex_din + _pago;
            ["exp",_exp] call ica_fnc_arrayexp;
			format ["%1 - (%2) ha entregado mision transporte armas - Dinero en banco : %3€ - Dinero en mano %4€ (La Empresa)", profileName,
			(getPlayerUID player),
			stvrex_atmdin,
			stvrex_din] remoteExecCall ["A3Log", 2];
          player setvariable ["pagar_transporte_armas",0,true];
          player setvariable ["trabajo_transporte_armas_activo",0,true];
        
    };




};


//////////////Médico Clandestino/////////////////

if (_param  isEqualTo  "misionMedicoClandestino") exitWith {

 if !({side _x  isEqualTo  WEST} count playableUnits >= 4) exitWith {hint "Tienen que estar al menos 4 policías conectados, sino, no es divertido."};


  //cheeks
  if ((count (nearestObjects [player, ["man"], 10]))>1) exitwith {hint "De uno en uno, por favor"};

  if ((player getvariable "trabajo_medico_clandestino_activo") > 0) exitwith {};


    
    player setvariable ["trabajo_medico_clandestino_activo",1,true];

  //vars


  _time = 60 * 20;

 

  //punto entrega
  _posDestino = getMarkerPos "LaEmpresaHospital";
  _metros =  player distance _posDestino;
   _destino = "Hospital La Empresa";
    
  //hint info mision bonito
  
[[["- La Empresa -","<t align = 'center' size = '1.5' font='PuristaBold'>%1</t><br/>"],["","<br/>"],["Necesitamos ojos con urgencia, consigue 3 y serás recompensado.","<t align = 'center' size = '0.8' color = '#ffffff'>%1</t>"]]] spawn BIS_fnc_typeText;
  
  sleep 3;   

titleText["Lleva 3 ojos a -La Empresa-", "PLAIN"];
hint "Lleva 3 ojos a -La Empresa-";

  //timer mision
  while {_time > 0} do {

      //distancia   
      _metros =  player distance _posDestino;

  
      //tiempo
      sleep 1;
      _time = _time - 1;

      hintSilent format["Destino: %3 \n Tiempo : %1 \n Distancia: %2m ", [((_time)/60)+.01,"HH:MM"] call BIS_fnc_timetostring,round (_metros), _destino];
  

      /// si muere paramos el contador
      if !(alive player) then {   
        _time = 0;     
      };

    
    
      // el tio se toca los huevos pues no cobras
    
      if (_time <= 0 ) then {
            
         hint "Has tardado mucho en llegar, no queremos tratos con gente incompetente.";
         player setvariable ["trabajo_medico_clandestino_activo",0,true];

        _time = 0;
     
      };


     //llegamos al destino

    if(_metros < 10 )then{  

        titleText["Bien, ahora entrega los órganos.", "PLAIN"]; 

      
        //ha llegado a su destino final ya puede cobrar

        player setvariable ["pagar_trabajo_medico_clandestino",1,true];

        _time = 0;

    };



};//end while timer mision


 
};

if (_param  isEqualTo  "misionMedicoClandestinoCobrar") exitWith {

  if ((count (nearestObjects [player, ["man"], 10]))>1) exitwith {hint "De uno en uno, por favor"};

  if ((player getvariable "pagar_trabajo_medico_clandestino")  isEqualTo  0) exitwith {hint "Trabaja primero, ¿qué te crees que eres político?"};


   
    if ((player getvariable "pagar_trabajo_medico_clandestino") > 0) exitwith {

      _organos = "pop_ojos_item";
      _organosCantidad = [_organos] call ica_fnc_tengo;
      if(_organosCantidad < 3)exitWith{

        [[["- La Empresa -","<t align = 'center' size = '1.5' font='PuristaBold'>%1</t><br/>"],["","<br/>"],["Faltan ojos, queremos 3 pares...","<t align = 'center' size = '0.8' color = '#ffffff'>%1</t>"]]] spawn BIS_fnc_typeText;
  

      };

      //eliminar los ojos
      [_organos, -3] call ica_fnc_item;


          [[["- La Empresa -","<t align = 'center' size = '1.5' font='PuristaBold'>%1</t><br/>"],["","<br/>"],["Fantástico, has trabajado duro, -La empresa- siempre cumple aquí está tu recompensa.","<t align = 'center' size = '0.8' color = '#ffffff'>%1</t>"]]] spawn BIS_fnc_typeText;
  

            //quickskill 

            _exp = 5;
            _pago = 50000;

            //pagamos y damos exp

            stvrex_din = stvrex_din + _pago;
            ["exp",_exp] call ica_fnc_arrayexp;

          player setvariable ["pagar_trabajo_medico_clandestino",0,true];
          player setvariable ["trabajo_medico_clandestino_activo",0,true];

        
    };




};