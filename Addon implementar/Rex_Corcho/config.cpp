class CfgPatches
{
	class Rex_Corcho
	{
		units[]=
		{
			"Rex_Corcho"
		};
		weapons[]={};
		requiredVersion=0.1;
		requiredAddons[]=
		{
			"A3_Weapons_F"
		};
	};
};
class CfgVehicleClasses
{
	class Rex_Corcho
	{
		displayName="Corcho";
	};
};
class CfgFactionClasses
{
	class Rex
	{
		displayName="Rex";
		priority=100;
		side=3;
	};
};
class CfgVehicles
{
	class Strategic;
	class Rex_Corcho: Strategic
	{
		displayName="corcho para pescar";
		picture="\Rex_Corcho\texturas\corchoico.paa";
		model="\Rex_Corcho\rex_corcho.p3d";
		descriptionShort="corcho";
		scope=2;
		canfloat="true";
		count=1;
		type=256;
		mass=5;
	};
};
