player addEventHandler ["WeaponAssembled",{params ["_unit", "_staticWeapon"];clearItemCargoGlobal (_this select 1);(_this select 1) setVariable ["ExileOwnerUID", getPlayerUID player,true];}];
//Add above line before the final "true"
true