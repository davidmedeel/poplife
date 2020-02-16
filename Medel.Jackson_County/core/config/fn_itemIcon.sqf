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
	case "life_inv_oilu": {("\medel_fotos\icons\items\oil_unprocessed.paa")};
	case "life_inv_oilp": {("\medel_fotos\icons\items\oil_processed.paa")};
	case "life_inv_heroinu": {("\medel_fotos\icons\items\heroin_unprocessed.paa")};
	case "life_inv_heroinp": {("\medel_fotos\icons\items\heroin_processed.paa")};
	case "life_inv_cannabis": {("\medel_fotos\icons\items\cannabis.paa")};
	case "life_inv_marijuana": {("\medel_fotos\icons\items\marijuana.paa")};
	case "life_inv_apple": {("\medel_fotos\icons\items\apple.paa")};
	case "life_inv_rabbit": {("\medel_fotos\icons\items\meat.paa")};
	case "life_inv_salema": {("\medel_fotos\icons\items\fish.paa")};
	case "life_inv_ornate": {("\medel_fotos\icons\items\fish.paa")};
	case "life_inv_mackerel": {("\medel_fotos\icons\items\fish.paa")};
	case "life_inv_tuna": {("\medel_fotos\icons\items\fish.paa")};
	case "life_inv_mullet": {("\medel_fotos\icons\items\fish.paa")};
	case "life_inv_catshark": {("\medel_fotos\icons\items\fish.paa")};
	case "life_inv_turtle": {("\medel_fotos\icons\items\turtle.paa")};
	case "life_inv_fishingpoles": {("\medel_fotos\icons\items\fishingpoles.paa")};
	case "life_inv_water": {("\medel_fotos\icons\items\water.paa")};
	case "life_inv_coffee": {("\medel_fotos\icons\items\coffee.paa")};
	case "life_inv_turtlesoup": {("\medel_fotos\icons\items\turtle_soup.paa")};
	case "life_inv_donuts": {("\medel_fotos\icons\items\donut.paa")};
	case "life_inv_fuelE": {("\medel_fotos\icons\items\fuel_can.paa")};
	case "life_inv_fuelF": {("\medel_fotos\icons\items\fuel_can.paa")};
	case "life_inv_pickaxe": {("\medel_fotos\icons\items\pickaxe.paa")};
	case "life_inv_copperore": {("\medel_fotos\icons\items\copper_ore.paa")};
	case "life_inv_ironore": {("\medel_fotos\icons\items\iron_ore.paa")};
	case "life_inv_ironr": {("\medel_fotos\icons\items\iron.paa")};
	case "life_inv_copperr": {("\medel_fotos\icons\items\copper.paa")};
	case "life_inv_sand": {("\medel_fotos\icons\items\sand.paa")};
	case "life_inv_salt": {("\medel_fotos\icons\items\salt_unprocessed.paa")};
	case "life_inv_saltr": {("\medel_fotos\icons\items\salt.paa")};
	case "life_inv_glass": {("\medel_fotos\icons\items\glass.paa")};
	case "life_inv_diamond": {("\medel_fotos\icons\items\diamond_unprocessed.paa")};
	case "life_inv_diamondr": {("\medel_fotos\icons\items\diamond.paa")};
	case "life_inv_tbacon": {("\medel_fotos\icons\items\meat.paa")};
	case "life_inv_redgull": {("\medel_fotos\icons\items\redgull.paa")};
	case "life_inv_lockpick": {("\medel_fotos\icons\items\lockpick.paa")};
	case "life_inv_peach": {("\medel_fotos\icons\items\peach.paa")};
	case "life_inv_coke": {("\medel_fotos\icons\items\cocain_unprocessed.paa")};
	case "life_inv_cokep": {("\medel_fotos\icons\items\cocain_processed.paa")};
	case "life_inv_spikeStrip": {("\medel_fotos\icons\items\spikestrip.paa")};
	case "life_inv_rock": {("\medel_fotos\icons\items\rock.paa")};
	case "life_inv_cement": {("\medel_fotos\icons\items\cement.paa")};
	case "life_inv_goldbar": {("\medel_fotos\icons\items\goldbar.paa")};
	case "life_inv_blastingcharge": {("\medel_fotos\icons\items\blastingcharge.paa")};
	case "life_inv_boltcutter": {("\medel_fotos\icons\items\boltcutter.paa")};
	case "life_inv_defusekit": {("\medel_fotos\icons\items\defusekit.paa")};
	case "life_inv_storagesmall": {("\medel_fotos\icons\items\storagesmall.paa")};
	case "life_inv_storagebig": {("\medel_fotos\icons\items\storagebig.paa")};
	default {("\medel_fotos\icons\items\noicon.paa")};
};