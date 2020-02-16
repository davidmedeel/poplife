class Menu_Admin {
    idd = 2900;
    name= "Menu_Admin";
    movingEnable = false;
    enableSimulation = true;
    onLoad = "[] spawn ica_fnc_adminmenu2;";
	
	    class controls {
class lista_players: RscListbox
{
	idc = 1500;
	x = -0.675;
	y = 0.08;
	w = 0.675;
	h = 0.64;
};
class informacion: RscListbox
{
	idc = 1501;
	x = 1.025;
	y = 0.14;
	w = 0.65;
	h = 0.52;
};
class Global: RscListbox
{
	idc = 1502;
	x = 0.0875;
	y = 0.72;
	w = 0.2125;
	h = 0.52;
};
class RscText_1000: RscText
{
	idc = 1000;
	text = "Global"; //--- ToDo: Localize;
	x = 0.15;
	y = 0.64;
	w = 0.0875;
	h = 0.08;
};
class RscListbox_1503: RscListbox
{
	idc = 1503;
	x = 0.3625;
	y = 0.72;
	w = 0.2125;
	h = 0.52;
};
class RscText_1001: RscText
{
	idc = 1001;
	text = "Global"; //--- ToDo: Localize;
	x = 0.425;
	y = 0.64;
	w = 0.0875;
	h = 0.08;
};
class RscText_1002: RscText
{
	idc = 1002;
	text = "Local"; //--- ToDo: Localize;
	x = 0.7;
	y = 0.64;
	w = 0.0875;
	h = 0.08;
};
class RscListbox_1504: RscListbox
{
	idc = 1504;
	x = 0.6375;
	y = 0.72;
	w = 0.2125;
	h = 0.52;
};
class introducenombre: RscEdit
{
	idc = 1400;
	x = -0.4875;
	y = 0.02;
	w = 0.3;
	h = 0.06;
};
};
};