/*
Script creado por Sergio Rex
*/
#include <macro.h>

_param = _this select 0;

	_lvl = (__GETC__(life_coplevel));
	
	disableSerialization;

if (_param isequalto "entrar") exitwith {

	switch (_lvl) do {
		case 0: { hint "No eres policia.";
		};

		case 1: {
		if (player getvariable "PoliON") exitwith {hint "Ya estas de servicio";};
		player setvariable ["PoliciaDeServicio", 1, true];
		
	_grp = createGroup west; 
	_oldPlayer = player; 
	_oldPosplayer = getposWorld player; 
	_dir = getDir player; 
	_oldVarName = vehicleVarName _oldPlayer; 
	[_oldPlayer] joinSilent _grp;  

		
		player setvariable ["PoliON",true];
		player setVariable ["abropuertas",true];
		[] call life_fnc_setupActions;
		
		player setvariable ["UniformePoli",uniform player,true];
		player setvariable ["ChalecoPoli",vest player,true];
		player setvariable ["MochilaPoli",backpack player,true];

		
		license_civ_policiaon = true;
		//["Departamento de Policia","! Recuerda coger el equipamiento adecuado ¡"] spawn ica_fnc_hintc;
		//sleep 20;
		("LogoPoli" call BIS_fnc_rscLayer) cutRsc ["LogoPoli","PLAIN", 1, false];
		};

		case 2: {
		if (player getvariable "PoliON") exitwith {hint "Ya estas de servicio";};
		player setvariable ["PoliciaDeServicio", 2, true];
		
	_grp = createGroup west; 
	_oldPlayer = player; 
	_oldPosplayer = getposWorld player; 
	_dir = getDir player; 
	_oldVarName = vehicleVarName _oldPlayer; 
	[_oldPlayer] joinSilent _grp;  

		
		player setvariable ["PoliON",true];
		player setVariable ["abropuertas",true];
		[] call life_fnc_setupActions;

		player setvariable ["UniformePoli",uniform player,true];
		player setvariable ["ChalecoPoli",vest player,true];
		player setvariable ["MochilaPoli",backpack player,true];
		
		
		license_civ_policiaon = true;
		//["Departamento de Policia","! Recuerda coger el equipamiento adecuado ¡"] spawn ica_fnc_hintc;
		//sleep 20;
		("LogoPoli" call BIS_fnc_rscLayer) cutRsc ["LogoPoli","PLAIN", 1, false];
		};

		case 3: {
		player setvariable ["PoliciaDeServicio", 3, true];
		if (player getvariable "PoliON") exitwith {hint "Ya estas de servicio";};
		
	_grp = createGroup west; 
	_oldPlayer = player; 
	_oldPosplayer = getposWorld player; 
	_dir = getDir player; 
	_oldVarName = vehicleVarName _oldPlayer; 
	[_oldPlayer] joinSilent _grp;  

		
		player setvariable ["PoliON",true];
		player setVariable ["abropuertas",true];
		[] call life_fnc_setupActions;
		
		player setvariable ["UniformePoli",uniform player,true];
		player setvariable ["ChalecoPoli",vest player,true];
		player setvariable ["MochilaPoli",backpack player,true];
		
		license_civ_policiaon = true;
		//["Departamento de Policia","! Recuerda coger el equipamiento adecuado ¡"] spawn ica_fnc_hintc;
		//sleep 20;
		("LogoPoli" call BIS_fnc_rscLayer) cutRsc ["LogoPoli","PLAIN", 1, false];
		};

		case 4: {
		if (player getvariable "PoliON") exitwith {hint "Ya estas de servicio";};
		player setvariable ["PoliciaDeServicio", 4, true];

	_grp = createGroup west; 
	_oldPlayer = player; 
	_oldPosplayer = getposWorld player; 
	_dir = getDir player; 
	_oldVarName = vehicleVarName _oldPlayer; 
	[_oldPlayer] joinSilent _grp;  

		
		player setvariable ["PoliON",true];
		player setVariable ["abropuertas",true];
		[] call life_fnc_setupActions;

		player setvariable ["UniformePoli",uniform player,true];
		player setvariable ["ChalecoPoli",vest player,true];
		player setvariable ["MochilaPoli",backpack player,true];
		

		
		license_civ_policiaon = true;
		//["Departamento de Policia","! Recuerda coger el equipamiento adecuado ¡"] spawn ica_fnc_hintc;
		//sleep 20;
		("LogoPoli" call BIS_fnc_rscLayer) cutRsc ["LogoPoli","PLAIN", 1, false];
		};

		case 5: {
		if (player getvariable "PoliON") exitwith {hint "Ya estas de servicio";};
		player setvariable ["PoliciaDeServicio", 5, true];
		
	_grp = createGroup west; 
	_oldPlayer = player; 
	_oldPosplayer = getposWorld player; 
	_dir = getDir player; 
	_oldVarName = vehicleVarName _oldPlayer; 
	[_oldPlayer] joinSilent _grp;  

		
		player setvariable ["PoliON",true];
		player setVariable ["abropuertas",true];
		[] call life_fnc_setupActions;

		player setvariable ["UniformePoli",uniform player,true];
		player setvariable ["ChalecoPoli",vest player,true];
		player setvariable ["MochilaPoli",backpack player,true];
		

		
		license_civ_policiaon = true;
		//["Departamento de Policia","! Recuerda coger el equipamiento adecuado ¡"] spawn ica_fnc_hintc;
		//sleep 20;
		("LogoPoli" call BIS_fnc_rscLayer) cutRsc ["LogoPoli","PLAIN", 1, false];

		};

		case 6: {
		if (player getvariable "PoliON") exitwith {hint "Ya estas de servicio";};
		player setvariable ["PoliciaDeServicio", 6, true];
		
	_grp = createGroup west; 
	_oldPlayer = player; 
	_oldPosplayer = getposWorld player; 
	_dir = getDir player; 
	_oldVarName = vehicleVarName _oldPlayer; 
	[_oldPlayer] joinSilent _grp;  

		
		player setvariable ["PoliON",true];
		player setVariable ["abropuertas",true];
		[] call life_fnc_setupActions;

		player setvariable ["UniformePoli",uniform player,true];
		player setvariable ["ChalecoPoli",vest player,true];
		player setvariable ["MochilaPoli",backpack player,true];
		
		
		license_civ_policiaon = true;
		//["Departamento de Policia","! Recuerda coger el equipamiento adecuado ¡"] spawn ica_fnc_hintc;
				//sleep 20;
		("LogoPoli" call BIS_fnc_rscLayer) cutRsc ["LogoPoli","PLAIN", 1, false];

		};

		case 7: {
		if (player getvariable "PoliON") exitwith {hint "Ya estas de servicio";};
		player setvariable ["PoliciaDeServicio", 7, true];
		
	_grp = createGroup west; 
	_oldPlayer = player; 
	_oldPosplayer = getposWorld player; 
	_dir = getDir player; 
	_oldVarName = vehicleVarName _oldPlayer; 
	[_oldPlayer] joinSilent _grp;  

		player setvariable ["UniformePoli",uniform player,true];
		player setvariable ["ChalecoPoli",vest player,true];
		player setvariable ["MochilaPoli",backpack player,true];

		
		player setvariable ["PoliON",true];
		player setVariable ["abropuertas",true];
		[] call life_fnc_setupActions;
		
		("LogoPoli" call BIS_fnc_rscLayer) cutRsc ["LogoPoli","PLAIN", 1, false];
		
		license_civ_policiaon = true;
		//["Departamento de Policia","! Recuerda coger el equipamiento adecuado ¡"] spawn ica_fnc_hintc;
		player setvariable ["PoliciaDeServicio", 7, true];
		//sleep 20;
		("LogoPoli" call BIS_fnc_rscLayer) cutRsc ["LogoPoli","PLAIN", 1, false];
		};
	};	
};


if (_param isequalto "salir") exitwith {

	switch (_lvl) do {
		case 0: { hint "No eres policia."
		};

		case 1: {
		if !(player getvariable "PoliON") exitwith {hint "Ya estas fuera de servicio!";};
		player setvariable ["PoliciaDeServicio", false];
	_grp = createGroup civilian; 
	_oldPlayer = player; 
	_oldPosplayer = getposWorld player; 
	_dir = getDir player; 
	_oldVarName = vehicleVarName _oldPlayer; 
	[_oldPlayer] joinSilent _grp;  

		
		player setvariable ["PoliON",false];
		player setVariable ["abropuertas",false];
		[] call life_fnc_setupActions;

		_uniforme = player getvariable "UniformePoli";
		_chaleco = player getvariable "ChalecoPoli";
		_mochila = player getvariable "MochilaPoli";
		removeUniform player;
		removevest player;
		removeBackpack player;
		player addUniform _uniforme;
		player addvest _chaleco;
		player addBackpack _mochila;
		"LogoPoli" cutFadeOut 0;
		
		license_civ_policiaon = false;

		};

		case 2: {
		if !(player getvariable "PoliON") exitwith {hint "Ya estas fuera de servicio!";};
		player setvariable ["PoliciaDeServicio", false];
	_grp = createGroup civilian; 
	_oldPlayer = player; 
	_oldPosplayer = getposWorld player; 
	_dir = getDir player; 
	_oldVarName = vehicleVarName _oldPlayer; 
	[_oldPlayer] joinSilent _grp;  

		
		player setvariable ["PoliON",false];
		player setVariable ["abropuertas",false];
		[] call life_fnc_setupActions;
		
		"LogoPoli" cutFadeOut 0;

		_uniforme = player getvariable "UniformePoli";
		_chaleco = player getvariable "ChalecoPoli";
		_mochila = player getvariable "MochilaPoli";
		removeUniform player;
		removevest player;
		removeBackpack player;
		player addUniform _uniforme;
		player addvest _chaleco;
		player addBackpack _mochila;
		
		license_civ_policiaon = false;

		};

		case 3: {
		if !(player getvariable "PoliON") exitwith {hint "Ya estas fuera de servicio!";};
		player setvariable ["PoliciaDeServicio", false];
	_grp = createGroup civilian; 
	_oldPlayer = player; 
	_oldPosplayer = getposWorld player; 
	_dir = getDir player; 
	_oldVarName = vehicleVarName _oldPlayer; 
	[_oldPlayer] joinSilent _grp;  

		
		player setvariable ["PoliON",false];
		player setVariable ["abropuertas",false];
		[] call life_fnc_setupActions;
		
		"LogoPoli" cutFadeOut 0;

		_uniforme = player getvariable "UniformePoli";
		_chaleco = player getvariable "ChalecoPoli";
		_mochila = player getvariable "MochilaPoli";
		removeUniform player;
		removevest player;
		removeBackpack player;
		player addUniform _uniforme;
		player addvest _chaleco;
		player addBackpack _mochila;
		
		license_civ_policiaon = false;

		};

		case 4: {
		if !(player getvariable "PoliON") exitwith {hint "Ya estas fuera de servicio!";};
		player setvariable ["PoliciaDeServicio", false];
	_grp = createGroup civilian; 
	_oldPlayer = player; 
	_oldPosplayer = getposWorld player; 
	_dir = getDir player; 
	_oldVarName = vehicleVarName _oldPlayer; 
	[_oldPlayer] joinSilent _grp;  

		
		player setvariable ["PoliON",false];
		player setVariable ["abropuertas",false];
		[] call life_fnc_setupActions;

		_uniforme = player getvariable "UniformePoli";
		_chaleco = player getvariable "ChalecoPoli";
		_mochila = player getvariable "MochilaPoli";
		removeUniform player;
		removevest player;
		removeBackpack player;
		player addUniform _uniforme;
		player addvest _chaleco;
		player addBackpack _mochila;
		
		"LogoPoli" cutFadeOut 0;
		
		license_civ_policiaon = false;

		};

		case 5: {
		if !(player getvariable "PoliON") exitwith {hint "Ya estas fuera de servicio!";};
		player setvariable ["PoliciaDeServicio", false];
	_grp = createGroup civilian; 
	_oldPlayer = player; 
	_oldPosplayer = getposWorld player; 
	_dir = getDir player; 
	_oldVarName = vehicleVarName _oldPlayer; 
	[_oldPlayer] joinSilent _grp;  

		
		player setVariable ["abropuertas",false];
		player setvariable ["PoliON",false];
		[] call life_fnc_setupActions;

		_uniforme = player getvariable "UniformePoli";
		_chaleco = player getvariable "ChalecoPoli";
		_mochila = player getvariable "MochilaPoli";
		removeUniform player;
		removevest player;
		removeBackpack player;
		player addUniform _uniforme;
		player addvest _chaleco;
		player addBackpack _mochila;
		
		"LogoPoli" cutFadeOut 0;
		
		license_civ_policiaon = false;


		};

		case 6: {
		if !(player getvariable "PoliON") exitwith {hint "Ya estas fuera de servicio!";};
		player setvariable ["PoliciaDeServicio", false];
	_grp = createGroup civilian; 
	_oldPlayer = player; 
	_oldPosplayer = getposWorld player; 
	_dir = getDir player; 
	_oldVarName = vehicleVarName _oldPlayer; 
	[_oldPlayer] joinSilent _grp;  

		
		player setvariable ["PoliON",false];
		player setVariable ["abropuertas",false];
		[] call life_fnc_setupActions;

		_uniforme = player getvariable "UniformePoli";
		_chaleco = player getvariable "ChalecoPoli";
		_mochila = player getvariable "MochilaPoli";
		removeUniform player;
		removevest player;
		removeBackpack player;
		player addUniform _uniforme;
		player addvest _chaleco;
		player addBackpack _mochila;
		
		"LogoPoli" cutFadeOut 0;
		
		license_civ_policiaon = false;

		};

		case 7: {
		if !(player getvariable "PoliON") exitwith {hint "Ya estas fuera de servicio!";};
		player setvariable ["PoliciaDeServicio", false];
	_grp = createGroup civilian; 
	_oldPlayer = player; 
	_oldPosplayer = getposWorld player; 
	_dir = getDir player; 
	_oldVarName = vehicleVarName _oldPlayer; 
	[_oldPlayer] joinSilent _grp;  

		_uniforme = player getvariable "UniformePoli";
		_chaleco = player getvariable "ChalecoPoli";
		_mochila = player getvariable "MochilaPoli";
		removeUniform player;
		removevest player;
		removeBackpack player;
		player addUniform _uniforme;
		player addvest _chaleco;
		player addBackpack _mochila;
		
		player setvariable ["PoliON",false];
		player setVariable ["abropuertas",false];
		[] call life_fnc_setupActions;
		
		"LogoPoli" cutFadeOut 0;
		
		license_civ_policiaon = false;

		};
	};	
};