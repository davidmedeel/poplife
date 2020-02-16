private["_ladron","_shop","_dinero","_ui","_progress","_pgText","_cP","_rip","_pos","_dineroextra"];

_shop = nearestObject [player, "Orel_NPC_Civil1"]; //The object that has the action attached to it is _this. ,0, is the index of object, ObjNull is the default should there be nothing in the parameter or it's broken
_ladron = player;
if(side _ladron != civilian) exitWith {hintSilent "¿Como me estas intentando robar tu?"};
if(_ladron distance _shop > 5) exitWith {hintSilent "No puedo estar a mas de 5 metros!"};
if (vehicle player != _ladron) exitWith {hintSilent "No puedo robar si estoy dentro del vehiculo!"};
_policias = (west countSide playableUnits);
if !(alive _ladron) exitWith {};

_cerca = (nearestObjects [_shop, ["Man"], 20]) - [player];

if ((count _cerca) > 1) exitwith {hint "Aleja a tu amigo, esto ya no se puede hacer"};
if (currentWeapon _ladron in ["","pop_linterna","Binocular","Rangefinder","cl_fishing_rod","cl_axe","cl_pick_axeweap","cl_shovel","cl_picket_ftp","cl_picket_mlnw","cl_picket_rtp","pop_linterna"]) exitWith {hint "No me amenaces , fuera de aqui muerto de hambre!"};

if ((robosactivos + 1) >= 3) exitWith {hint "Hay muchos robos en progreso, espera a que terminen"};

if (Robo_nightclub getVariable ["Robo", false] ) exitwith {hint "Ya esta robando tu colega, ayudale"};

//if(_policias < 8) exitWith{[[_vault,-1],"disableSerialization;",false,false] spawn life_fnc_MP; hintSilent "No hay suficiente policia, no es divertido!";};


_metros_cancelar_robo = 10.5;
_rip = true;

_dinero = 300000 + round(random 20000);
_chance = random(100);
if(_chance >= 0) then {[1,"Alarma! - Club7 : Esta siendo Robado !"] remoteExec ["life_fnc_broadcast",west]};
[10,"Robo",[1,0,0,1],2,("Alarma! - Club7 Esta siendo robado!"),[1,1,1,1],1.5] remoteexec ["ica_fnc_anuncio",west];
Robo_nightclub setVariable ["Robo", true, true];
[25,Robo_nightclub,1] remoteExec ["ica_fnc_robodesconexion",2];
robosactivos = robosactivos + 2;
publicVariable "robosactivos";


disableSerialization;
5 cutRsc ["life_progress","PLAIN"];
_ui = uiNameSpace getVariable "life_progress";
_progress = _ui displayCtrl 38201;
_pgText = _ui displayCtrl 38202;
_pgText ctrlSetText format["PROGRESO DE APERTURA : (%1%2) ",round(_cP * 100),"%"];
_progress progressSetPosition 0.01;
_cP = 0.01;
if(_rip) then
{
while{true} do
{

uiSleep 1.5;
        _cP = _cP + 0.0035641;

_progress progressSetPosition _cP;
_distancia = _ladron distance _shop;
_pgText ctrlSetText format["APERTURA : (%1%2) Estas a %3 Metros de %4 Metros",round(_cP * 100),"%",round (_distancia),_metros_cancelar_robo];


_Pos = position player;
				                _marker = createMarker ["Robo_nightclub", _Pos];
				                "Robo_nightclub" setMarkerColor "ColorRed";
				                "Robo_nightclub" setMarkerText "!!ATENCION!!, Estan robando a los borrachos!!";
				                "Robo_nightclub" setMarkerType "mil_warning";
if(_cP >= 1) exitWith {};
if((_ladron distance _shop > _metros_cancelar_robo) || (!isPlayer _ladron)) exitWith {};
if!(alive _ladron) exitWith {};

};
if!(alive _ladron) exitWith {_cp = 1;deleteMarker "Robo_nightclub";_rip = false;5 cutText ["","PLAIN"];};
if((_ladron distance _shop > _metros_cancelar_robo) || (!isPlayer _ladron)) exitWith {deleteMarker "Robo_nightclub"; hintSilent "El segurata ha bloqueado la caja fuerte"; 5 cutText ["","PLAIN"]; _rip = false; };
5 cutText ["","PLAIN"];

titleText[format["Has robado %1 €. Has robado todo el dinero de los borrachos!",[_dinero] call life_fnc_numberText],"PLAIN"];
deleteMarker "Robo_nightclub";
pop_din = pop_din + _dinero;
[] call life_fnc_hudUpdate;
_rip = false;
Robo_nightclub setVariable ["Robo", true, true];
life_use_atm = false;



uiSleep (300 + random(180));
life_use_atm = true;
Robo_nightclub setVariable ["Robo", false, true];
if!(alive _ladron) exitWith {};
[[getPlayerUID _ladron,name _ladron,"211"],"life_fnc_wantedAdd",false,false] spawn life_fnc_MP;
};
