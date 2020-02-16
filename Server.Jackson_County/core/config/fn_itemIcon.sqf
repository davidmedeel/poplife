/*
	File: fn_itemIcon.sqf
	Author: EdgeKiller

	Description:
	Return the icon for each altis life item.
*/
private["_var"];
_var = [_this,0,"",[""]] call BIS_fnc_param;
if(_var == "") exitWith {""};

switch (_var) do
{
	//Virtual Inventory Items
	case "life_inv_oilu": {("\Rex_Fotos\icons\items\oil_unprocessed.paa")};
	case "life_inv_oilp": {("\Rex_Fotos\icons\items\oil_processed.paa")};
	case "life_inv_heroinu": {("\Rex_Fotos\icons\items\heroin_unprocessed.paa")};
	case "life_inv_heroinp": {("\Rex_Fotos\icons\items\heroin_processed.paa")};
	case "life_inv_cannabis": {("\Rex_Fotos\icons\items\cannabis.paa")};
	case "life_inv_marijuana": {("\Rex_Fotos\icons\items\marijuana.paa")};
	case "life_inv_apple": {("\Rex_Fotos\icons\items\apple.paa")};
	case "life_inv_rabbit": {("\Rex_Fotos\icons\items\meat.paa")};
	case "life_inv_salema": {("\Rex_Fotos\icons\items\fish.paa")};
	case "life_inv_ornate": {("\Rex_Fotos\icons\items\fish.paa")};
	case "life_inv_mackerel": {("\Rex_Fotos\icons\items\fish.paa")};
	case "life_inv_tuna": {("\Rex_Fotos\icons\items\fish.paa")};
	case "life_inv_mullet": {("\Rex_Fotos\icons\items\fish.paa")};
	case "life_inv_catshark": {("\Rex_Fotos\icons\items\fish.paa")};
	case "life_inv_turtle": {("\Rex_Fotos\icons\items\turtle.paa")};
	case "life_inv_fishingpoles": {("\Rex_Fotos\icons\items\fishingpoles.paa")};
	case "life_inv_water": {("\Rex_Fotos\icons\items\water.paa")};
	case "life_inv_coffee": {("\Rex_Fotos\icons\items\coffee.paa")};
	case "life_inv_turtlesoup": {("\Rex_Fotos\icons\items\turtle_soup.paa")};
	case "life_inv_donuts": {("\Rex_Fotos\icons\items\donut.paa")};
	case "life_inv_fuelE": {("\Rex_Fotos\icons\items\fuel_can.paa")};
	case "life_inv_fuelF": {("\Rex_Fotos\icons\items\fuel_can.paa")};
	case "life_inv_pickaxe": {("\Rex_Fotos\icons\items\pickaxe.paa")};
	case "life_inv_copperore": {("\Rex_Fotos\icons\items\copper_ore.paa")};
	case "life_inv_ironore": {("\Rex_Fotos\icons\items\iron_ore.paa")};
	case "life_inv_ironr": {("\Rex_Fotos\icons\items\iron.paa")};
	case "life_inv_copperr": {("\Rex_Fotos\icons\items\copper.paa")};
	case "life_inv_sand": {("\Rex_Fotos\icons\items\sand.paa")};
	case "life_inv_salt": {("\Rex_Fotos\icons\items\salt_unprocessed.paa")};
	case "life_inv_saltr": {("\Rex_Fotos\icons\items\salt.paa")};
	case "life_inv_glass": {("\Rex_Fotos\icons\items\glass.paa")};
	case "life_inv_diamond": {("\Rex_Fotos\icons\items\diamond_unprocessed.paa")};
	case "life_inv_diamondr": {("\Rex_Fotos\icons\items\diamond.paa")};
	case "life_inv_tbacon": {("\Rex_Fotos\icons\items\meat.paa")};
	case "life_inv_redgull": {("\Rex_Fotos\icons\items\redgull.paa")};
	case "life_inv_lockpick": {("\Rex_Fotos\icons\items\lockpick.paa")};
	case "life_inv_peach": {("\Rex_Fotos\icons\items\peach.paa")};
	case "life_inv_coke": {("\Rex_Fotos\icons\items\cocain_unprocessed.paa")};
	case "life_inv_cokep": {("\Rex_Fotos\icons\items\cocain_processed.paa")};
	case "life_inv_spikeStrip": {("\Rex_Fotos\icons\items\spikestrip.paa")};
	case "life_inv_rock": {("\Rex_Fotos\icons\items\rock.paa")};
	case "life_inv_cement": {("\Rex_Fotos\icons\items\cement.paa")};
	case "life_inv_goldbar": {("\Rex_Fotos\icons\items\goldbar.paa")};
	case "life_inv_blastingcharge": {("\Rex_Fotos\icons\items\blastingcharge.paa")};
	case "life_inv_boltcutter": {("\Rex_Fotos\icons\items\boltcutter.paa")};
	case "life_inv_defusekit": {("\Rex_Fotos\icons\items\defusekit.paa")};
	case "life_inv_storagesmall": {("\Rex_Fotos\icons\items\storagesmall.paa")};
	case "life_inv_storagebig": {("\Rex_Fotos\icons\items\storagebig.paa")};
	default {("\Rex_Fotos\icons\items\noicon.paa")};
};