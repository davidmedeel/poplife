class LogoPoli {
	idd = -1; // ID del display
	onLoad = "uiNamespace setVariable ['LogoPoli', _this select 0];"; // esto se lanza al cargar
    duration = 9e+012;
	
class controls {

		class LogoPoli : life_RscPicture
        {
            idc = 645623;
			text = "images\logopoli.paa";
			x = 0.82 * safezoneW + safezoneX;
			y = 0.92 * safezoneH + safezoneY;
		    w = 0.064 * safezoneW;
            h = 0.090 * safezoneH;
		};
	};
 };