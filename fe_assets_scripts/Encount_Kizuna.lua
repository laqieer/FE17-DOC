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
	
end

function MapOpening()
	
	Log("MapOpening")
	
end

function MapEnding()
	
	Log("MapEnding")

	CompleteEncountMap()
	
end

function Ending()
	
	Log("Ending")
	
end

