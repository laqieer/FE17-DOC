Include("Common")

-- -----------------------------------

function Startup()
	
	Log("Startup");
	
	EventEntryTurn(勝利条件, 1, 1, FORCE_PLAYER)
	
end

function Cleanup()
	
	Log("Cleanup");
	
end

-- -----------------------------------

function Opening()
	
	Log("Opening");
	
end

function MapOpening()
	
	Log("MapOpening");
	
end

function MapEnding()
	
	Log("MapEnding");
	
end

function Ending()
	
	Log("Ending");
	
end

function GameOver()
	
	Log("GameOver");
	
end