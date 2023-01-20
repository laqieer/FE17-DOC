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
	
	PuppetDemo("M003", "MID_ED4")
	
end

function MapOpening()
	
	Log("MapOpening")
	
	-- シグルド加入
	GodUnitCreate("GID_シグルド")

end

function MapEnding()
	
	Log("MapEnding")
	
end

function Ending()
	
	Log("Ending")
	
	PuppetDemo("M003", "MID_ED5")
	PuppetDemo("M003", "MID_ED6")
end

