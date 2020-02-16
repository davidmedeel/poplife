/////////////////////////////
// TDR ACJ
// Animaciones
//////////////////////////

if (!isNil "life_fnc_animsync") then
{
//[[player,"A3L_Point"],"life_fnc_animsync",true,false] call life_fnc_MP;
[player,"A3L_Point"] remoteexec ["life_fnc_animsync"];
} else
{
player switchmove "A3L_Point"
};

[] spawn
{
sleep 2;
//[[player,""],"life_fnc_animsync",true,false] call life_fnc_MP;
[player,""] remoteexec ["life_fnc_animsync"];
A3L_isDancing = false;
};