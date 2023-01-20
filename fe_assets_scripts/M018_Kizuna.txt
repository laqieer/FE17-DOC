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
	
	PuppetDemo("M018", "MID_ED1")
	PuppetDemo("M018", "MID_ED2")
end

function GameOver()
	
	Log("GameOver");
	
end

function CanLocateLinden()

	-- 仲間になっていて、死亡もしていないなら配置できる
	if (UnitIsExist("PID_リンデン") and VariableGet("S_リンデン_死亡_済") == 0) then
		return true;
	end

	return false;

end

