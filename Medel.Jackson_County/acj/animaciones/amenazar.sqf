/////////////////////////////
// TDR ACJ
// Animaciones
//////////////////////////

if (!isNil "life_fnc_animsync") then
{
//[[player,"A3L_Threaten"],"life_fnc_animsync",true,false] call life_fnc_MP;
[player,"A3L_Threaten"] remoteexec ["life_fnc_animsync"];
} else
{
player switchmove "A3L_Threaten"
};

[] spawn
{
sleep 6;
//[[player,""],"life_fnc_animsync",true,false] call life_fnc_MP;
[player,""] remoteexec ["life_fnc_animsync"];
A3L_isDancing = false;
};