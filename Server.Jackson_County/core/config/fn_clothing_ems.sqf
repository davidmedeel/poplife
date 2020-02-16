/*
	File: fn_clothing_bruce.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Master configuration file for Bruce's Outback Outfits.
*/
private["_filter"];
_filter = [_this,0,0,[0]] call BIS_fnc_param;
//Classname, Custom Display name (use nil for Cfg->DisplayName, price

//Shop Title Name
ctrlSetText[3103,"EMS Clothing Shop"];

switch (_filter) do
{
	//Uniforms
	case 0:
	{
		[
			["CRUZROJA",nil,500],
		    ["SAMUR",nil,500]
		];
	};
	
	//Hats
	case 1:
	{
		[
			["GORRA_CRUZ",nil,500],
		    ["GORRA_SAMUR",nil,500],
			["H_Hat_Tinfoil_F",nil,850]
		];
	};
	
	//Glasses
	case 2:
	{
		[
			["G_Shades_Black",nil,25],
			["G_Respirator_yellow_F",nil,20],
			["G_Sport_Blackred",nil,20],
			["G_Sport_Checkered",nil,20],
			["G_Sport_Blackyellow",nil,20],
			["G_Sport_BlackWhite",nil,20],
			["G_Aviator",nil,75],
			["G_Squares",nil,10],
			["G_Diving", nil, 20]
			
		];
	};
	
	//Vest
	case 3:
	{
		[
			["streetv_chaleco_tela_auxiliar",nil,500],
			["streetv_chaleco_tela_enfermero",nil,500],
            ["streetv_chaleco_tela_jefe_planta",nil,500],
			["streetv_chaleco_tela_jefe_medico",nil,500],
		    ["streetv_chaleco_tela_medico",nil,500]
		];
	};
	
	//Backpacks
	case 4:
	{
		[
			["mochila_mediana",nil,1000],
			["mochila_pequena",nil,300]
		];
	};
};
