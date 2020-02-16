#include <macro.h>
/*
    File: fn_vestirse.sqf
    Author: Heisenberg White
    
*/
if(__GETC__(life_adminlevel) < 1) exitWith {closeDialog 0};



if (isnil "uniforme") then {

_result = [format ["¿Seguro que quieres vestirte?"], "Vestirse de MoD","Aceptar","Cancelar"] call BIS_fnc_guiMessage;



if (_result) then {


uniforme = getunitloadout player;
removeuniform player;
removebackpack player;
removeVest player;
player forceAddUniform "U_I_Soldier_VR";



};


} else {


removeuniform player;
player setunitloadout uniforme;

uniforme = nil;



};