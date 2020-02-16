/*
	File: fn_vehShopLicenses.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Checks what shop it is and sometimes the vehicle to determine whether or not they have the license.
	
	Returns:
	TRUE if they have the license or are allowed to get that specific vehicle without having that license.
	FALSE if they don't have the license or are not allowed to obtain that vehicle.
*/
private["_veh","_ret"];
_veh = _this select 0;
_ret = false;

if(_veh == "B_Quadbike_01_F") exitWith {true}; //ATV's don't need to require a license anymore.

switch (life_veh_shop select 0) do
{
	case "med_shop": {_ret = license_civ_EMSON;};
	case "med_ship": {_ret = true;};
	case "admin_shop": {_ret = true;};	
	//Civil
	case "coches_normales": {_ret = license_civ_driver;};
	case "coches_lujo": {_ret = license_civ_driver;};
	case "4x4": {_ret = license_civ_driver;};
	case "kart_shop": {_ret = license_civ_driver;};
	case "moto_chop": {_ret = license_civ_driver;};

	case "med_air_hs": {_ret = license_med_air;};
	case "taxista_shop": {_ret = license_civ_taxita;};
	case "periodista_shop": {_ret = license_civ_periodista;};
	case "tienda_trasporte": {_ret = license_civ_transporte;};
	//donador
	case "donator": {_ret = license_civ_donator;};
	
	case "civ_ship": {_ret = license_civ_boat;};
	case "civ_air": {_ret = license_civ_air;};
	case "cop_air": {_ret = license_cop_air;};
	case "cop_airhq": {_ret = license_cop_air;};
	case "civ_camiones":	{_ret = license_civ_truck;};
	case "reb_car": {_ret = license_civ_rebel;};
	case "cop_car": {_ret = license_civ_policiaon;};
	case "med_ship": {_ret = license_civ_EMSON;};
	case "cop_ship": 
	{
		if(_veh == "B_Boat_Armed_01_minigun_F") then
		{
			_ret = license_cop_cg;
		}
			else
		{
			_ret = true;
		};
	};
};

_ret;