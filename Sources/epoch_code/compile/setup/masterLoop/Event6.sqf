_spawnChance = ((EPOCH_playerNuisance + EPOCH_playerSoiled)/2) max 1;
// add more antagonist spawn chances
if (random _antagonistRndChance < _spawnChance) then {
	// selectRandomWeighted arma 1.76 or higher
	(selectRandomWeighted _antagonistChances) call EPOCH_unitSpawnIncrease;
};
// diag_log format["DEBUG: _spawnChance %1",_spawnChance];

_spawnUnits = [];
{
	if (_x > 0) then{
		_spawnUnits pushBack(EPOCH_spawnIndex select _forEachIndex);
	};
} forEach EPOCH_playerSpawnArray;

// test spawning one antagonist every 10 minutes select one unit at random to spawn
if !(_spawnUnits isEqualTo[]) then{
	(selectRandom _spawnUnits) call EPOCH_unitSpawn;
};
