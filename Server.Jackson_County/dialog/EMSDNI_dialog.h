#define GUI_GRID_X	(0)
#define GUI_GRID_Y	(0)
#define GUI_GRID_W	(0.025)
#define GUI_GRID_H	(0.04)
#define GUI_GRID_WAbs	(1)
#define GUI_GRID_HAbs	(1)

//--- 
#define IDC__TEXTNOMBRE	1000
#define IDC__TEXT		1001
#define IDC__PICTURE	1200

class EMSDNI_dialog
{
	idd = 65673;
	movingEnabled = true;
	enableSimulation = true;
	duration = 10;
	name="EMSDNI_dialog";
	onLoad="uiNamespace setVariable ['EMSDNI_dialog',_this select 0];";

		
	class ControlsBackground
	{
		class Picture: AkrPicture
		{
			idc = 1500;
			text = "\Rex_Fotos\textures\dniems.paa";
			x = 39.5 * GUI_GRID_W + GUI_GRID_X;
			y = 2.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 30 * GUI_GRID_W;
			h = 23 * GUI_GRID_H;
		};
	};

	class Controls
	{
		////////////////////////////////////////////////////////
		// GUI EDITOR OUTPUT START (by Akryllax, v1.063, #Fikoqo)
		////////////////////////////////////////////////////////

		class TextNombre: AkrText
		{
			idc = 656821;
			text = "Persona Nombre largo"; //--- ToDo: Localize;
			x = 54 * GUI_GRID_W + GUI_GRID_X;
			y = 12 * GUI_GRID_H + GUI_GRID_Y;
			w = 11 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
			colorText[] = {0,0,0,1};
			colorBackground[] = {0,0,0,0};
			colorActive[] = {0,0,0,1};
		};
		class Text: AkrText
		{
			idc = 656822;
			text = "014239"; //--- ToDo: Localize;
			x = 59 * GUI_GRID_W + GUI_GRID_X;
			y = 18 * GUI_GRID_H + GUI_GRID_Y;
			w = 8 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
			colorText[] = {0,0,0,1};
			colorBackground[] = {0,0,0,0};
			colorActive[] = {0,0,0,1};
		};
		////////////////////////////////////////////////////////
		// GUI EDITOR OUTPUT END
		////////////////////////////////////////////////////////

	};
};