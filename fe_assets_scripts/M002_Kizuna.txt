Include("Common")
Include("Hub_Common")

g_pid_lueur = "PID_リュール"

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

	PuppetDemo("M002", "MID_ED1")

end

function MapOpening()
	
	Log("MapOpening")
	
	ItemGain( g_pid_lueur, "IID_リベラシオン" )

end

function MapEnding()
	
	Log("MapEnding")
	
end

function Ending()
	
	Log("Ending")
	
	PuppetDemo("M002", "MID_ED3")
	PuppetDemo("M002", "MID_ED4")
	
end

