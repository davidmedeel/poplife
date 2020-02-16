#define __CONST__(var1,var2) var1 = compileFinal (if(typeName var2 == "STRING") then {var2} else {str(var2)})
#include "script_macros.hpp"
DB_Async_Active = false;
DB_Async_ExtraLock = false;
life_server_isReady = false;
publicVariable "life_server_isReady";
_extDBNotLoaded = "";

[] execVM "\life_server\functions.sqf";
[] execVM "\life_server\eventhandlers.sqf";
[] execFSM "\life_server\cleanup.fsm";

if (isNil {uiNamespace getVariable "life_sql_id"}) then {
    life_sql_id = round(random(9999));
    CONSTVAR(life_sql_id);
    uiNamespace setVariable ["life_sql_id",life_sql_id];
        try {
        _result = EXTDB format ["9:ADD_DATABASE:%1",EXTDB_SETTING(getText,"DatabaseName")];
        if (!(_result isEqualTo "[1]")) then {throw "extDB3: Error with Database Connection"};
        _result = EXTDB format ["9:ADD_DATABASE_PROTOCOL:%2:SQL:%1:TEXT2",FETCH_CONST(life_sql_id),EXTDB_SETTING(getText,"DatabaseName")];
        if (!(_result isEqualTo "[1]")) then {throw "extDB3: Error with Database Connection"};
    } catch {
        diag_log _exception;
        _extDBNotLoaded = [true, _exception];
    };
    if (_extDBNotLoaded isEqualType []) exitWith {};
    EXTDB "9:LOCK";
    diag_log "extDB3: Connected to Database";
} else {
    life_sql_id = uiNamespace getVariable "life_sql_id";
    CONSTVAR(life_sql_id);
    diag_log "extDB3: Still Connected to Database";
};


if (_extDBNotLoaded isEqualType []) exitWith {
    life_server_extDB_notLoaded = true;
    publicVariable "life_server_extDB_notLoaded";
};
life_server_extDB_notLoaded = false;
publicVariable "life_server_extDB_notLoaded";

/* Run stored procedures for SQL side cleanup */
["CALL resetLifeVehicles",1] call DB_fnc_asyncCall;
["CALL deleteDeadVehicles",1] call DB_fnc_asyncCall;
["CALL deleteOldHouses",1] call DB_fnc_asyncCall;
["CALL deleteOldGangs",1] call DB_fnc_asyncCall;

life_adminlevel = 0;
life_medicLevel = 0;
life_coplevel = 0;
life_oplevel = 0;

//Null out harmful things for the server.
__CONST__(JxMxE_PublishVehicle,"No");

//[] execVM "\life_server\fn_initHC.sqf";

/*life_radio_west = radioChannelCreate [[0, 0.95, 1, 0.8], "Side Channel", "%UNIT_NAME", []];
life_radio_civ = radioChannelCreate [[0, 0.95, 1, 0.8], "Side Channel", "%UNIT_NAME", []];
life_radio_indep = radioChannelCreate [[0, 0.95, 1, 0.8], "Side Channel", "%UNIT_NAME", []];
life_radio_east = radioChannelCreate [[0, 0.95, 1, 0.8], "Side Channel", "%UNIT_NAME", []];*/

serv_sv_use = [];


//General cleanup for clients disconnecting.
addMissionEventHandler ["HandleDisconnect",{_this call TON_fnc_clientDisconnect; false;}];


[] spawn TON_fnc_cleanup;
life_gang_list = [];
publicVariable "life_gang_list";
//Rex revisar
life_wanted_list = ["SELECT list from wanted",2,true] spawn DB_fnc_asyncCall;

client_session_list = [];

listaCasas = [
    "Land_i_House_Small_02_V3_F"
];
publicVariable "listaCasas";

listaGarajes = [
    "Land_i_Garage_V1_F",
	"Land_i_Garage_V2_F",
	"Land_smd_garaz_long_open",
	"Land_smd_garaz_mala_open",
	"Land_smd_garaz_open"
];
publicVariable "listaGarajes";

//[] call usa_fnc_hud;



_t0 = diag_tickTime;
diag_log "--------------------------------------------------------------";
diag_log "-------- Llenando array funciones Icaruk (server)... ----------";
diag_log "--------------------------------------------------------------";

_arr = [];
_cosas = [
	"initHud", "onmap", "editando", /*Rex"cheto",*/ "item", "classToname", "classtopic", "meteaccion", "negtopos", "numtostr", "strtoarr", "instring", "revela", "masCercano", "getpos", "tengo", "mapmarkers", "setvelocity", "setvelocityras", "playmovenow", "switchmove", "cargainv", "addEH", "ocultame", "anuncio", "anunciosimple", "masuno", "barrita", "borrame", "bloqueodinero", "creaMatricula", "sync",
	"menuCompraventa", "arraytienda", "infolog", "menuy",
	"preciocombustible", "precio",
	"subasta", "initsubasta", "recogebeneficios", "subebajabeneficios",
	"initexp", "exptolevel", "exp", "arrayexp", "limitadordearmas", "costeSP", "ganoExp",
	"pesca", "picando", "llenabotella", "talando", "initnaufragios", "agricultura", "initmineria", "procesado", "basura",
	"hacker", "ganzua", "initportatil", "mirodocumentos", "resetdatos", "roboconcesionario", "robodedatos", "roboalcalde", "robogasolinera", "robonuclear","fugacarcel",
	"tiendamafia","tiendaterrorista", "traficantedroga", "camello", "initdroga", "blanqueo",
	"sacodineropublico", "camaras", "puntoscarnet", "tiendaPolicia", "matriculas3D", "cacheo",
	"initvars", "menutransportes", "menumineria", "carga", "descarga", "gasolinera", "menualmacen", "entregaPaquete",
	"wikipedia", "impuestos", "nigromante", "consumo", "comobebo", "inithabilidades", "crafteo", "dadinero", "dallaves", "mensajesica", "posicion", "autobusMagico", "reporte", /*"silencer"*/ /*"vistabonita",*/
	"loteria",
	/* funciones WarBlast */
	"objetos_poner",
	/* fin funciones WarBlast */
	//Fuctions usa
	//"Gobierno","paintCar","hud",

	/*Funciones Rex*/
	"iniciarPoli", "menupoli", "probarcoche", "adminmenu2", "trabajobus", "hintc", "menuems", "iniciarEMS", "robogasolinera", "diamantes", "bancoheist", "nightclub", "correos", "robogasolinera2", "roboJoyeria", "granjero",
	"misionesLaEmpresa", "calcmulta", "controlvelocidad", "sancion", "pescar", "emsMarkers", "abrirpuertas",
	/*Fin funciones Rex*/
	//Genxx
	"recogebasura",
	/* funciones Tisor */
	"centralita",
	/* fin funciones Tisor */
	"hab_golpe", "hab_molotov", "hab_pociondeinvis", "hab_pociondeparkour", "hab_reparar",
	"EH", "usoitemfis", "pongoItem",
	"initmed", "sistemamedica", "sangrando", "borroso", "dolor", "diagnostico", "tratamiento", "fractura", "toxicidad", "inconsciente", "guardacargamed","enterrador", "organos",
	"climacliente", "climaservidor"
];

for "_idx" from 0 to (count _cosas) -1 do {
	_arr pushBack (format ["ica_fnc_%1", _cosas select _idx]);
};
arr = _arr;
publicVariable "arr";

diag_log "--------------------------------------------------------------";
diag_log format ["-------- Array funciones Icaruk (server) lleno en %1s. --------", diag_tickTime - _t0];
diag_log "--------------------------------------------------------------";

[] spawn
{
	private["_logic","_queue"];
	while {true} do
	{
		sleep (30 * 60);
		_logic = missionnamespace getvariable ["bis_functions_mainscope",objnull];
		_queue = _logic getvariable "BIS_fnc_MP_queue";
		_logic setVariable["BIS_fnc_MP_queue",[],TRUE];
	};
};



[
		300*60, // Eliminar cuerpos, antes estaba a 1m
		20*61, // seconds to delete dead vehicles (0 means don't delete)
		0, // seconds to delete immobile vehicles (0 means don't delete)
		2*60, // seconds to delete dropped weapons (0 means don't delete)
		0, // seconds to deleted planted explosives (0 means don't delete)
		0 // seconds to delete dropped smokes/chemlights (0 means don't delete)
] execVM "\life_server\repetitive_cleanup.sqf";


{
	if(!isPlayer _x) then {
		_npc = _x;
		{
			if(_x != "") then {
				_npc removeWeapon _x;
			};
		} foreach [primaryWeapon _npc,secondaryWeapon _npc,handgunWeapon _npc];
	};
} foreach allUnits;

/*_t1 = diag_tickTime;
diag_log "--------------------------------------------------------------";
diag_log "-------- Casas con puertas en modo Hulk (server)... ----------";
diag_log "--------------------------------------------------------------";
{
	_x allowDamage false;
	diag_log format ["%1",_x];
} forEach (nearestObjects [[10000,10000,0], listaCasas, 9000]);
diag_log "--------------------------------------------------------------";
diag_log format ["-------- Casas listas en forma de Hulk (server) en %1s. --------", diag_tickTime - _t1];
diag_log "--------------------------------------------------------------";
*/

[] spawn TON_fnc_initHouses;
[] spawn life_fnc_initWanted;
life_server_isReady = true;
publicVariable "life_server_isReady";
