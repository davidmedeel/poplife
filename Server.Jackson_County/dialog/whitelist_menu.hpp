/*
    Author: Maxence Lyon
    Altis DEV: https://altisdev.com/user/maxence-lyon
    Teamspeak 3: ts.the-programmer.com
    Web site: www.the-programmer.com
    Steam: « Une Vache Sur CS – Maxence », please leave a message on my profile who says the exact reason before adding me.

    Terms of use:
    	- This file is forbidden unless you have permission from the author. If you have this file without permission to use it please do not use it and do not share it.
    	- If you have permission to use this file, you can use it on your server however it is strictly forbidden to share it.
    	- Out of respect for the author please do not delete this information.

    License number:
    Server's name:
    Owner's name:
*/
class whitelist_menu {
	idd = 29550;
	name = "whitelist_menu";
	movingEnable = 0;
	enableSimulation = 1;
	onLoad = "[] spawn max_whitelist_fnc_whitelistMenu;";

	class controlsBackground {
		class Life_RscTitleBackground: Life_RscText {
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
            idc = -1;
            x = 0.1;
            y = 0.2;
            w = 0.8;
            h = (1 / 25);
		};

		class MainBackground: Life_RscText {
			colorBackground[] = {0, 0, 0, 0.7};
			idc = -1;
			x = 0.1;
			y = 0.2 + (11 / 250);
			w = 0.8;
			h = 0.6 - (22 / 250);
		};

		class Title: Life_RscTitle {
			colorBackground[] = {0, 0, 0, 0};
			idc = 45545;
			text = "";
			x = 0.1;
			y = 0.2;
			w = 0.8;
			h = (1 / 25);
		};

		class PlayersTitle: Life_RscText {
			idc = 5447;
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			text = "";
			sizeEx = 0.04;
			x = 0.12;
			y = 0.27;
			w = 0.350;
			h = 0.04;
		};

		class LicensesTitle: Life_RscText {
			idc = 44544;
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			text = "";
			sizeEx = 0.04;
			x = 0.53;
			y = 0.27;
			w = 0.350;
			h = 0.04;
		};
	};

	class controls {
		class PlayersList: Life_RscListBox {
			idc = 29551;
			text = "";
			sizeEx = 0.030;
			x = 0.12;
			y = 0.31;
			w = 0.350;
			h = 0.419;
		};

		class LicensesList: Life_RscListBox {
			idc = 29552;
			text = "";
			sizeEx = 0.030;
			x = 0.53;
			y = 0.31;
			w = 0.350;
			h = 0.360;
		};

		class ButtonAdd: Life_RscButtonMenu {
			idc = 8550;
			text = "";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			onButtonClick = "[] call max_whitelist_fnc_whitelistAdd";
			x = 0.433 + (0.35 / 2) - ((6.25 / 40) / 2);
            y = 0.692;
            w = (6.25 / 40);
            h = (1 / 25);
		};

		class ButtonRemove: Life_RscButtonMenu {
			idc = 54656;
			text = "";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			onButtonClick = "[] call max_whitelist_fnc_whitelistRemove";
			x = 0.625 + (0.35 / 2) - ((6.25 / 40) / 2);
            y = 0.692;
            w = (6.25 / 40);
            h = (1 / 25);
		};

		class ButtonClose: Life_RscButtonMenu {
			idc = -1;
			text = "$STR_Global_Close";
			onButtonClick = "closeDialog 0;";
			x = 0.1;
			y = 0.8 - (1 / 25);
			w = (6.25 / 40);
			h = (1 / 25);
		};

		class ButtonBusiness: Life_RscButtonMenu {
			idc = 29553;
			text = "";
			onButtonClick = "[1] call max_whitelist_fnc_whitelistCategory";
			x = 0.259;
			y = 0.8 - (1 / 25);
			w = (6.25 / 40);
			h = (1 / 25);
		};

		class ButtonFamily: Life_RscButtonMenu {
			idc = 29554;
			text = "";
			onButtonClick = "[2] call max_whitelist_fnc_whitelistCategory";
			x = 0.418;
			y = 0.8 - (1 / 25);
			w = (6.25 / 40);
			h = (1 / 25);
		};

		class ButtonPolice: Life_RscButtonMenu {
			idc = 29555;
			text = "";
			onButtonClick = "[3] call max_whitelist_fnc_whitelistCategory";
			x = 0.577;
			y = 0.8 - (1 / 25);
			w = (6.25 / 40);
			h = (1 / 25);
		};
		class ButtonMedic: Life_RscButtonMenu {
			idc = 29556;
			text = "";
			onButtonClick = "[4] call max_whitelist_fnc_whitelistCategory";
			x = 0.736;
			y = 0.8 - (1 / 25);
			w = (6.25 / 40);
			h = (1 / 25);
		};
	};
};