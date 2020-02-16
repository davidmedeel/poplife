class hud {
	idd = -1;
	fadein = 2; 
	duration = 9999;
	fadeout = 4;
	movingEnable = 0;
	onLoad = "uiNamespace setVariable ['hud', _this select 0]";
	onUnLoad = "uiNamespace setVariable ['hud', nil]";
	
	class controls {
////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT START (by Medel, v1.063, #Luxaju)
////////////////////////////////////////////////////////
		class RscPicture_1200: RscPicture
		{
			idc = 1200;
			text = "\medel_fotos\hud\hud.paa";
			x = 0.925;
			y = 0.52;
			w = 1.125;
			h = 1.36;
		};
		class salud: RscText
		{
			idc = 1000;
			x = 1.325;
			y = 1.08;
			w = 0.225;
			h = 0.04;
		};
		class agua: RscText
		{
			idc = 1001;
			x = 1.325;
			y = 1.18;
			w = 0.225;
			h = 0.04;
		};
		class hambre: RscText
		{
			idc = 1003;
			x = 1.325;
			y = 1.28;
			w = 0.225;
			h = 0.04;
		};
		////////////////////////////////////////////////////////
		// GUI EDITOR OUTPUT END
		////////////////////////////////////////////////////////
	};
};
