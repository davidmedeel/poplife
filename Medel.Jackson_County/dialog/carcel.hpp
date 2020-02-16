
class a3l_jail_timer {
	idd = 5536;
	duration = 1e+012;
	onLoad = "uiNamespace setVariable [""a3ljailtimer"", _this select 0];";
	class controls {

class IGUIBack_2200: IGUIBack
{
	idc = 2200;
	x = 0.025625 * safezoneW + safezoneX;
	y = 0.038 * safezoneH + safezoneY;
	w = 0.279465 * safezoneW;
	h = 0.341 * safezoneH;
};
class RscText_1000: RscText
{
	idc = 1000;
	text = "Estas en prision"; //--- ToDo: Localize;
	x = -0.6025;
	y = -0.316;
	w = 0.5125;
	h = 0.1;
	sizeEx = 3 * GUI_GRID_H;
};
class RscText_1001: RscText
{
	idc = 1001;
	text = "Condena:"; //--- ToDo: Localize;
	x = -0.6275;
	y = -0.132;
	w = 0.1975;
	h = 0.1;
	sizeEx = 2 * GUI_GRID_H;
};
class RscText_1002: RscText
{
	idc = 1002;
	text = "Celda:"; //--- ToDo: Localize;
	x = -0.63;
	y = 0.0400001;
	w = 0.1375;
	h = 0.108;
	sizeEx = 2 * GUI_GRID_H;
};
class Tiempo: RscStructuredText
{
	idc = 1100;
	x = -0.4275;
	y = -0.104;
	w = 0.435;
	h = 0.068;
};
class Celda: RscStructuredText
{
	idc = 1101;
	x = -0.495;
	y = 0.0680001;
	w = 0.1625;
	h = 0.068;
};
	};
};