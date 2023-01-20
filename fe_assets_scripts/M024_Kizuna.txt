Include("Common")
Include("Hub_Common")

-- -----------------------------------

function Startup()
	
	Log("Startup");
	
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

	PuppetDemo("M024", "MID_ED1")
	PuppetDemo("M024", "MID_ED2")
	PuppetDemo("M024", "MID_ED3")
	PuppetDemo("M024", "MID_ED4")
end

function GameOver()
	
	Log("GameOver");
	
end