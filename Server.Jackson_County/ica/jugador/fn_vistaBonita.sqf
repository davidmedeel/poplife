
/*
por: Icaruk
	[true] spawn ica_fnc_vistaBonita;
	[false] spawn ica_fnc_vistaBonita;
	[false, false] spawn ica_fnc_vistaBonita; // elimina cámara y efectos
*/

private ["_array", "_pos", "_dir", "_incl"];

_param = _this select 0;


if (_param) then {
	_array = [
		[[8001.82,5785.68,73.9253], 29.6749, 0.75], //Lake desde faro 
		[[8075.8,6566.47,4.10714], 92.2143, 0.75], //Lake desde montaña
		[[9050.36,8513.93,159.812], 3.22963, 0.75], //Aeropuerto lake
		[[6643.27,3758.27,77.7888], 6.78668, 0.75], //Morrison desde atrás
		[[3958.67,6471.2,17.2381], 50.4029, 0.75], //Juzgados Alcampo
		[[3641.44,7488.34,19.2295], 303.868, 0.75] //Diablos principal road 
		/*[[14001.4,11282.7,28.8593], 315, -19], 
		[[8969.7,14853,12.4713], 85, -0.2],
		[[12474.8,6974.91,40.3765], 17, -25], 
		[[11071.8,7495.68,0], 301, 10], 
		[[10042.6,6405.77,4.79684], 240, -18],
		[[10645.8,4614.96,34.3392], 4, -24]*/
		
	] call BIS_fnc_selectRandom;
} else {
	_array = [
		[[8195.73,4384.03,47.1214], 338.988,0.75],//molinos lakeside
		[[9781.71,9129.17,60.2698],264.147,0.75]//aeropuerto atras
	] call BIS_fnc_selectRandom;
};

if (!isNil {_this select 1}) exitWith {camaraInicial cameraEffect ['TERMINATE', 'BACK']; camaraInicial = nil; ppEffectDestroy borrInicial; borrInicial = nil};

_pos = _array select 0;
_dir = _array select 1;
_incl = _array select 2;

camaraInicial = "camera" camCreate _pos;
camaraInicial setDir _dir;
[camaraInicial, _incl, 0] call BIS_fnc_setpitchbank;
camaraInicial cameraEffect ["INTERNAL", "BACK"];

if (((date select 3) >= 20) OR ((date select 3) < 5)) then {
	camUseNVG true; 
};

borrInicial = ppEffectCreate ["DynamicBlur", 450];
borrInicial ppEffectEnable true;
borrInicial ppEffectAdjust [1.5];  
borrInicial ppEffectCommit 0;



