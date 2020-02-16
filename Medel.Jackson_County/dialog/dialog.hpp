class PaintCaring 
{ 
idd = 1001;
enableSimulation = 1; // 1 (true) to allow world simulation to be running in the background, 0 to freeze it
enableDisplay = 1; // 1 (true) to allow scene rendering in the background

class ControlsBackground {
		class back: Life_RscText
	{
		idc = 1200;
		x = safezoneX;
		y = safezoneY + safezoneH / 4;
		w = 20 * GUI_GRID_CENTER_W;
		h = 20 * GUI_GRID_CENTER_W;
		text = "";
		sizeEx = 0.05;
		
	};
		class Picture2: RscPicture
	{
		idc = 1203;
		text = "\..\icons\picker.paa";		
		x = safezoneX + 20.1 * GUI_GRID_CENTER_W;
		y = safezoneY + safezoneH / 4;
		w = 3 * GUI_GRID_CENTER_W; 
		h = 20 * GUI_GRID_CENTER_W;
	
	};
	
};
class controls
{

	class Picture: RscPicture
	{
		idc = 1201;
		text = "\..\icons\color.paa";		
		x = safezoneX;
		y = safezoneY + safezoneH / 4;
		w = 20 * GUI_GRID_CENTER_W; 
		h = 20 * GUI_GRID_CENTER_W;
	
	};
	class cursor1: RscPicture
	{
		idc = 1199;
		text = "\..\icons\cursor.paa";		
		x = -3;
		y = -3;
		w = GUI_GRID_CENTER_W/3; 
		h = GUI_GRID_CENTER_W/3;
	
	};
	class cursor2: RscPicture
	{
		idc = 1198;
		text = "../icons/cursor2.paa";		
		x = -3;
		y = -3;
		w = GUI_GRID_CENTER_W/3; 
		h = GUI_GRID_CENTER_W/3;
	
	};
	class front: Life_RscText
	{
		idc = 1202;
		x = safezoneX;
		y = safezoneY + safezoneH / 4;
		w = 20 * GUI_GRID_CENTER_W; 
		h = 20 * GUI_GRID_CENTER_W;
		text = "";
		sizeEx = 0.05;
		onMouseButtonClick = "_h = [_this,true] spawn medel_fnc_paintCar;false";
		
	};

	class front2: Life_RscText
	{
		idc = 1204;
		x = safezoneX + 20.1 * GUI_GRID_CENTER_W;
		y = safezoneY + safezoneH / 4;
		w = 3 * GUI_GRID_CENTER_W; 
		h = 20 * GUI_GRID_CENTER_W;
		text = "";
		sizeEx = 0.05;
		
	};

	class ButtonAccept : Life_RscButtonMenu {
		x = safezoneX + 15.1 * GUI_GRID_CENTER_W;
		y = safezoneY + safezoneH / 4 + 20.1 * GUI_GRID_CENTER_W;
		w = 4.9 * GUI_GRID_CENTER_W; 
		h = 5 * GUI_GRID_CENTER_W;
		text = "Aceptar";
		action = "closeDialog 0;";
	};
	class ButtonCancel : Life_RscButtonMenu {
		x = safezoneX + 1 * GUI_GRID_CENTER_W;
		y = safezoneY + safezoneH / 4 + 20.1 * GUI_GRID_CENTER_W;
		w = 4.9 * GUI_GRID_CENTER_W; 
		h = 5 * GUI_GRID_CENTER_W;
		text = "Cancelar";
		action = "car setObjectTexture [0,originalPaint];closeDialog 0;createdialog ""Life_Vehicle_Shop_v2"";";
	};

};
};