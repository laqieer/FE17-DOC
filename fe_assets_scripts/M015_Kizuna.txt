Include("Common")
Include("Hub_Common")

-- -----------------------------------

function Startup()
	
	Log("Startup")
	
end

function Cleanup()
	
	Log("Cleanup")
	
end

-- -----------------------------------

function Opening()
	
	Log("Opening")
	
	PuppetDemo("M015", "MID_ED1")
	
end

function MapOpening()
	
	Log("MapOpening")
	
end

function MapEnding()
	
	Log("MapEnding")
	
end

function Ending()
	
	Log("Ending")
	
	PuppetDemo("M015", "MID_ED2")
	
end

function GameOver()
	
	Log("GameOver")
	
end