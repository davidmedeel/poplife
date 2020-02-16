#include <macro.h>
if(__GETC__(life_adminlevel) < 1) exitWith {closeDialog 0;};

_a = nearestObjects [player, [], 200];
{
    if (!((_x iskindof "man") or (_x iskindof "car") or (_x iskindof "Motorcycle") or (_x iskindof "ship") or (_x iskindof "air"))) then  {
        _x setdamage 0;
    };
} foreach _a;

