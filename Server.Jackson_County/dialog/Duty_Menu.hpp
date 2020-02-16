#define ST_CENTER 0x02
/*
    Author: Jean-Park
    Teamspeak 3: ts.the-programmer.com
    Web site: www.the-programmer.com

    Terms of use:
      - This file is forbidden unless you have permission from the author. If you have this file without permission to use it please do not use it and do not share it.
      - If you have permission to use this file, you can use it on your server however it is strictly forbidden to share it.
      - Out of respect for the author please do not delete this information.

*/
class The_Programmer_DutyMenu {
   idd = 8000;
   name = "The_Programmer_DutyMenu";
   movingenable = false;
   enablesimulation = true;
   class controlsBackground
   {
       class Fond : life_RscPicture
       {
           x = 0.254166666666667 * safezoneW + safezoneX;
           y = 0.0960914454277286 * safezoneH + safezoneY;
           w = 0.5 * safezoneW;
           h = 0.85 * safezoneH;
           idc = 8001;
           text = "";
       };
   };
   class controls
   {
       class Prendre : Life_RscButtonMenu
       {
           idc = 8002;
           x = 0.362083333333333 * safezoneW + safezoneX;
           y = 0.789311701081612 * safezoneH + safezoneY;
           w = 0.143 * safezoneW;
           h = 0.043 * safezoneH;
           animtexturenormal = "";
           animtexturedisabled = "";
           animtextureover = "";
           animtexturefocused = "";
           animtexturepressed = "";
           animtexturedefault = "";
       };
       class Arreter : Life_RscButtonMenu
       {
           idc = 8003;
           x = 0.504791666666666 * safezoneW + safezoneX;
           y = 0.789311701081612 * safezoneH + safezoneY;
           w = 0.143 * safezoneW;
           h = 0.043 * safezoneH;
           animtexturenormal = "";
           animtexturedisabled = "";
           animtextureover = "";
           animtexturefocused = "";
           animtexturepressed = "";
           animtexturedefault = "";
       };
       class Liste : Life_RscListBox
       {
           idc = 8004;
           w = 0.21 * safezoneW;
           h = 0.4 * safezoneH;
           colorbackground[] = {1,1,1,0};
           sizeex = 0.0465;
           x = 0.403645833333334 * safezoneW + safezoneX;
           y = 0.344768928220256 * safezoneH + safezoneY;
           style = ST_CENTER + 16;
           colorSelectBackground[] = {1, 1, 1, 0};
           colorSelectBackground2[] = {1, 1, 1, 0};

       };
       class Texte : Life_RscStructuredText
       {
           idc = 1000;
           x = 0.362083333333333 * safezoneW + safezoneX;
           y = 0.2757 * safezoneH + safezoneY;
           h = 0.04 * safezoneH;
           w = 0.285 * safezoneW;
       };
   };
};