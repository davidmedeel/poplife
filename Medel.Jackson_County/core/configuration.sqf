#include <macro.h>
/*
	Master Life Configuration File
	This file is to setup variables for the client, there are still other configuration files in the system

*****************************
****** Backend Variables *****
*****************************
*/

life_query_time = time;
life_action_delay = time;
//Medel
player setvariable ["PoliciaDeServicio", 0, true];
player setvariable ["PoliON",false];
license_civ_policiaon = false;
cinturon = false;

player setVariable ["abropuertas",false];

player setvariable ["EMSDeServicio", 0, true];
player setvariable ["EMSON",false];
license_civ_EMSON = false;

	player setvariable ["DescargandoCombustible",false];
	player setvariable ["RecogoCombustible",false];
	player setvariable ["TrabajandoCamionero",false];

life_session_completed = false;
life_garage_store = false;
life_session_tries = 0;
life_fadeSound = false;
life_clothing_filter = 0;
life_clothing_uniform = -1;
life_bail_paid = false;
life_impound_inuse = false;
life_action_inUse = false;
life_respawn_timer = 0.1; //Scaled in minutes
life_knockout = false;
life_interrupted = false;
life_respawned = false;
life_removeWanted = false;
life_god = false;
life_markers = false;
//Channel 7
life_channel_send = true;
//Racing
inRace = false;
//DNI and Badge
showing_documentation = false;


//Persistent Saving
__CONST__(life_save_civ,TRUE); //Save weapons for civs?


//Revive constant variables.
__CONST__(life_revive_fee,7500); //Fee for players to pay when revived.

//House Limit
__CONST__(life_houseLimit,2); //Maximum amount of houses a player can buy (TODO: Make Tiered licenses).

//Gang related stuff?
__CONST__(life_gangPrice,75000); //Price for creating a gang (They're all persistent so keep it high to avoid 345345345 gangs).
__CONST__(life_gangUpgradeBase,10000); //MASDASDASD
__CONST__(life_gangUpgradeMultipler,2.5); //BLAH

//Uniform price (0),Hat Price (1),Glasses Price (2),Vest Price (3),Backpack Price (4)
life_clothing_purchase = [-1,-1,-1,-1,-1];
/*
*****************************
****** Weight Variables *****
*****************************
*/
life_maxWeight = 24; //Identifies the max carrying weight (gets adjusted throughout game when wearing different types of clothing).
life_maxWeightT = 24; //Static variable representing the players max carrying weight on start.
life_carryWeight = 0; //Represents the players current inventory weight (MUST START AT 0).

/*
*****************************
****** Life Variables *******
*****************************
*/
life_frozen = false;
life_use_atm = true;
life_is_arrested = false;
life_delivery_in_progress = false;
life_action_in_use = false;
if (isNil {(profileNamespace getVariable "hearb")}) then {
	profileNamespace setVariable ["hearb",100];
};
if (isNil {(profileNamespace getVariable "soif")}) then {
	profileNamespace setVariable ["soif",100];
};
if (isNil {profileNamespace getVariable "rutome"}) then {
	profileNamespace setVariable ["rutome", 0]}; // soy nuevo
__CONST__(life_paycheck_period,5); //Five minutes
medel_din = 0;
__CONST__(life_impound_car,10000);
__CONST__(life_impound_car_cop,2000);
__CONST__(life_impound_boat,2500);
__CONST__(life_impound_air,2500);
life_istazed = false;
life_my_gang = ObjNull;
life_truck_types = [];
life_vehicles = [];
bank_robber = [];
switch (playerSide) do
{
	case west:
	{
		medel_atmdin = 30000; //Starting Bank Money
		life_paycheck = 2400; //Paycheck Amount
	};
	case civilian:
	{
		medel_atmdin = 20000; //Starting Bank Money
		life_paycheck = 700; //Paycheck Amount
	};

	case independent: {
		medel_atmdin = 75000;
		life_paycheck = 2400;
	};

	case east:
	{
		medel_atmdin = 100000; //Starting Bank Money
		life_paycheck = 2400; //Paycheck Amount
	};

};

/*
	Master Array of items?
*/
life_vShop_rentalOnly = [""];
__CONST__(life_vShop_rentalOnly,life_vShop_rentalOnly); //These vehicles can never be bought and only 'rented'. Used as a balancer & money sink. If you want your server to be chaotic then fine.. Remove it..


//Licenses [license var, civ/cop]
life_licenses =
[
	["license_cop_air","cop"],
	["license_cop_especialidad","cop"],
	["license_cop_swat","cop"],
	["license_cop_cg","cop"],
	["license_civ_driver","civ"],
	["license_civ_air","civ"],
	["license_civ_heroin","civ"],
	["license_civ_gang","civ"],
	["license_civ_boat","civ"],
	["license_civ_truck","civ"],
	["license_civ_depan","civ"],
	["license_civ_gun","civ"],
	["license_civ_rebel","civ"],
	["license_med_air","med"],
	["license_civ_home","civ"],
	["license_civ_taxita","civ"],
	["license_civ_Periodista","civ"],
	["license_civ_policiaon","civ"],
	["license_civ_transporte","civ"],
	["license_civ_donator","civ"]
];

//Setup License Variables
{missionNamespace setVariable[(_x select 0),false];} foreach life_licenses;

life_dp_points = ["dp_1","dp_2","dp_3","dp_4","dp_5","dp_6","dp_7","dp_8","dp_9","dp_10","dp_11","dp_12","dp_13","dp_14","dp_15","dp_15","dp_16","dp_17","dp_18","dp_19","dp_20","dp_21","dp_22","dp_23","dp_24","dp_25"];



life_weapon_shop_array =
[
	["arifle_sdar_F",0],
	["hgun_P07_snds_F",0],
	["hgun_P07_F",0],
	["Binocular",0],
	["ItemGPS",0],
	["ToolKit",0],
	["FirstAidKit",0],
	["Medikit",0],
	["NVGoggles",0],
	["16Rnd_9x21_Mag",0],
	["20Rnd_556x45_UW_mag",0],
	["ItemMap",0],
	["ItemCompass",0],
	["Rangefinder",0],
	["Chemlight_blue",0],
	["Chemlight_yellow",0],
	["Chemlight_green",0],
	["Chemlight_red",0],
	["hgun_Rook40_F",0],
	["arifle_Katiba_F",0],
	["30Rnd_556x45_Stanag",0],
	["20Rnd_762x51_Mag",0],
	["30Rnd_65x39_caseless_green",0],
	["DemoCharge_Remote_Mag",0],
	["SLAMDirectionalMine_Wire_Mag",0],
	["optic_ACO_grn",0],
	["acc_flashlight",0],
	["srifle_EBR_F",0],
	["arifle_TRG21_F",0],
	["optic_MRCO",0],
	["optic_Aco",0],
	["arifle_MX_F",0],
	["arifle_MXC_F",0],
	["arifle_MXM_F",0],
	["MineDetector",0],
	["optic_Holosight",0],
	["acc_pointer_IR",0],
	["arifle_TRG20_F",0],
	["SMG_01_F",0],
	["arifle_Mk20C_F",0],
	["30Rnd_45ACP_Mag_SMG_01",0],
	["30Rnd_9x21_Mag",0],
	["arifle_Mk20_F",0],
    ["hgun_ACPC2_F",0],
    ["hgun_Pistol_heavy_01_F",0],
	["srifle_DMR_01_F",0],
	["srifle_GM6_F",0],
	["optic_Hamr",0],
	["optic_SOS",0],
	["optic_NVS",0],
	["muzzle_snds_M",0],
	["muzzle_snds_H",0],
	["muzzle_snds_B",0],
	["acc_flashlight",0],
	["9Rnd_45ACP_Mag",0],
	["11Rnd_45ACP_Mag",0],
	["30Rnd_65x39_caseless_mag",0],
	["30Rnd_65x39_caseless_green",0],
	["30Rnd_556x45_Stanag",0],
	["10Rnd_762x51_Mag",0],
	["5Rnd_127x108_Mag",0],
	["A3L_SuicideVest",0]
];
__CONST__(life_weapon_shop_array,life_weapon_shop_array);

life_garage_prices =
[
	//Test lo que cuesta al sacar el coche del garaje ademas de pone en tienda. alex
	//["Coche",precio],
];
__CONST__(life_garage_prices,life_garage_prices);

life_garage_sell =
[
	["pop_LamborghiniVeneno_grafiti3", 300000],
    ["pop_LamborghiniVeneno_grafiti1", 300000],
    ["pop_LamborghiniVeneno_grafiti2", 300000],
    ["POP_Ferrari_Enzo_rojo", 300000],
	["shounka_f430_spider_amarillo", 300000],
	["shounka_f430_spider", 300000],
	["shounka_f430_spider_azul", 300000],
	["shounka_f430_spider_gris", 300000],
	["shounka_f430_spider_naranja", 300000],
	["shounka_f430_spider_negro", 300000],
	["shounka_f430_spider_rojo", 300000],
	["shounka_f430_spider_rosa", 300000],
	["shounka_f430_spider_violeta", 300000],
	["pop_porsche911", 300000],
	["pop_porsche911_gris", 300000],
	["pop_porsche911_naranja", 300000],
	["pop_porsche911_negro", 300000],
	["pop_porsche911_rojo", 300000],
	["pop_porsche911_rosa", 300000],
	["pop_porsche911_violeta", 300000],
	["pop_porsche911_amariilo", 300000],
	["pop_porsche911_azul", 300000],
	["pop_LamborghiniVeneno_negro", 300000],
	["pop_LamborghiniVeneno_negro1", 300000],
	["pop_LamborghiniVeneno_gris", 300000],
	["pop_mp4", 300000],
	["pop_mp4_bleufonce", 300000],
	["pop_mp4_grise", 300000],
	["pop_mp4_jaune", 300000],
	["pop_mp4_noir", 300000],
	["pop_mp4_orange", 300000],
	["pop_mp4_rose", 300000],
	["pop_mp4_rouge", 300000],
	["pop_mp4_violet", 300000],
	["pop_agera_p", 250000],
	["pop_agera_amarillo", 250000],
	["pop_agera_azul", 250000],
	["pop_agera_negro", 250000],
	["pop_panamera_negro", 250000],
	["pop_panamera_azul", 250000],
	["pop_panamera_rojo", 250000],
	["pop_panamera_amarillo", 250000],
	["pop_panamera_rosa", 250000],
	["pop_panamera_gris", 250000],
	["pop_panamera_violeta", 250000],
	["pop_panamera_naranja", 250000],
	["pop_gt_noir", 200000],
	["pop_gt_bleufonce", 200000],
	["pop_gt_rouge", 200000],
	["pop_gt_jaune", 200000],
	["pop_gt_rose", 200000],
	["pop_gt_grise", 200000],
	["pop_gt_violet", 200000],
	["pop_gt_orange", 200000],
	["pop_pagani_c", 200000],
	["pop_pagani_c_noir", 200000],
	["pop_pagani_c_bleufonce", 200000],
	["pop_pagani_c_rouge", 200000],
	["pop_pagani_c_jaune", 200000],
	["pop_pagani_c_rose", 200000],
	["pop_pagani_c_grise", 200000],
	["pop_pagani_c_violet", 200000],
	["pop_pagani_c_orange", 200000],
	["pop_lykan_Hypersport_violeta", 250000],
	["pop_lykan_Hypersport_noir", 250000],
	["pop_lykan_Hypersport_bleufonce", 250000],
	["pop_lykan_Hypersport_rouge", 250000],
	["pop_lykan_Hypersport_jaune", 250000],
	["pop_lykan_Hypersport_rose", 250000],
	["pop_lykan_Hypersport_grise", 250000],
	["pop_lykan_Hypersport_orange", 250000],
	["pop_bmw_1series", 200000],
	["pop_bmw_1series_bleufonce", 200000],
	["pop_bmw_1series_grise", 200000],
	["pop_bmw_1series_jaune", 200000],
	["pop_bmw_1series_noir", 200000],
	["pop_bmw_1series_orange", 200000],
	["pop_bmw_1series_rose", 200000],
	["pop_bmw_1series_rouge", 200000],
	["pop_bmw_1series_violet", 200000],
// karts
	["C_Kart_01_Blu_F", 1000],
	["C_Kart_01_Fuel_F", 1000],
	["C_Kart_01_Red_F", 1000],
	["C_Kart_01_Vrana_F", 1000],
//taxi
    ["POP_Opel_Insignia_taxi", 1500],
//limusina
    ["Mercedes_Pullman_negra", 25000],
//prensa
    ["pop_cherokee_prensa", 1000],
// coches deportivos
	["pop_bmwm6_negro", 27000],
	["pop_bmwm6_azul", 27000],
	["pop_bmwm6_rojo", 27000],
	["pop_bmwm6_amarillo", 27000],
	["pop_bmwm6_rosa", 27000],
	["pop_bmwm6_gris", 27000],
	["pop_bmwm6_violet", 27000],
	["pop_bmwm6_naranja", 27000],
	["pop_mercedes_190_p_civ", 27000],
	["pop_mercedes_190_p_amarillo", 27000],
	["pop_mercedes_190_p_azul", 27000],
	["pop_mercedes_190_p_grise", 27000],
	["pop_mercedes_190_p_naranja", 27000],
	["pop_mercedes_190_p_negro", 27000],
	["pop_mercedes_190_p_rojo", 27000],
	["pop_mercedes_190_p_rosa", 27000],
	["pop_mercedes_190_p_violeta", 27000],
	["pop_a3_308", 27000],
	["pop_a3_308_rcz_bleufonce", 27000],
	["pop_a3_308_rcz_grise", 27000],
	["pop_a3_308_rcz_jaune", 27000],
	["pop_a3_308_rcz_noir", 27000],
	["pop_a3_308_rcz_orange", 27000],
	["pop_a3_308_rcz_rose", 27000],
	["pop_a3_308_rcz_rouge", 27000],
	["pop_a3_308_rcz_violet", 27000],
	["pop_subaru08_civ", 27000],
	["pop_subaru08_amarillo", 27000],
	["pop_subaru08_azul", 27000],
	["pop_subaru08_gris", 27000],
	["pop_subaru08_naranja", 27000],
	["pop_subaru08_negro", 27000],
	["pop_subaru08_rojo", 27000],
	["pop_subaru08_rosa", 27000],
	["pop_subaru08_violeta", 27000],
	["pop_clk", 27000],
	["pop_clk_noir", 27000],
	["pop_clk_bleufonce", 27000],
	["pop_clk_rouge", 27000],
	["pop_clk_jaune", 27000],
	["pop_clk_rose", 27000],
	["pop_clk_grise", 27000],
	["pop_clk_violet", 27000],
	["pop_clk_orange", 27000],
	["pop_toyota_gt86_Blanco", 27000],
	["pop_toyota_gt86_silver", 27000],
	["pop_toyota_gt86_gris", 27000],
	["pop_toyota_gt86_negro", 27000],
	["pop_toyota_gt86_rojo", 27000],
	["pop_cayenne_p_negro", 27000],
	["pop_cayenne_p_azul", 27000],
	["pop_cayenne_p_rojo", 27000],
	["pop_cayenne_p_amarillo", 27000],
	["pop_cayenne_p_rosa", 27000],
	["pop_cayenne_p_gris", 27000],
	["pop_cayenne_p_violeta", 27000],
	["pop_cayenne_p_naranja", 27000],
	["pop_dodge15_civ_negro", 27000],
	["pop_dodge15_civ_azuloscuro", 27000],
	["pop_dodge15_civ_rojo", 27000],
	["pop_dodge15_civ_amarillo", 27000],
	["pop_dodge15_civ_rosa", 27000],
	["pop_dodge15_civ_gris", 27000],
	["pop_dodge15_civ_violeta", 27000],
	["pop_dodge15_civ_naranja", 27000],
	["pop_gtr_blanco", 27000],
	["pop_gtr_negro", 27000],
	["pop_gtr_azul", 27000],
	["pop_lincoln_rojo", 20000],
	["pop_lincoln_azul", 20000],
	["pop_lincoln_amarillo", 20000],
	["pop_lincoln_gris", 20000],
	["pop_lincoln_violeta", 20000],
	["pop_lincoln_naranja", 20000],
	["pop_mustang_negro", 20000],
	["pop_mustang_azul", 20000],
	["pop_mustang_rojo", 20000],
	["pop_mustang_amarillo", 20000],
	["pop_mustang_rosa", 20000],
	["pop_mustang_gris", 20000],
	["pop_mustang_violeta", 20000],
	["pop_mustang_naranja", 20000],
	["pop_transam_noir", 22000],
	["pop_transam_bleufonce", 22000],
	["pop_transam_rouge", 22000],
	["pop_transam_jaune", 22000],
	["pop_transam_rose", 22000],
	["pop_transam_grise", 22000],
	["pop_transam_violet", 22000],
	["pop_transam_orange", 22000],
	["pop_hotrod_civ", 25000],
//motos
	["pop_yamaha_p", 4000],
	["pop_yamaha_p_bf", 4000],
	["pop_yamaha_p_g", 4000],
	["pop_yamaha_p_j", 4000],
	["pop_yamaha_p_noir", 4000],
	["pop_yamaha_p_o", 4000],
	["pop_yamaha_p_rose", 4000],
	["pop_yamaha_p_r", 4000],
	["pop_yamaha_p_v", 4000],
    ["pop_ducati_negra", 1500],
    ["pop_ducati_azul", 1500],
	["pop_ducati_roja", 1500],
	["pop_ducati_Amarilla", 1500],
	["pop_ducati_rosa", 1500],
	["pop_ducati_gris", 1500],
	["pop_ducati_violeta", 1500],
	["pop_ducati_naranja", 1500],
// 4x4
	["pop_hummer_civ", 37000],
	["pop_hummer_civ_amarillo", 37000],
	["pop_hummer_civ_azulfuerte", 37000],
	["pop_hummer_civ_gris", 37000],
	["pop_hummer_civ_Naranja", 37000],
	["pop_hummer_civ_negro", 37000],
	["pop_hummer_civ_rojo", 37000],
	["pop_hummer_civ_rosa", 37000],
	["pop_hummer_civ_violeta", 37000],
	["pop_h2", 37000],
	["pop_h2_bleufonce", 37000],
	["pop_h2_grise", 37000],
	["pop_h2_jaune", 37000],
	["pop_h2_noir", 37000],
	["pop_h2_orange", 37000],
	["pop_h2_rose", 37000],
	["pop_h2_rouge", 37000],
	["pop_h2_violet", 37000],
	["pop_Bowler_c", 37000],
	["pop_Bowler_c_bleufonce", 37000],
	["pop_Bowler_c_grise", 37000],
	["pop_Bowler_c_jaune", 37000],
	["pop_Bowler_c_noir", 37000],
	["pop_Bowler_c_orange", 37000],
	["pop_Bowler_c_rose", 37000],
	["pop_Bowler_c_rouge", 37000],
	["pop_Bowler_c_violet", 37000],
	["pop_avalanche", 37000],
	["pop_avalanche_amarillo", 37000],
	["pop_avalanche_azul", 37000],
	["pop_avalanche_gris", 37000],
	["pop_avalanche_naranja", 37000],
	["pop_avalanche_negro", 37000],
	["pop_avalanche_rojo", 37000],
	["pop_avalanche_rosa", 37000],
	["pop_avalanche_violeta", 37000],
	["pop_monsteur", 37000],
	["pop_monsteur_amarillo", 37000],
	["pop_monsteur_azul", 37000],
	["pop_monsteur_gris", 37000],
	["pop_monsteur_naranja", 37000],
	["pop_monsteur_negro", 37000],
	["pop_monsteur_rojo", 37000],
	["pop_monsteur_rosa", 37000],
	["pop_monsteur_violeta", 37000],
    ["POP_jeep_blinde_negro",37000],
	["POP_jeep_blinde_negro_mate", 37000],
	["POP_jeep_blinde_negro", 37000],
	["POP_jeep_blinde_negro_mate", 37000],
	["POP_jeep_blinde_azul", 37000],
	["POP_jeep_blinde_azul_mate", 37000],
	["POP_jeep_blinde_blanco", 37000],
    ["POP_jeep_blinde_blanco_mate", 37000],
	["POP_jeep_blinde_violeta", 37000],
	["pop_jeep_blinde_violeta_mate", 37000],
	["POP_jeep_blinde_rojo", 37000],
	["POP_jeep_blinde_rojo_mate", 37000],
	["POP_Landrover_Defender", 30000],
	["pop_cherokee_negro", 37000],
	["pop_cherokee_negro_mate", 37000],
	["pop_cherokee_negro_azul", 37000],
	["pop_cherokee_negro_azul_mate", 37000],
	["pop_cherokee_negro_blanco", 37000],
	["pop_cherokee_negro_blano_mate", 37000],
	["pop_cherokee_negro_violeta", 37000],
	["pop_cherokee_negro_violeta_mate", 37000],
	["pop_cherokee_negro_rojo", 37000],
	["pop_cherokee_negro_rojo_mate", 37000],
	["POP_Qashqai_amarillo", 37000],
	["POP_Qashqai_blanco", 37000],
	["POP_Qashqai_azul", 37000],
	["POP_Qashqai_gris", 37000],
	["POP_Qashqai_negro", 37000],
	["POP_Qashqai_naranja", 37000],
	["POP_Qashqai_rosado", 37000],
	["POP_Qashqai_rojo", 37000],
	["POP_Qashqai_rojo_oscuro", 37000],
	["POP_Qashqai_violeta", 37000],
	["POP_Qashqai_rojo_oscuro", 37000],
	["pop_raptor_blanco", 37000],
	["pop_raptor_negro", 37000],
	["pop_raptor_azul", 37000],
	["pop_raptor_rojo", 37000],
	["pop_raptor_amarillo", 37000],
	["pop_raptor_gris", 37000],
	["pop_raptor_violeta", 37000],
	["pop_raptor_naranja", 37000],
	["pop_Volkswagen_Touareg_rojo", 37000],
	["pop_Volkswagen_Touareg_negro", 37000],
	["pop_Volkswagen_Touareg_azul", 37000],
	["pop_Volkswagen_Touareg_violeta", 37000],
	["pop_Volkswagen_Touareg_amarillo", 37000],
	["pop_Volkswagen_Touareg_rosa", 37000],
	["pop_Volkswagen_Touareg_gris", 37000],
	["pop_Volkswagen_Touareg_naranja", 37000],
	["pop_Vandura_civ_equipoa", 37000],
//familiares
	["POP_207_rojo", 3000],
	["POP_207_negro", 3000],
	["POP_207_amarillo", 3000],
	["POP_207_rose", 3000],
    ["POP_207_gris", 3000],
	["POP_207_violeta", 3000],
	["POP_207_naranja", 3000],
	["pop_golfvi_civ", 3000],
	["pop_golfvi_bleufonce", 3000],
	["pop_golfvi_grise", 3000],
	["pop_golfvi_jaune", 3000],
	["pop_golfvi_noir", 3000],
	["pop_golfvi_orange", 3000],
	["pop_golfvi_rose", 3000],
	["pop_golfvi_rouge", 3000],
	["pop_golfvi_violet", 3000],
	["pop_308_negro", 3000],
	["pop_308_azul", 3000],
	["pop_308_rojo", 3000],
	["pop_308_amarillo", 3000],
	["pop_308_violeta", 3000],
	["pop_308_gris", 3000],
	["pop_308_naranja", 3000],
	["pop_308_rosa", 3000],
	["pop_twingo_p", 3000],
	["pop_twingo_p_amarillo", 3000],
	["pop_twingo_p_azul", 3000],
	["pop_twingo_p_gris", 3000],
	["pop_twingo_p_naranja", 3000],
	["pop_twingo_p_negro", 3000],
	["pop_twingo_p_rojo", 3000],
	["pop_twingo_p_rosa", 3000],
	["pop_twingo_p_violeta", 3000],
	["pop_Alfa_Romeo_negro", 3000],
	["pop_Alfa_Romeo_azuloscuro", 3000],
	["pop_Alfa_Romeo_rojo", 3000],
	["pop_Alfa_Romeo_amarillo", 3000],
	["pop_Alfa_Romeo_rosa", 3000],
	["pop_Alfa_Romeo_gris", 3000],
	["pop_Alfa_Romeo_violetta", 3000],
	["pop_Alfa_Romeo_Naranga", 3000],
	["pop_c4_p_negro", 3000],
	["pop_c4_p_azul", 3000],
	["pop_c4_p_rojo", 3000],
	["pop_c4_p_amarillo", 3000],
	["pop_c4_p_rosa", 3000],
	["pop_c4_p_gris", 3000],
	["pop_c4_p_violeta", 3000],
    ["pop_c4_p_naranja", 3000],
	["pop_c4_picasso_p_azul", 3000],
	["pop_c4_picasso_p_negro", 3000],
	["pop_c4_picasso_p_rojo", 3000],
	["pop_c4_picasso_p_amarillo", 3000],
	["pop_c4_picasso_p_rosa", 3000],
	["pop_c4_picasso_p_gris", 3000],
    ["pop_c4_picasso_p_violeta", 3000],
	["pop_c4_picasso_p_naranja", 3000],
	["pop_ds3_negro", 3000],
	["pop_ds3_azul", 3000],
	["pop_ds3_civ_rojo", 3000],
	["pop_ds3_amarillo", 3000],
	["pop_ds3_rosa", 3000],
	["pop_ds3_gris", 3000],
	["pop_ds3_violeta", 3000],
	["pop_ds3_naranja", 3000],
	["pop_ds4_negro", 3000],
	["pop_ds4_azul", 3000],
	["pop_ds4_rojo", 3000],
    ["pop_ds4_amarillo", 3000],
	["pop_ds4_rosa", 3000],
	["pop_ds4_gris", 3000],
	["pop_ds4_violeta", 3000],
	["pop_ds4_naranja", 3000],
	["pop_r5_negro", 3000],
	["pop_r5_azul", 3000],
	["pop_r5_rojo", 3000],
	["pop_r5_amarillo", 3000],
	["pop_r5_rosa", 3000],
	["pop_r5_gris", 3000],
	["pop_r5_violeta", 3000],
	["pop_r5_naranja", 3000],
	["pop_rs_rojo", 3000],
	["pop_rs_negro", 3000],
	["pop_rs_azul", 3000],
	["pop_rs_amarillo", 3000],
	["pop_rs_rosa", 3000],
	["pop_rs_gris", 3000],
    ["pop_rs_violeta", 3000],
	["pop_rs_naranja", 3000],
	["POP_smart_rojo", 3000],
	["POP_smart_civ_negro", 3000],
	["POP_smart_civ_azul", 3000],
	["pop_peugeot508_civ", 3000],
	["pop_peugeot508_civ_noir", 3000],
	["pop_peugeot508_civ_bleufonce", 3000],
	["pop_peugeot508_civ_rouge", 3000],
	["pop_peugeot508_civ_jaune", 3000],
	["pop_peugeot508_civ_rose", 3000],
	["pop_peugeot508_civ_grise", 3000],
	["pop_peugeot508_civ_violet", 3000],
	["pop_peugeot508_civ_orange", 3000],
	["pop_rs6", 3000],
	["pop_rs6_amarillo", 3000],
	["pop_rs6_azul", 3000],
	["pop_rs6_gris", 3000],
	["pop_rs6_naranja", 3000],
	["pop_rs6_negro", 3000],
	["pop_rs6_rojo", 3000],
	["pop_rs6_rosa", 3000],
	["pop_rs6_violeta", 3000],
//transportes
	["pop_Vandura_civ", 20000],
	["pop_Vandura_civ_negro", 20000],
	["pop_Vandura_civ_azul", 20000],
	["pop_Vandura_civ_rojo", 20000],
	["pop_Vandura_civ_Amarillo", 20000],
	["pop_Vandura_civ_rosa", 20000],
	["pop_Vandura_civ_gris", 20000],
	["pop_Vandura_civ_violeta", 20000],
	["pop_Vandura_civ_naranja", 20000],
	["pop_nemo", 20000],
	["pop_nemo_noir", 20000],
	["pop_nemo_bleufonce", 20000],
	["pop_nemo_rouge", 20000],
	["pop_nemo_jaune", 20000],
	["pop_nemo_rose", 20000],
	["pop_nemo_grise", 20000],
	["pop_nemo_violet", 20000],
	["pop_nemo_orange", 20000],
	["pop_Man_TGXsin_negro", 20000],
	["POP_renaultmagnum1_f", 20000],
	["pop_volvo_camion_sin", 20000],
	["pop_volvo_camion", 20000],
	["POP_renaultmagnum_f", 20000],
	["pop_dafxf_euro6_rojo", 20000],
	["pop_dafxf_euro6_rojo_oscuro", 20000],
	["pop_dafxf_euro6_negro", 20000],
	["pop_dafxf_euro6_verde", 20000],
	["pop_dafxf_euro6_verde_oscuro", 20000],
	["pop_dafxf_euro6_blanco", 20000],
	["pop_dafxf_euro6_azul", 20000],
	["pop_dafxf_euro6_azul_oscuro", 20000],
	["pop_dafxf_euro6_gris", 20000],
	["pop_dafxf_euro6_rosa", 20000],
	["pop_dafxf_euro6_violeta", 20000],
	["POP_bus_tour_amarillo", 20000],
	["POP_bus_tour_azul", 20000],
	["POP_bus_tour_marino", 20000],
	["POP_bus_tour_gris", 20000],
    ["POP_bus_tour_negro", 20000],
	["POP_bus_tour_naranja", 20000],
	["POP_bus_tour_rosado", 20000],
	["POP_bus_tour_rojo", 20000],
	["POP_bus_tour_rojo_oscuro", 20000],
	["POP_bus_tour_verde", 20000],
	["POP_bus_tour_violeta", 20000],
	["pop_iveco_f", 20000],
	["pop_Man_TGX_negro", 20000],
//poli_helis
        ["B_Heli_Light_01_F", 40000],
	["policia_helicopter", 40000],
	["ec135_policia_f", 40000],
	["ec135_guardiacivil_F", 40000],
//poli_cars
	["pop_c4_picasso_cnp_new", 20000],
	["POP_Opel_Insignia_ATGC", 20000],
    ["pop_c4_picasso_gc_new", 20000],
    ["pop_cherokee_ATGC", 20000],
    ["pop_cherokee_GC", 20000],
	["POP_Mercedes_Sprinter_cnp", 20000],
	["POP_Mercedes_Sprinter_gc", 20000],
	["POP_rs_gend", 20000],
	["POP_Qashqai_cnp", 20000],
	["pop_toyota_gt86_policia", 20000],
	["POP_Opel_Insignia_ka_GC", 20000],
	["POP_Opel_Insignia_ka_CNP", 20000],
	["POP_Opel_Insignia_ka_ATGC", 20000],
	["POP_Opel_Insignia_ka_blanco_GC", 20000],
	["POP_Opel_Insignia_ka_rojo_GC", 20000],
	["POP_Opel_Insignia_ka_verde_GC", 20000],
	["POP_Opel_Insignia_ka_azul_GC", 20000],
	["POP_Opel_Insignia_ka_amarillo_GC", 20000],
	["POP_Opel_Insignia_ka_blanco_CNP", 20000],
	["POP_Opel_Insignia_ka_rojo_CNP", 20000],
	["POP_Opel_Insignia_ka_verde_CNP", 20000],
	["POP_Opel_Insignia_ka_azul_CNP", 20000],
	["POP_Opel_Insignia_ka_amarillo_CNP", 20000],
	["POP_Opel_Insignia_ka_blanco_ATGC", 20000],
	["POP_Opel_Insignia_ka_rojo_ATGC", 20000],
	["POP_Opel_Insignia_ka_verde_ATGC", 20000],
	["POP_Opel_Insignia_ka_azul_ATGC", 20000],
	["POP_Opel_Insignia_ka_amarillo_ATGC", 20000],
	["pop_cherokee_camuflado_blanco", 20000],
	["pop_cherokee_camuflado_rojo", 20000],
	["pop_cherokee_camuflado_azul", 20000],
	["pop_cherokee_camuflado_verde", 20000],
	["pop_cherokee_camuflado_gris", 20000],
	["pop_cherokee_camuflado_negro", 20000],
	["POP_rs_camuflado_blanco", 20000],
	["POP_rs_camuflado_negro", 20000],
	["POP_rs_camuflado_azul", 20000],
	["POP_rs_camuflado_gris", 20000],
	["pop_c4_picasso_camuflado_negro", 20000],
	["pop_c4_picasso_camuflado_blanco", 20000],
	["pop_c4_picasso_camuflado_rojo", 20000],
	["pop_c4_picasso_camuflado_azul", 20000],
	["pop_c4_picasso_camuflado_gris", 20000],
//heli_civ
	["pop_heli_Light_01_blue_F", 100000],
	["pop_heli_Light_01_red_F", 100000],
	["pop_heli_Light_01_ion_F", 100000],
	["pop_heli_Light_01_blueLine_F", 100000],
	["pop_heli_Light_01_digital_F", 100000],
	["pop_heli_Light_01_elliptical_F", 100000],
	["pop_heli_Light_01_furious_F", 100000],
	["pop_heli_Light_01_graywatcher_F", 100000],
	["pop_heli_Light_01_jeans_F", 100000],
	["pop_heli_Light_01_light_F", 100000],
	["pop_heli_Light_01_shadow_F", 100000],
	["pop_heli_Light_01_sheriff_F", 100000],
	["pop_heli_Light_01_speedy_F", 100000],
	["pop_heli_Light_01_sunset_F", 100000],
	["pop_heli_Light_01_vrana_F", 100000],
	["pop_heli_Light_01_wasp_F", 100000],
	["pop_heli_Light_01_wave_F", 100000],
	["pop_heli_Light_01_camuflaje_F", 100000],
	["pop_heli_Light_01_naranja_F", 100000],
	["pop_heli_Light_01_chapa_F", 100000],
	["pop_heli_Light_01_escamas_F", 100000],
	["pop_heli_Light_01_olas_F", 100000],
	["pop_heli_Light_01_pelotas_F", 100000],
	["pop_heli_Light_01_psico1_F", 100000],
	["pop_heli_Light_01_psico2_F", 100000],
	["pop_heli_Light_01_psico3_F", 100000],
	["pop_heli_Light_01_psico4_F", 100000],
	["pop_heli_Light_01_psico5_F", 100000],
	["pop_heli_Light_01_amanecer_F", 100000],
	["pop_heli_Light_01_triangulos_F", 100000],
	["pop_heli_Light_01_triangulos2_F", 100000],
	["ec135_civil_rojo", 100000],
	["ec135_civil_blanco", 100000],
	["ec135_civil_azul", 100000],
	["ec135_civil_Negro", 100000],
	["pop_cessna_1", 100000],
	["pop_cessna_2", 100000],
	["pop_cessna_3", 100000],
	["pop_cessna_4", 100000],
	["pop_cessna_5", 100000],
	["pop_cessna_6", 100000],
//barcos_poli
	["B_SDV_01_F", 20000],
	["C_Boat_Civil_01_police_F", 20000],
	["POP_Lancha_policia", 20000],
	["B_Boat_Transport_01_F", 20000],
//barcos_civ
	["C_Rubberboat", 15000],
	["POP_Lancha_civil", 15000],
	["POP_pesca_f", 15000],
	["POP_Speed_yatch", 15000],
//donators
	["pop_FordTransiSupervan_civ_violeta", 10000],
	["pop_FordTransiSupervan_civ_naranja", 10000],
	["pop_FordTransiSupervan_don", 10000],
	["pop_FordTransiSupervan_civ_gris", 10000],
	["pop_FordTransiSupervan_civ_Amarillo", 10000],
	["pop_FordTransiSupervan_civ_rojo", 10000],
	["pop_FordTransiSupervan_civ_azul", 10000],
	["pop_FordTransiSupervan_civ_negro", 10000],
	["pop_c63_2015_mat", 10000],
	["pop_c63_2015_noir", 10000],
	["pop_c63_2015_civ", 10000],
	["pop_c63_2015_mat_n", 10000],
	["pop_c63_2015_bleufonce", 10000],
	["pop_c63_2015_mat_b", 10000],
	["pop_c63_2015_rouge", 10000],
	["pop_c63_2015_jaune", 10000],
	["pop_c63_2015_rose", 10000],
	["pop_c63_2015_grise", 10000],
	["pop_c63_2015_violet", 10000],
	["pop_c63_2015_orange", 10000]



];
__CONST__(life_garage_sell,life_garage_sell);
