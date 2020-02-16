/*
 police sender, open gates from inside the car (only for cops)
 by Insane
 Editado por Sergio Rex
 www.tdc-clan.eu
*/


//Puerta tipica de garaje policia
{
 if (_x animationPhase "GateDoor_3" == 5) then {
  _x animate ["GateDoor_3", 0];
 }
 else
 {
  _x animate ["GateDoor_3", 5];
 };
 } forEach (nearestObjects [player, ["Justiz_Einfahrt"], 10]);

 //Puerta tipica de garaje policia
{ 
 if (_x animationPhase "GateDoor_3" == 5) then { 
  _x animate ["GateDoor_3", 0]; 
 } 
 else 
 { 
  _x animate ["GateDoor_3", 5]; 
 }; 
 } forEach (nearestObjects [player, ["Land_Gate_C"], 10]);
 


// Puerta carcel
{
 if (_x animationPhase "Main_Door" == 12) then { 
  _x animate ["Main_Door", 0]; 
 } 
 else 
 { 
  _x animate ["Main_Door", 12]; 
 }; 
 } forEach (nearestObjects [player, ["Land_GatedoorA"], 10]);