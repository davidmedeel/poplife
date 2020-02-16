#include <macro.h>
if(__GETC__(life_adminlevel) < 1) exitWith {closeDialog 0;};
private["_target"];
_target = lbData[2902,lbCurSel (2902)];
_target = call compile format["%1", _target];
if(isNil "_target") exitwith {};
if(isNull _target) exitWith {};

{profileNamespace setVariable ["rutome", 0]} remoteExec ["bis_fnc_call",_target];
