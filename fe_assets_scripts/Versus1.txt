Include("Common")

-- -----------------------------------

function Startup()
	Log("Startup")

	WinRuleSetLimitTurn(-10)
	LoseRuleSetMID( "MID_RULE_VERSUS_LOSE", 10 )
end

function Cleanup()
	Log("Cleanup")
end

function Opening()
	Log("Opening")
end

function MapOpening()
	Log("MapOpening")
end

function MapEnding()
	Log("MapEnding")
end

function Ending()
	Log("Ending")
end

function GameOver()
	Log("GameOver")
end


-- -----------------------------------
