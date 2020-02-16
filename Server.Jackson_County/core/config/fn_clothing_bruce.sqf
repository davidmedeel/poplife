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
ctrlSetText[3103,"Moda POP"];

switch (_filter) do
{
	//Uniforms
	case 0:
	{
		[
        ["U_C_Commoner1_1",nil,3600 * Desc],
		//Chicas
        ["Woman_Uniform1",nil,3600 * Desc],
        ["Woman_Uniform2",nil,3600 * Desc],
        ["Woman_Uniform3",nil,3600 * Desc],
        ["Woman_Uniform4",nil,3600 * Desc],
        ["woman1",nil,3600 * Desc],
        ["woman1_3",nil,3600 * Desc],
        ["woman1_4",nil,3600 * Desc],
        ["woman1_2",nil,3600 * Desc],
        ["woman1_5",nil,3600 * Desc],
        ["woman2",nil,3600 * Desc],
        ["woman2_2",nil,3600 * Desc],
        ["woman2_3",nil,3600 * Desc],
        ["woman2_4",nil,3600 * Desc],
        ["woman2_5",nil,3600 * Desc],
        ["woman3",nil,3600 * Desc],
        ["woman3_2",nil,3600 * Desc],
        ["woman3_3",nil,3600 * Desc],
        ["woman3_4",nil,3600 * Desc],
        ["woman3_5",nil,3600 * Desc],
        ["woman4",nil,3600 * Desc],
        ["woman4_2",nil,3600 * Desc],
        ["woman4_3",nil,3600 * Desc],
        ["woman4_4",nil,3600 * Desc],
        ["vvv_character_jennifer",nil,3600 * Desc],
        ["vvv_character_protibanador",nil,3600 * Desc],
        ["vvv_elena_fisher10",nil,3600 * Desc],
        ["vvv_elena_fisher11",nil,3600 * Desc],
        ["vvv_elena_fisher12",nil,3600 * Desc],
        ["vvv_elena_fisher13",nil,3600 * Desc],
        ["vvv_elena_fisher14",nil,3600 * Desc],
        ["vvv_elena_fisher15",nil,3600 * Desc],
        ["vvv_elena_fisher16",nil,3600 * Desc],
        ["vvv_elena_fisher2",nil,3600 * Desc],
        ["vvv_elena_fisher3",nil,3600 * Desc],
        ["vvv_elena_fisher4",nil,3600 * Desc],
        ["vvv_elena_fisher5",nil,3600 * Desc],
        ["vvv_elena_fisher6",nil,3600 * Desc],
        ["vvv_elena_fisher7",nil,3600 * Desc],
        ["vvv_elena_fisher8",nil,3600 * Desc],
        ["vvv_elena_fisher9",nil,3600 * Desc],
        ["vvv_character_wandelina",nil,3600 * Desc],
        ["vvv_character_wandelina_2",nil,3600 * Desc],
		//Chicos
		["NP_traje_test",nil,3600 * Desc],
		["NP_traje_test10",nil,3600 * Desc],
		["NP_traje_test2",nil,3600 * Desc],
		["NP_traje_test3",nil,3600 * Desc],
		["NP_traje_test4",nil,3600 * Desc],
		["NP_traje_test5",nil,3600 * Desc],
		["NP_traje_test6",nil,3600 * Desc],
		["NP_traje_test7",nil,3600 * Desc],
		["NP_traje_test8",nil,3600 * Desc],
		["NP_traje_test9",nil,3600 * Desc],
		["vvv_traje_jackoy",nil,3600 * Desc],
		["vvv_traje_jackoy2",nil,3600 * Desc],
		["vvv_traje_jackoy3",nil,3600 * Desc],
		["vvv_traje_jackoy4",nil,3600 * Desc],
		["vvv_traje_jackoy5",nil,3600 * Desc],
		["vvv_traje_jackoy6",nil,3600 * Desc],
		["vvv_traje_jackoy7",nil,3600 * Desc],
		["vvv_traje_jackoy8",nil,3600 * Desc],
		["vvv_traje_mafioso_F_1",nil,3600 * Desc],
		["vvv_traje_motox_02_3",nil,3600 * Desc],
		["vvv_traje_motox_02_7",nil,3600 * Desc],
		["vvv_traje_motox_02",nil,3600 * Desc],
		["vvv_traje_motox_02_8",nil,3600 * Desc],
		["vvv_traje_motox_02_4",nil,3600 * Desc],
		["vvv_traje_motox_02_5",nil,3600 * Desc],
		["vvv_traje_motox_02_2",nil,3600 * Desc],
		["vvv_traje_motox_02_6",nil,3600 * Desc],
		["np_shirt_1",nil,3600 * Desc],
		["np_shirt_2",nil,3600 * Desc],
		["np_shirt_3",nil,3600 * Desc],
		["np_shirt_4",nil,3600 * Desc],
		["np_shirt_5",nil,3600 * Desc],
		["np_shirt_6",nil,3600 * Desc],
		["np_shirt_7",nil,3600 * Desc],
		["np_shirt_8",nil,3600 * Desc],
		["vvv_character_sport_1",nil,3600 * Desc],
		["vvv_character_sport_9",nil,3600 * Desc],
		["vvv_character_sport_13",nil,3600 * Desc],
		["vvv_character_sport_3",nil,3600 * Desc],
		["vvv_character_sport_2",nil,3600 * Desc],
		["vvv_character_sport_7",nil,3600 * Desc],
		["vvv_character_sport_8",nil,3600 * Desc],
		["vvv_character_sport_11",nil,3600 * Desc],
		["vvv_character_sport_12",nil,3600 * Desc],
		["vvv_character_sport",nil,3600 * Desc],
		["vvv_character_sport_6",nil,3600 * Desc],
		["vvv_character_sport_4",nil,3600 * Desc],
		["vvv_character_sport_10",nil,3600 * Desc],
		["vvv_character_sport_5",nil,3600 * Desc],
		["vvv_character_agente_47",nil,3600 * Desc],
		["vvv_character_agente_472",nil,3600 * Desc],
		["vvv_character_agente_473",nil,3600 * Desc],
		["vvv_character_agente_474",nil,3600 * Desc],
		["vvv_character_agente_475",nil,3600 * Desc],
		["vvv_ropa_comun_f_1",nil,3600 * Desc],
		["vvv_ropa_comun_f_10",nil,3600 * Desc],
		["vvv_ropa_comun_f_2",nil,3600 * Desc],
		["vvv_ropa_comun_f_3",nil,3600 * Desc],
		["vvv_ropa_comun_f_4",nil,3600 * Desc],
		["vvv_ropa_comun_f_5",nil,3600 * Desc],
		["vvv_ropa_comun_f_6",nil,3600 * Desc],
		["vvv_ropa_comun_f_7",nil,3600 * Desc],
		["vvv_ropa_comun_f_8",nil,3600 * Desc],
		["vvv_ropa_comun_f_9",nil,3600 * Desc],
		["vvv_character_funcionario_1",nil,3600 * Desc],
		["vvv_character_rock1",nil,3600 * Desc],
		["vvv_character_rock2",nil,3600 * Desc],
		["vvv_character_rock3",nil,3600 * Desc],
		["vvv_character_rock4",nil,3600 * Desc],
		["vvv_character_funcionario_2",nil,3600 * Desc],
		["A3L_Dude_Outfit",nil,3600 * Desc],
		["KAEL_SUITS_BR_F22",nil,3600 * Desc],
		["KAEL_SUITS_BR_F15",nil,3600 * Desc],
		["U_Marshal",nil,3600 * Desc],
		["U_BG_Guerilla3_1",nil,3600 * Desc],
		["BreakingBad",nil,3600 * Desc],
		["U_O_R_Gorka_01_black_F",nil,3600 * Desc],
		["U_OrestesBody",nil,3600 * Desc],
		["KAEL_SUITS_BR_F3",nil,3600 * Desc],
		["KAEL_SUITS_BR_F12",nil,3600 * Desc],
		["KAEL_SUITS_BR_F4",nil,3600 * Desc],
		["U_I_C_Soldier_Bandit_2_F",nil,3600 * Desc],
		["U_I_C_Soldier_Bandit_5_F",nil,3600 * Desc],
		["U_C_Mechanic_01_F",nil,3600 * Desc],
		["U_I_L_Uniform_01_tshirt_skull_F",nil,3600 * Desc],
		["U_I_L_Uniform_01_tshirt_sport_F",nil,3600 * Desc],
		["U_I_L_Uniform_01_tshirt_black_F",nil,3600 * Desc],
		["U_C_E_LooterJacket_01_F",nil,3600 * Desc],
		["U_C_IDAP_Man_Tee_F",nil,3600 * Desc],
		["U_C_IDAP_Man_TeeShorts_F",nil,3600 * Desc],
		["U_C_IDAP_Man_cargo_F",nil,3600 * Desc],
		["U_C_IDAP_Man_casual_F",nil,3600 * Desc],
		["U_C_IDAP_Man_shorts_F",nil,3600 * Desc],
		["U_C_IDAP_Man_Jeans_F",nil,3600 * Desc],
		["U_C_man_sport_3_F",nil,3600 * Desc],
		["U_C_man_sport_2_F",nil,3600 * Desc],
		["U_C_man_sport_1_F",nil,3600 * Desc],
		["U_C_Poor_1",nil,3600 * Desc],
		["U_C_Poloshirt_blue",nil,3600 * Desc],
		["U_C_Poloshirt_burgundy",nil,3600 * Desc],
		["U_C_Poloshirt_redwhite",nil,3600 * Desc],
		["U_C_Poloshirt_salmon",nil,3600 * Desc],
		["U_C_Poloshirt_tricolour",nil,3600 * Desc],
		["U_C_Man_casual_2_F",nil,3600 * Desc],
		["U_C_Man_casual_1_F",nil,3600 * Desc],
		["U_C_Man_casual_3_F",nil,3600 * Desc],
		["U_C_Uniform_Scientist_02_formal_F",nil,3600 * Desc],
		["U_BG_Guerilla2_3",nil,3600 * Desc],
		["U_BG_Guerilla2_1",nil,3600 * Desc],
		["U_O_R_Gorka_01_F",nil,3600 * Desc],
		["U_O_R_Gorka_01_brown_F",nil,3600 * Desc],
		["stv_awesome1",nil,3600 * Desc],
		["stv_bb1",nil,3600 * Desc],
		["stv_beats1",nil,3600 * Desc],
		["stv_bendozlia3",nil,3600 * Desc],
		["stv_bipolar1",nil,3600 * Desc],
		["stv_burgerking1",nil,3600 * Desc],
		["stv_chickens1",nil,3600 * Desc],
		["stv_evolution1",nil,3600 * Desc],
		["stv_deeznuts1",nil,3600 * Desc],
		["stv_turtles1",nil,3600 * Desc],
		["stv_pika1",nil,3600 * Desc],
		["stv_lsd1",nil,3600 * Desc],
		["stv_kfc1",nil,3600 * Desc],
		["stv_homer1",nil,3600 * Desc],
		["stv_gameover1",nil,3600 * Desc],
		["stv_fightclub1",nil,3600 * Desc],
		["stv_ferrari1",nil,3600 * Desc],
		["stv_condoms1",nil,3600 * Desc],
		["stv_csgo1",nil,3600 * Desc],
		["stv_et1",nil,3600 * Desc],
		["stv_hand1",nil,3600 * Desc],
		["stv_illuminati1",nil,3600 * Desc],
		["stv_jason1",nil,3600 * Desc],
		["stv_joker1",nil,3600 * Desc],
		["stv_leppy1",nil,3600 * Desc],
		["stv_peanut1",nil,3600 * Desc],
		["stv_shark1",nil,3600 * Desc],
		["stv_stoned1",nil,3600 * Desc],
		["stv_upyours1",nil,3600 * Desc],
		["stv_herpderp1",nil,3600 * Desc],
		["stv_iamstupid1",nil,3600 * Desc],
		["stv_rageface1",nil,3600 * Desc],
		["stv_rastaciv",nil,3600 * Desc],
		["BluePlaid_uni",nil,3600 * Desc],
		["GreenPlaid_uni",nil,3600 * Desc],
		["OrangePlaid_uni",nil,3600 * Desc],
		["PinkPlaid_uni",nil,3600 * Desc],
		["RedPlaid_uni",nil,3600 * Desc],
		["YellowPlaid_uni",nil,3600 * Desc],
		["BlGnGy_uni",nil,3600 * Desc],
		["BlGyBr_uni",nil,3600 * Desc],
		["checkered_uni",nil,3600 * Desc],
		["GbGyBr_uni",nil,3600 * Desc],
		["GnBlBr_uni",nil,3600 * Desc],
		["GnGyBr_uni",nil,3600 * Desc],
		["poloranger_uni",nil,3600 * Desc],
		["GyBlBr_uni",nil,3600 * Desc],
		["MotherTrucker_uni",nil,3600 * Desc],
		["OrBlBr_uni",nil,3600 * Desc],
		["OrGnGy_uni",nil,3600 * Desc],
		["OrGyBr_uni",nil,3600 * Desc],
		["PkGnGy_uni",nil,3600 * Desc],
		["PkGyBr_uni",nil,3600 * Desc],
		["RdBlBr_uni",nil,3600 * Desc],
		["RdGnGy_uni",nil,3600 * Desc],
		["RdGyBr_uni",nil,3600 * Desc],
		["sohoku_uni",nil,3600 * Desc],
		["WhBlBr_uni",nil,3600 * Desc],
		["YlBlBr_uni",nil,3600 * Desc],
		["YlGnGy_uni",nil,3600 * Desc]
		];
	};
	
	//Hats
	/*case 1:
	{
		[		
		//	["H_MickeyMask",nil,1500 * Desc],
			
		];
	};*/
	
	//Glasses
	case 2:
	{
		[
			//["EWK_Cig1",nil,600 * Desc]
		["G_Aviator",nil,1500 * Desc],
		["G_Squares",nil,1500 * Desc],
		["G_Spectacles",nil,1500 * Desc],
		["G_Spectacles_Tinted",nil,1500 * Desc],
		["G_Lowprofile",nil,1500 * Desc],
		["G_EyeProtectors_F",nil,1500 * Desc]
		];
	};
	
	//Vest
	/*case 3:
	{
		[

		];
	};*/
	
	//Backpacks
	case 4:
	{
		[
			["B_Messenger_Coyote_F",nil,1000 * Desc],
			["B_Messenger_Gray_F",nil,2500 * Desc],
			["streetv_mochila_pequena",nil,2500 * Desc]
		];
	};
};