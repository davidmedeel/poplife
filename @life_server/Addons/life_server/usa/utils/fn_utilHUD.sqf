// NO terminado, es un experimento, pero no social.
//
//
_idc = _this select 0;//cogemos el idc
_param = _this select 1;
_stringTipo = _this select 2;

disableSerialization;
_ui = uiNamespace getVariable "Logos"; //ahora esto contiene nuestro dialog

if(_param) then {
	_ui displayCtrl _idc;
};
if!(_param) then {
	_ui ctrlShow _param
};

//if(_show) then {_show = "Si"};
//if!(_show) then {_show = "No"};

hint format ["Param's dados: IDC: %1 || Activado:%2",_idc, _show];


