#include <macro.h>
if(__GETC__(life_adminlevel) < 1) exitWith {closeDialog 0;};

[] spawn {
	player allowdamage false;
	sleep 3;
	waitUntil {isTouchingGround player};
	player allowdamage true;
};

_tio = player;
_vel = velocity _tio;
_dir = direction _tio;
_potencia = 6;
_altura = 20;
_tio setVelocity [
	((_vel select 0) + (sin _dir * _potencia)),
	((_vel select 1) + (cos _dir * _potencia)),
	(_vel select 2) + _altura
];