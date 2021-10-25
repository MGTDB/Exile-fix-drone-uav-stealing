# Exile fix drone/uav stealing
Small script to stop drone and uav stealing by players on same side

Client


Add contents of initPlayerLocal to your file of the same name or create the file if you don't have it
Pull ExileClient_object_player_initialize from Exile client files and add the line at the bottom before the final true in the custom folder

Add the class CfgExileCustomCode in the config.cpp

Pack mission file

************************************************************************************

Server


In Exile server files you will have to change the following:-

in ExileServer_system_trading_network_purchaseVehicleRequest.sqf change

_vehicleObject setVariable ["ExileOwnerUID", (getPlayerUID _playerObject)];

to

_vehicleObject setVariable ["ExileOwnerUID", (getPlayerUID _playerObject), true];

in ExileServer_object_vehicle_database_load.sqf change

_vehicleObject setVariable ["ExileOwnerUID", (_data select 3)];

to

_vehicleObject setVariable ["ExileOwnerUID", (_data select 3), true];

************************************************************************************

Note, if you use Exile's built in virtual garage you will need to change ExileServer_object_vehicle_database_loadFromVirtualGarage.sqf

_vehicleObject setVariable ["ExileOwnerUID", (_data select 3)];

to

_vehicleObject setVariable ["ExileOwnerUID", (_data select 3), true];

Note 2, check all your server files for where vehicles have ExileOwnerUID set on them as a variable as you will need to make them global by adding ",true" to them as above.
MarXet, Stokes lone wolf garage, claim vehicles etc