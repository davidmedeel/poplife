/////////////////////////////
// TDR ACJ
// Animaciones de baiele //
//////////////////////////

if (!isNil "life_fnc_animsync") then
{
//[[player,"cl3_DuoStephan"],"life_fnc_animsync",true,false] call life_fnc_MP;
[player,"cl3_DuoStephan"] remoteexec ["life_fnc_animsync"];
} else
{
player switchmove "cl3_DuoStephan"
};

[] spawn
{
sleep 50;
//[[player,""],"life_fnc_animsync",true,false] call life_fnc_MP;
[player,""] remoteexec ["life_fnc_animsync"];
A3L_isDancing = false;
};