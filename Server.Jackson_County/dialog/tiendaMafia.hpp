class tiendaMafia
{
	idd = -1;
	movingenable = true;
	onLoad = "uiNamespace setVariable ['tiendaMafia', _this select 0];";
	onUnLoad = "uiNamespace setVariable ['tiendaMafia', nil]; cosa = nil; precio = nil; ";
	
	class controls {
		class RscPicture_1200: RscPicture
		{
			text = "\Rex_Fotos\paa\mafia.paa";
			idc = 5005;
			x = 0.0874998 * safezoneW + safezoneX;
			y = -0.028 * safezoneH + safezoneY;
			w = 0.809531 * safezoneW;
			h = 1.012 * safezoneH;
		};
		class botonComprar: RscButton
		{
			idc = 5006;
			text = "Comprar"; //--- ToDo: Localize;
			x = 0.273125 * safezoneW + safezoneX;
			y = 0.599 * safezoneH + safezoneY;
			w = 0.144375 * safezoneW;
			h = 0.044 * safezoneH;
		};

		class RscListbox_1500: RscListbox
		{
			idc = 5007;
			x = 0.463905 * safezoneW + safezoneX;
			y = 0.313 * safezoneH + safezoneY;
			w = 0.237187 * safezoneW;
			h = 0.385 * safezoneH;
			colorBackground[] = {0,0,0,0};
			sizeEx = 0.034;
			onLBSelChanged = "['actualiza'] call ica_fnc_tiendaMafia";
		};
		class icaruk: RscText
		{
			idc = -1;
			text = "Icaruk"; //--- ToDo: Localize;
			x = 0.964445 * safezoneW + safezoneX;
			y = -0.0166667 * safezoneH + safezoneY;
			w = 0.0412603 * safezoneW;
			h = 0.055 * safezoneH;
			colorBackground[] = {0,0,0,0};
		};
	};
};