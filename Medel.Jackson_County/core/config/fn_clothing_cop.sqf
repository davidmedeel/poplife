#include <macro.h>
/*
	File: fn_clothing_cop.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Master config file for Cop clothing store.
*/
private["_filter","_ret"];
_filter = [_this,0,0,[0]] call BIS_fnc_param;
//Classname, Custom Display name (use nil for Cfg-<DisplayName, price

//Shop Title Name
ctrlSetText[3103,"Policia ProjectGamers"];

_ret = [];
switch (_filter) do
{
	//Uniforms
	case 0:
    {
		_ret set[count _ret,["","----- CNP -----",0]];
		_ret set[count _ret,["CNP_alumno","Recluta",100]];
		_ret set[count _ret,["CNP_policia","Agente",100]];
		_ret set[count _ret,["CNP_oficial","Oficial",100]];
		_ret set[count _ret,["CNP_subinspector","Sub Inspector",100]];
		_ret set[count _ret,["CNP_inspector","Inspector",100]];
		_ret set[count _ret,["CNP_inspector_jefe","Inspector Jefe",100]];
		_ret set[count _ret,["CNP_comisario","Comisario",100]];
		_ret set[count _ret,["CNP2","UPR",100]];
		_ret set[count _ret,["","----- GC -----",0]];
		_ret set[count _ret,["GC_guardia","Recluta",100]];
		_ret set[count _ret,["GC_cabo","Cabo",100]];
		_ret set[count _ret,["GC_cabo_mayor","Cabo Mayor",100]];
		_ret set[count _ret,["GC_sargento","Sargento",100]];
		_ret set[count _ret,["GC_subteniente","Sub Teniente",100]];
		_ret set[count _ret,["GC_teniente","Teniente",100]];
		_ret set[count _ret,["GC_coronel","Coronel",100]];
		_ret set[count _ret,["GRS","GRS",100]];
		_ret set[count _ret,["ATGC","Trafico",100]];
		_ret set[count _ret,["ATGC3","Trafico",100]];
		
        if(__GETC__(life_coplevel) >= 6) then
        {
            _ret set[count _ret,["GEO_Pop","GEO",1500]];
        };

    };

	//Hats
	case 1:
	{
			_ret set[count _ret,["","----- CNP -----",0]];
			_ret set[count _ret,["GORRA_CNP",nil,150]];
			_ret set[count _ret,["","----- GC -----",0]];
			_ret set[count _ret,["GORRA_GC",nil,150]];
			_ret set[count _ret,["CASCO_GC",nil,150]];


	};

	//Glasses
	case 2:
	{
		_ret =
		[
			["G_Shades_Black",nil,25],
			["G_Shades_Blue",nil,20],
			["G_Sport_Blackred",nil,20],
			["G_Sport_Checkered",nil,20],
			["G_Sport_Blackyellow",nil,20],
			["G_Sport_BlackWhite",nil,20],
			["G_Aviator",nil,75],
			["G_Squares",nil,10],
			["G_Lowprofile",nil,30],
			["G_Balaclava_blk",nil,30],
			["G_Combat",nil,55],
			["G_Diving",nil,500]
		];
	};

	//Vest
	case 3:
	{
		_ret set[count _ret,["","----- CNP -----",0]];
		_ret set[count _ret,["streetv_cinturon","Cinturon",1000]];
		_ret set[count _ret,["streetv_chaleco_antibalas_cnp_1",nil,1000]];
		_ret set[count _ret,["streetv_chaleco_nacional_1",nil,1000]];
		_ret set[count _ret,["streetv_chaleco_tela_cnp",nil,1000]];
		_ret set[count _ret,["","----- GC -----",0]];
		_ret set[count _ret,["streetv_chaleco_gcivil_1",nil,1000]];
		_ret set[count _ret,["streetv_chaleco_antibalas_gc_1",nil,1000]];
		_ret set[count _ret,["streetv_chaleco_gcivil_1",nil,1000]];
		_ret set[count _ret,["streetv_chaleco_tela_atgc",nil,1000]];



	};

	//Backpacks
	case 4:
	{
		_ret =
		[
			["B_Parachute",nil,100],
			["mochila_pequena",nil,800],
			["mochila_mediana",nil,5000]
			//["B_TacticalPack_blk",nil,1000],
			//["B_Carryall_cbr",nil,1000]
		];
	};
};

_ret;