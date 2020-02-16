/////////////////////////////
// TDR ACJ
// Animaciones de baiele //
//////////////////////////

if (!isNil "life_fnc_animsync") then
{
//[[player,"cl3_robotdance"],"life_fnc_animsync",true,false] call life_fnc_MP;
[player,"cl3_robotdance"] remoteexec ["life_fnc_animsync"];
} else
{
player switchmove "cl3_robotdance"
};

[] spawn
{
sleep 50;
//[[player,""],"life_fnc_animsync",true,false] call life_fnc_MP;
[player,""] remoteexec ["life_fnc_animsync"];
A3L_isDancing = false;
};