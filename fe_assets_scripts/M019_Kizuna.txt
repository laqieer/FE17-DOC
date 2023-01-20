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
	
	--[[
	-- ザフィーア生存
	if ( VariableGet( "S_死亡セリフ_ザフィーア_済" ) == 0 ) and ( not UnitIsExist( "PID_ザフィーア" ) ) then
		
		Dialog( "ザフィーア緑生存時、\n絆リザルトで話しかけると加入です" )
		
		Talk( "MID_TK1" )
		UnitJoin( "PID_ザフィーア" )
		
	end
	]]
	
end

function MapEnding()
	
	Log("MapEnding");
	
end

function Ending()
	
	Log("Ending");

	if ( VariableGet( "S_死亡セリフ_ザフィーア_済" ) == 0 ) and ( not UnitIsExist( "PID_ザフィーア" ) ) then

		PuppetDemo( "M019", "MID_TK1P" )
		Yield()
		UnitJoin( "PID_ザフィーア" )
		Yield()

	end

end

function GameOver()
	
	Log("GameOver");
	
end