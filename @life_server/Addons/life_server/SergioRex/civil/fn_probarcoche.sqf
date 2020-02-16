/*
Script creado por Sergio Rex
*/

if (usandocoche isEqualTo true) exitWith {hint "Hay alguien ya usando el probador de coches.";};

if((lbCurSel 2302) isEqualTo -1) exitWith {hint "Selecciona algun vehiculo.";};
_className = lbData[2302,(lbCurSel 2302)];

//hint format ["Seleccionaste %1",_className];
_lista = "C_Heli_Light_01_civil_F";

if (_className == _lista) exitwith {hint "No puedes probar esté vehiculo";};

if !(pop_din >= 500) exitWith {hint "No tienes 500$ para los gastos.";};

pop_din = pop_din - 500;

_posicion = getpos player;

_vehicle = _className createVehicle getMarkerPos "probarcoche";
usandocoche = true;
publicvariable "usandocoche";
player moveInAny _vehicle;
_pos = getMarkerPos "probarcoche";
_temporizador = 60;
_distancia = _vehicle distance _pos;

while {_temporizador > 0} do {

//hintsilent format ["Tienes %1 segundos para probar el vehiculo",_temporizador];
hintsilent format ["Tienes %1 segundos para probar el vehiculo, recuerda no alejarte mucho!",_temporizador];

if !(alive player) then {_temporizador = 0;};

if ((player distance _pos) > 300) exitWith {
_temporizador = 0;
 hint "Te alejaste mucho!"; 
 usandocoche = false; publicvariable "usandocoche";
 _vehicle setfuel 0;
 [_vehicle, [0, 0, 1]] call ica_fnc_setVelocityRas;
 deletevehicle _vehicle;
 player setpos _posicion;
};

sleep 1;
_temporizador = _temporizador - 1;

if (_temporizador <= 0) then {_temporizador = 0;
player allowdamage false;
[_vehicle, [0, 0, 1]] call ica_fnc_setVelocityRas;
deletevehicle _vehicle;

player setpos _posicion;
player allowdamage true;
usandocoche = false;
publicvariable "usandocoche";
};

};