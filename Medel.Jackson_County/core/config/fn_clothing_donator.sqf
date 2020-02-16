#include <macro.h>

/*
	File: fn_clothing_donator.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	donators
*/
private["_filter","_ret"];
_filter = [_this,0,0,[0]] call BIS_fnc_param;
//Classname, Custom Display name (use nil for Cfg-<DisplayName, price

//Shop Title Name
ctrlSetText[3103,"Tienda donadores"];

_ret = [];
switch (_filter) do
{
	//Uniforms
	case 0:
    {
        if(__GETC__(life_donator) == 0) then
        {
			_ret set[count _ret,["No tienes acceso a la tienda",nil,2000]];


        };
		
        if(__GETC__(life_donator) >= 1) then
        {
			_ret set[count _ret,["vvv_character_messi",nil,2000]];
			_ret set[count _ret,["vvv_traje_romano",nil,2000]];
			_ret set[count _ret,["A3L_Bikini_Girl",nil,2000]];
			_ret set[count _ret,["A3L_Farmer_Outfit",nil,2000]];
			_ret set[count _ret,["A3L_SpookyMummy",nil,2000]];
			_ret set[count _ret,["A3L_Worker_Outfit",nil,2000]];
			_ret set[count _ret,["KAEL_SUITS_BR_F24",nil,2000]];
			_ret set[count _ret,["KAEL_SUITS_BR_F25",nil,2000]];
			_ret set[count _ret,["KAEL_SUITS_BR_F16",nil,2000]];
			_ret set[count _ret,["KAEL_SUITS_BR_F17",nil,2000]];
			_ret set[count _ret,["KAEL_SUITS_BR_F18",nil,2000]];
			_ret set[count _ret,["KAEL_SUITS_BR_F19",nil,2000]];
			_ret set[count _ret,["KAEL_SUITS_BR_F20",nil,2000]];
			_ret set[count _ret,["KAEL_SUITS_BR_F21",nil,2000]];
			_ret set[count _ret,["KAEL_SUITS_BR_F23",nil,2000]];
			_ret set[count _ret,["KAEL_SUITS_BR_F26",nil,2000]];
			_ret set[count _ret,["KAEL_SUITS_BR_F27",nil,2000]];
			_ret set[count _ret,["KAEL_SUITS_BR_F28",nil,2000]];
			_ret set[count _ret,["KAEL_SUITS_BR_F29",nil,2000]];
			_ret set[count _ret,["KAEL_SUITS_BR_F30",nil,2000]];
			_ret set[count _ret,["KAEL_SUITS_BR_F31",nil,2000]];
			_ret set[count _ret,["KAEL_SUITS_BR_F32",nil,2000]];
			_ret set[count _ret,["KAEL_SUITS_BR_F33",nil,2000]];
			_ret set[count _ret,["KAEL_SUITS_BR_F34",nil,2000]];
			_ret set[count _ret,["KAEL_SUITS_BR_F35",nil,2000]];
			_ret set[count _ret,["KAEL_SUITS_BR_F8",nil,2000]];
			_ret set[count _ret,["KAEL_SUITS_BLK_F",nil,2000]];
			_ret set[count _ret,["KAEL_SUITS_BR_F11",nil,2000]];
			_ret set[count _ret,["KAEL_SUITS_BR_F10",nil,2000]];
			_ret set[count _ret,["KAEL_SUITS_BR_F7",nil,2000]];
			_ret set[count _ret,["KAEL_SUITS_BR_F6",nil,2000]];
			_ret set[count _ret,["KAEL_SUITS_BR_F5",nil,2000]];
			_ret set[count _ret,["KAEL_SUITS_BR_F",nil,2000]];
			_ret set[count _ret,["KAEL_SUITS_BR_F9",nil,2000]];
			_ret set[count _ret,["KAEL_SUITS_BR_F13",nil,2000]];
			_ret set[count _ret,["KAEL_SUITS_BR_F14",nil,2000]];
			_ret set[count _ret,["U_C_Uniform_Scientist_01_formal_F",nil,2000]];
			_ret set[count _ret,["U_C_Uniform_Scientist_02_F",nil,2000]];
			_ret set[count _ret,["U_C_Uniform_Scientist_01_F",nil,2000]];
			_ret set[count _ret,["TRYK_U_B_PCUHsW8",nil,2000]];
			_ret set[count _ret,["TRYK_U_B_PCUHsW3",nil,2000]];
			_ret set[count _ret,["TRYK_U_B_PCUHsW9",nil,2000]];
			_ret set[count _ret,["TRYK_U_B_BLKBLK_CombatUniform",nil,2000]];
			_ret set[count _ret,["TRYK_U_B_PCUHsW7",nil,2000]];
			_ret set[count _ret,["TRYK_U_B_BLKBLK_R_CombatUniform",nil,2000]];
			_ret set[count _ret,["TRYK_U_B_BLKOCP_CombatUniform",nil,2000]];
			_ret set[count _ret,["TRYK_U_B_BLKOCP_R_CombatUniformTshirt",nil,2000]];
			_ret set[count _ret,["TRYK_U_B_BLKTAN_CombatUniform",nil,2000]];
			_ret set[count _ret,["TRYK_U_B_BLKTANR_CombatUniformTshirt",nil,2000]];
			_ret set[count _ret,["TRYK_U_B_BLK3CD",nil,2000]];
			_ret set[count _ret,["TRYK_U_B_BLKTAN_Tshirt",nil,2000]];
			_ret set[count _ret,["TRYK_U_B_BLK3CD_Tshirt",nil,2000]];
			_ret set[count _ret,["TRYK_U_B_BLKTAN",nil,2000]];
			_ret set[count _ret,["TRYK_U_B_BLK_Tshirt",nil,2000]];
			_ret set[count _ret,["TRYK_U_B_BLK",nil,2000]];
			_ret set[count _ret,["TRYK_U_B_BLK_OD_Tshirt",nil,2000]];
			_ret set[count _ret,["TRYK_U_B_OD_BLK_2",nil,2000]];
			_ret set[count _ret,["TRYK_U_B_BLK_OD",nil,2000]];
			_ret set[count _ret,["TRYK_U_B_OD_BLK",nil,2000]];
			_ret set[count _ret,["TRYK_U_B_ODTAN_Tshirt",nil,2000]];
			_ret set[count _ret,["TRYK_U_B_ODTAN",nil,2000]];
			_ret set[count _ret,["TRYK_U_B_BLK_TAN_2",nil,2000]];
			_ret set[count _ret,["TRYK_U_B_BLK_TAN_1",nil,2000]];
			_ret set[count _ret,["TRYK_U_B_3CD_BLK_BDUTshirt",nil,2000]];
			_ret set[count _ret,["TRYK_U_B_3CD_BLK_BDUTshirt2",nil,2000]];
			_ret set[count _ret,["TRYK_U_B_GRTAN_CombatUniform",nil,2000]];
			_ret set[count _ret,["TRYK_U_B_GRTANR_CombatUniformTshirt",nil,2000]];
			_ret set[count _ret,["TRYK_U_B_GRYOCP_CombatUniform",nil,2000]];
			_ret set[count _ret,["TRYK_U_B_GRYOCP_R_CombatUniformTshirt",nil,2000]];
			_ret set[count _ret,["TRYK_U_B_MARPAT_Desert_Tshirt",nil,2000]];
			_ret set[count _ret,["TRYK_U_B_MARPAT_Desert",nil,2000]];
			_ret set[count _ret,["TRYK_U_B_MARPAT_Desert2_Tshirt",nil,2000]];
			_ret set[count _ret,["vvv_traje_dallas",nil,2000]];
			_ret set[count _ret,["TRYK_U_B_MARPAT_Desert2",nil,2000]];
			_ret set[count _ret,["vvv_character_batman",nil,2000]];	
        };
		
    };
	
	//Hats
	case 1:
	{   
	   if(__GETC__(life_donator) > 0) then
	   {
		   _ret set[count _ret,["H_HeadBandage_bloody_F",nil,1500]];
		   _ret set[count _ret,["H_Hat_Safari_olive_F",nil,1500]];
		   _ret set[count _ret,["H_Hat_Safari_sand_F",nil,1500]];
		   _ret set[count _ret,["H_Hat_Tinfoil_F",nil,1500]];
		   _ret set[count _ret,["A3L_russianhat",nil,1500]];
		   _ret set[count _ret,["A3L_sombrero",nil,1500]];
		   _ret set[count _ret,["H_Soccer_Orange",nil,1500]];
		   _ret set[count _ret,["A3L_mexicanhat",nil,1500]];
		   _ret set[count _ret,["A3L_longhairbrown",nil,1500]];
		   _ret set[count _ret,["A3L_longhairblond",nil,1500]];
		   _ret set[count _ret,["A3L_longhairblack",nil,1500]];
		   _ret set[count _ret,["A3L_crown",nil,1500]];
		   _ret set[count _ret,["H_Orel_Mask_Dead",nil,1500]];
		   _ret set[count _ret,["H_Helmet_Skate",nil,1500]];
		   _ret set[count _ret,["H_StrawHat_dark",nil,1500]];
		   _ret set[count _ret,["H_RacingHelmet_2_F",nil,1500]];
       };	
	};
	
	//Glasses
	case 2:
	{   
	   if(__GETC__(life_donator) > 0) then
	   {
		   _ret set[count _ret,["G_Shades_Blue",nil,400]];
		   _ret set[count _ret,["G_Sport_Blackred",nil,400]];
		   _ret set[count _ret,["G_Sport_Checkered",nil,400]];
		   _ret set[count _ret,["G_Sport_Blackyellow",nil,400]];
		   _ret set[count _ret,["G_Sport_BlackWhite",nil,400]];
		   _ret set[count _ret,["G_Squares",nil,400]];
		   _ret set[count _ret,["G_Aviator",nil,400]];
		   _ret set[count _ret,["G_Lady_Mirror",nil,400]];
       };	
	};
	
	//Vest
	case 3:
	{   
	   if(__GETC__(life_donator) > 0) then
	   {

		   _ret set[count _ret,["TAC_Jvest_B",nil,2500]];
		   _ret set[count _ret,["TAC_Jvest_GR",nil,2500]];
		   _ret set[count _ret,["TAC_Jvest_TN",nil,2500]];
		   _ret set[count _ret,["TAC_Jvest_U",nil,2500]];
       };	
	};
	
	//Backpacks
	case 4:
	{   
	   if(__GETC__(life_donator) > 0) then
	   {
	       _ret set[count _ret,["B_AssaultPack_cbr",nil,2500]];
           _ret set[count _ret,["B_Kitbag_mcamo",nil,2500]];
           _ret set[count _ret,["B_TacticalPack_oli",nil,2500]];
		   _ret set[count _ret,["B_FieldPack_ocamo",nil,2500]];
		   _ret set[count _ret,["B_Bergen_sgg",nil,2500]];
		   _ret set[count _ret,["B_Kitbag_cbr",nil,2500]];
		   _ret set[count _ret,["mochila_grande",nil,2500]];
       };	
	};
};

_ret;