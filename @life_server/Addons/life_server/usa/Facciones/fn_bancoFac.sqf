//Aclaración: Es banco Fac, no banco fuck, gracias.

diag_log "[USA] Banco Fac Iniciado.";
private "_cantidad";
_cantidad = round([_this,2, 0, [0]] call BIS_fnc_param);

if (_cantidad isequalto 0) exitwith {};

