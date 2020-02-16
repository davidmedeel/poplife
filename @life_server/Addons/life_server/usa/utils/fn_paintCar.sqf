//
// Se iba a hacer un prototipo de pintura, pero claro, afortunadamente tenemos assets gratuitos que estan bastante bien y se pueden mejorar.
//
/*
if((lbCurSel 2310) isEqualTo -1) exitWith {format ["No has seleccionado ninguna pintura, si continuas generarás un coche en blanco"] spawn BIS_fnc_guiMessage;};
_className = lbData[2310,(lbCurSel 2310)];

_veh = vehicle player;
_obj setObjectTexture [0, "#(rgb,8,8,3)color(1,0,0,1)"];

*/

//closeDialog 0;

//createDialog "PaintCaring";


//Calculate the color based on position on the slider
_fex_fn_calc = {
_alpha = 0.09;		//"width" of the arc
_ex = _this select 0;		//parameter - Y coordinate
_sigma = _this select 1;	//offset (different for each channel)

_a =1/(0.4*sqrt(2*pi));
_b = _sigma;
_c = _alpha; 
_d = -(((_ex-_b)^2)/(2*_c^2));
_fn = _a* (exp _d);
//for testing purposes only
//hint format ["Y: %1\n F: %2",_ex, _fn];
_fn;		//return
};

//calculate color channels R, G, B
_fex_fn_calcMain = {
_y = _this select 0;		//Y coordinates
_ex = _this select 1;		//X coordinates
_bool = _this select 2;		//if clicked on picker or main
if (!_bool) then {			//picker, calculate Hue
R = [_y,0.01] call _fex_fn_calc;
G = [_y, 0.24] call _fex_fn_calc;
B = [_y, 0.44] call _fex_fn_calc;
if (_y > 0.35) then {
R = [_y,0.64] call _fex_fn_calc;
};
};
if (_bool) then {		//clicked on main, calculate S, V
[R, G, B, _ex, _y, _bool] call _fex_fn_hue;
} else {
[R, G, B, 1200] call _fex_fn_control;	//clicked on picker
[R, G, B] call _fex_fn_paintCar;
};

};

//display resulting color in the dialog
_fex_fn_control = {
_r = (_this select 0);		//red
_g = (_this select 1);		//green
_b = (_this select 2);		//blue
_n = (_this select 3);		//n of control
disableSerialization;
_control = (findDisplay 1001) displayCtrl _n;
_control ctrlSetBackgroundColor [_r,_g,_b,1];
_control ctrlSetActiveColor [_r,_g,_b,1];
_control ctrlCommit 0;
};

//paint the car (and the sign behind)
_fex_fn_paintCar = {
_r = (_this select 0);		//red
_g = (_this select 1);		//green
_b = (_this select 2);		//blue
_txt = format ["#(rgb,8,8,3)color(%1,%2,%3,1,CA)", _r, _g, _b];
car setObjectTexture [0, _txt];
sign setObjectTexture [0, _txt];
};

//obtain X, Y, W, H of a control
_fex_fn_obtainXW = {
_n = _this select 0;
disableSerialization;
_control = (findDisplay 1001) displayCtrl _n;
_returnArray = ctrlPosition _control;
_returnArray;
};


//calculate final color
_fex_fn_hue = {
_R = _this select 0;
_G = _this select 1;
_B = _this select 2;
_ex = _this select 3;		//x coordinate
_y = _this select 4;		//y coordinate
//systemChat format ["%1, %2, %3", _R, _G, _B];


_value = ((_ex - zoneMainX) / zoneMainW);
if (_value < 0) then {_value = 0;};
if (_value > 1) then {_value = 1;};

_saturation = 1 + ((-_y +zoneMainY) / (zoneMainH - zoneMainY));
if (_saturation < 0) then {_saturation = 0;};
if (_saturation > 1) then {_saturation = 1;};

//systemChat format ["%1, %2", _saturation, _value];
//https://en.wikipedia.org/wiki/RGB_color_model
//calculate hue from link above to get HSL model

_max = selectMax [_R, _G, _B];
_min = selectMin [_R, _G, _B];
_H = 0;
//calculate Hue
if (_max - _min == 0) then {
_max = _min + 0.05;
};
if (_R >= _G && _R >= _B) then {
_H = (_G - _B)%6 / (_max - _min);
};
if (_G >= _R && _G >= _B) then {
_H = 2 + (_B - _R) / (_max - _min);
};
if (_B >= _R && _B >= _G) then {
_H = 4 + (_R - _G) / (_max - _min);
};
_H = _H * 60;
while {_H < 0} do {
_H = _H + 360;
};



_chroma = _value * _saturation;
_newR = 0;
_newG = 0;
_newB = 0;
_temp = _chroma * (1 - abs(((_H / 60) % 2) - 1));
_nH = _H / 60;
if (0 <= _nH && _nH <= 1) then {
	_newR = _chroma; _newG = _temp; _newB = 0;
};
if (1 <= _nH && _nH <= 2) then {
	_newR = _temp; _newG = _chroma; _newB = 0;
};
if (2 <= _nH && _nH <= 3) then {
	_newR = 0; _newG = _chroma; _newB = _temp;
};
if (3 <= _nH && _nH <= 4) then {
	_newR = 0; _newG = _temp; _newB = _chroma;
};
if (4 <= _nH && _nH <= 5) then {
	_newR = _temp; _newG = 0; _newB = _chroma;
};
if (5 <= _nH && _nH <= 6) then {
	_newR = _chroma; _newG = 0; _newB = _temp;
};
_addition = _value - (_chroma);
_newR = _newR + _addition;
_newG = _newG + _addition;
_newB = _newB + _addition;
//systemChat format ["%1, %2, %3", _newR, _newG, _newB];
/*
_newR = _R;
_newG = _G;
_newB = _B;
*/
//systemChat format ["R: %1 G: %2 B: %3 ",_newR*255, _newG*255, _newB*255];
[_newR, _newG, _newB] call _fex_fn_paintCar;
};

//show the last selected color
_fex_fn_cursor = {
_ex = _this select 0;
_y = _this select 1;
_bool = _this select 2;
disableSerialization;
if (_bool) then {
_control = (findDisplay 1001) displayCtrl 1199;
_control ctrlSetPosition [_ex, _y];
_control ctrlCommit 0;
} else {
_control = (findDisplay 1001) displayCtrl 1198;
_control ctrlSetPosition [_ex, _y];
_control ctrlCommit 0;
};
};

//main
_y = (_this select 0) select 3;
_ex = (_this select 0) select 2;
_bool = _this select 1;
if (once) then {
_zoneMain = [1200] call _fex_fn_obtainXW;
_zonePicker = [1203] call _fex_fn_obtainXW;
zoneMainX = _zoneMain select 0;
zoneMainY = _zoneMain select 1;
zoneMainW = _zoneMain select 2;
zoneMainH = _zoneMain select 3;
zonePickerX = _zonePicker select 0;
zonePickerW = _zonePicker select 2;
once = false;
//systemChat format ["%1, %2, %3, %4", zoneMainX, zoneMainY, zoneMainW, zoneMainH];
};
[_ex, _y, _bool] call _fex_fn_cursor; 
[_y, _ex, _bool] call _fex_fn_calcMain;

