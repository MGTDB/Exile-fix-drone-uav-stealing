_checkDrone =
{
	_uav = getConnectedUAV player;
	if (alive _uav) then
	{
		if !(simulationEnabled _uav) then
		{
			_uav enableSimulation true;
		};
		_ownerUID = _uav getVariable ["ExileOwnerUID",""];
		if !(getPlayerUID player == _ownerUID) then
		{
			player connectTerminalToUAV objNull;
		};
	};
};
[1,_checkDrone,[],true,false] call ExileClient_system_thread_addTask;