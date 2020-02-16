/*
	File: fn_sendChannel.sqf
	Author: alleskapot & Lifted
	Thanks again for all the help alleskapot!
	Description:
	Erm�glicht senden bzw. die Abfrage des Geschriebenen.

*/

private["_message"];
disableSerialization;

waitUntil {!isnull (findDisplay 9000)};

if ( medel_din < 6000 ) exitWith { systemChat "No tiene �6000!"; };
//if ( playerSide != civilian ) exitWith { systemChat "Tu dois etre civile!"; }; // Hint if not civilian
if !( life_channel_send ) exitWith { systemChat "Gracias espere 10 minutos antes de enviar un mensaje diferente!"; }; //Gives Player the Hint to Wait 10 mins
medel_din = medel_din - 6000;

_message = ctrlText 9001;
//[[6,format ["Anuncio de %1: %2",name player,_message]],"life_fnc_broadcast",true,false] call life_fnc_MP;
[6,format ["Anuncio de %1: %2",name player,_message]] remoteexec ["life_fnc_broadcast"];
life_channel_send = false;

[] spawn
{
	sleep 600;
	life_channel_send = true;
};