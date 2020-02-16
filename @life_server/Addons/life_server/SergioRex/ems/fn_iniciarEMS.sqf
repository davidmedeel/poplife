/*
Script creado por Sergio Rex
*/


#include <macro.h>

_param = _this select 0;

	_lvl = (__GETC__(life_mediclevel));
	
	disableSerialization;

if (_param isequalto "entrar") exitwith {

	switch (_lvl) do {
		case 0: { hint "No eres EMS.";
		};

		case 1: {
		if (player getvariable "EMSON") exitwith {hint "Ya estas de servicio";};
		player setvariable ["EmsDeServicio", 1, true];
		
	_grp = createGroup independent; 
	_oldPlayer = player; 
	_oldPosplayer = getposWorld player; 
	_dir = getDir player; 
	_oldVarName = vehicleVarName _oldPlayer; 
	[_oldPlayer] joinSilent _grp;  

		player setvariable ["UniformeEMS",uniform player,true];
		player setvariable ["ChalecoEMS",vest player,true];
		player setvariable ["MochilaEMS",backpack player,true];

		
		player setvariable ["EMSON",true];
		player setVariable ["abropuertas",true];
		[] call life_fnc_setupActions;
		

		
		license_civ_emson = true;
		//["Departamento de Policia","! Recuerda coger el equipamiento adecuado ¡"] spawn ica_fnc_hintc;
		//sleep 20;
		("LogoEMS" call BIS_fnc_rscLayer) cutRsc ["LogoEMS","PLAIN", 1, false];
		};

		case 2: {
		if (player getvariable "EMSON") exitwith {hint "Ya estas de servicio";};
		player setvariable ["EMSDeServicio", 2, true];
		
	_grp = createGroup independent; 
	_oldPlayer = player; 
	_oldPosplayer = getposWorld player; 
	_dir = getDir player; 
	_oldVarName = vehicleVarName _oldPlayer; 
	[_oldPlayer] joinSilent _grp;  

		player setvariable ["UniformeEMS",uniform player,true];
		player setvariable ["ChalecoEMS",vest player,true];
		player setvariable ["MochilaEMS",backpack player,true];

		
		player setvariable ["EMSON",true];
		player setVariable ["abropuertas",true];
		[] call life_fnc_setupActions;
		
		license_civ_emson = true;
		//["Departamento de Policia","! Recuerda coger el equipamiento adecuado ¡"] spawn ica_fnc_hintc;
		//sleep 20;
		("LogoEMS" call BIS_fnc_rscLayer) cutRsc ["LogoEMS","PLAIN", 1, false];
		
		};

		case 3: {
		if (player getvariable "EMSON") exitwith {hint "Ya estas de servicio";};
		player setvariable ["EMSDeServicio", 3, true];
		
	_grp = createGroup independent; 
	_oldPlayer = player; 
	_oldPosplayer = getposWorld player; 
	_dir = getDir player; 
	_oldVarName = vehicleVarName _oldPlayer; 
	[_oldPlayer] joinSilent _grp;  

		
		player setvariable ["EMSON",true];
		player setVariable ["abropuertas",true];
		[] call life_fnc_setupActions;

		player setvariable ["UniformeEMS",uniform player,true];
		player setvariable ["ChalecoEMS",vest player,true];
		player setvariable ["MochilaEMS",backpack player,true];
		
		
		license_civ_emson = true;
		//["Departamento de Policia","! Recuerda coger el equipamiento adecuado ¡"] spawn ica_fnc_hintc;
		//sleep 20;
		("LogoEMS" call BIS_fnc_rscLayer) cutRsc ["LogoEMS","PLAIN", 1, false];
		};

		case 4: {
		if (player getvariable "EMSON") exitwith {hint "Ya estas de servicio";};
		player setvariable ["EMSDeServicio", 4, true];
		
	_grp = createGroup independent; 
	_oldPlayer = player; 
	_oldPosplayer = getposWorld player; 
	_dir = getDir player; 
	_oldVarName = vehicleVarName _oldPlayer; 
	[_oldPlayer] joinSilent _grp;  

		
		player setvariable ["EMSON",true];
		player setVariable ["abropuertas",true];
		[] call life_fnc_setupActions;
		

		
		license_civ_emson = true;
		//["Departamento de Policia","! Recuerda coger el equipamiento adecuado ¡"] spawn ica_fnc_hintc;
		//sleep 20;
		("LogoEMS" call BIS_fnc_rscLayer) cutRsc ["LogoEMS","PLAIN", 1, false];
		};

		case 5: {
		player setvariable ["EMSDeServicio", 5, true];
		if (player getvariable "EMSON") exitwith {hint "Ya estas de servicio";};
		
	_grp = createGroup independent; 
	_oldPlayer = player; 
	_oldPosplayer = getposWorld player; 
	_dir = getDir player; 
	_oldVarName = vehicleVarName _oldPlayer; 
	[_oldPlayer] joinSilent _grp;  

		
		player setvariable ["EMSON",true];
		player setVariable ["abropuertas",true];
		[] call life_fnc_setupActions;
		player setvariable ["UniformeEMS",uniform player,true];
		player setvariable ["ChalecoEMS",vest player,true];
		player setvariable ["MochilaEMS",backpack player,true];

		
		license_civ_emson = true;
		//["Departamento de Policia","! Recuerda coger el equipamiento adecuado ¡"] spawn ica_fnc_hintc;
		//sleep 20;
		("LogoEMS" call BIS_fnc_rscLayer) cutRsc ["LogoEMS","PLAIN", 1, false];

		};
	};	
};


if (_param isequalto "salir") exitwith {

	switch (_lvl) do {
		case 0: { hint "No eres policia."
		};

		case 1: {
		if !(player getvariable "EMSON") exitwith {hint "Ya estas fuera de servicio!";};
		player setvariable ["EMSDeServicio", false];
	_grp = createGroup civilian; 
	_oldPlayer = player; 
	_oldPosplayer = getposWorld player; 
	_dir = getDir player; 
	_oldVarName = vehicleVarName _oldPlayer; 
	[_oldPlayer] joinSilent _grp;  

		_uniforme = player getvariable "UniformeEMS";
		_chaleco = player getvariable "ChalecoEMS";
		_mochila = player getvariable "MochilaEMS";
		removeUniform player;
		removevest player;
		removeBackpack player;
		player addUniform _uniforme;
		player addvest _chaleco;
		player addBackpack _mochila;

		
		player setvariable ["EMSON",false];
		player setVariable ["abropuertas",false];
		[] call life_fnc_setupActions;
		
		"LogoEMS" cutFadeOut 0;
		
		license_civ_emson = false;

		};

		case 2: {
		if !(player getvariable "EMSON") exitwith {hint "Ya estas fuera de servicio!";};
		player setvariable ["EMSDeServicio", false];
	_grp = createGroup civilian; 
	_oldPlayer = player; 
	_oldPosplayer = getposWorld player; 
	_dir = getDir player; 
	_oldVarName = vehicleVarName _oldPlayer; 
	[_oldPlayer] joinSilent _grp;  

		
		player setvariable ["EMSON",false];
		player setVariable ["abropuertas",false];
		[] call life_fnc_setupActions;

		_uniforme = player getvariable "UniformeEMS";
		_chaleco = player getvariable "ChalecoEMS";
		_mochila = player getvariable "MochilaEMS";
		removeUniform player;
		removevest player;
		removeBackpack player;
		player addUniform _uniforme;
		player addvest _chaleco;
		player addBackpack _mochila;
		
		"LogoEMS" cutFadeOut 0;
		
		license_civ_emson = false;

		};

		case 3: {
		if !(player getvariable "EMSON") exitwith {hint "Ya estas fuera de servicio!";};
		player setvariable ["EMSDeServicio", false];
	_grp = createGroup civilian; 
	_oldPlayer = player; 
	_oldPosplayer = getposWorld player; 
	_dir = getDir player; 
	_oldVarName = vehicleVarName _oldPlayer; 
	[_oldPlayer] joinSilent _grp;  

		
		player setvariable ["EMSON",false];
		player setVariable ["abropuertas",false];
		[] call life_fnc_setupActions;
		_uniforme = player getvariable "UniformeEMS";
		_chaleco = player getvariable "ChalecoEMS";
		_mochila = player getvariable "MochilaEMS";
		removeUniform player;
		removevest player;
		removeBackpack player;
		player addUniform _uniforme;
		player addvest _chaleco;
		player addBackpack _mochila;
		"LogoEMS" cutFadeOut 0;
		
		license_civ_emson = false;

		};

		case 4: {
		if !(player getvariable "EMSON") exitwith {hint "Ya estas fuera de servicio!";};
		player setvariable ["EMSDeServicio", false];
	_grp = createGroup civilian; 
	_oldPlayer = player; 
	_oldPosplayer = getposWorld player; 
	_dir = getDir player; 
	_oldVarName = vehicleVarName _oldPlayer; 
	[_oldPlayer] joinSilent _grp;  

		
		player setvariable ["EMSON",false];
		player setVariable ["abropuertas",false];
		[] call life_fnc_setupActions;
		_uniforme = player getvariable "UniformeEMS";
		_chaleco = player getvariable "ChalecoEMS";
		_mochila = player getvariable "MochilaEMS";
		removeUniform player;
		removevest player;
		removeBackpack player;
		player addUniform _uniforme;
		player addvest _chaleco;
		player addBackpack _mochila;
		"LogoEMS" cutFadeOut 0;
		
		license_civ_emson = false;

		};

		case 5: {
		if !(player getvariable "EMSON") exitwith {hint "Ya estas fuera de servicio!";};
		player setvariable ["EMSDeServicio", false];
	_grp = createGroup civilian; 
	_oldPlayer = player; 
	_oldPosplayer = getposWorld player; 
	_dir = getDir player; 
	_oldVarName = vehicleVarName _oldPlayer; 
	[_oldPlayer] joinSilent _grp;  

		_uniforme = player getvariable "UniformeEMS";
		_chaleco = player getvariable "ChalecoEMS";
		_mochila = player getvariable "MochilaEMS";
		removeUniform player;
		removevest player;
		removeBackpack player;
		player addUniform _uniforme;
		player addvest _chaleco;
		player addBackpack _mochila;
		player setvariable ["EMSON",false];
		player setVariable ["abropuertas",false];
		[] call life_fnc_setupActions;
		
		"LogoEMS" cutFadeOut 0;
		
		license_civ_emson = false;


		};
	};	
};
