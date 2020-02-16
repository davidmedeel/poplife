/////////////////////////////
// TDR ACJ
// Animaciones
//////////////////////////

if (!isNil "life_fnc_animsync") then
{
//[[player,"CL3_anim_drink"],"life_fnc_animsync",true,false] call life_fnc_MP;
[player,"CL3_anim_drink"] remoteexec ["life_fnc_animsync"];
} else
{
player switchmove "CL3_anim_drink"
};

[] spawn
{
sleep 5;
//[[player,""],"life_fnc_animsync",true,false] call life_fnc_MP;
[player,""] remoteexec ["life_fnc_animsync"];
A3L_isDancing = false;
};