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
	
	PuppetDemo("M009", "MID_ED1")
	
end

function MapOpening()
	
	Log("MapOpening");
	
	--[[
	-- ジェーデ生存
	if ( VariableGet( "S_死亡セリフ_ジェーデ_済" ) == 0 ) and ( not UnitIsExist( "PID_ジェーデ" ) ) then
		
		Dialog( "ジェーデ緑生存時、\n絆リザルトで話しかけると加入です" )
		
		Talk( "MID_TK1" )
		UnitJoin( "PID_ジェーデ" )
		
	end
	]]
	
	Tutorial( "TUTID_紋章士リーフ" )
end

function MapEnding()
	
	Log("MapEnding");
	
end

function Ending()
	
	Log("Ending");

	-- ジェーデ生存
	if ( VariableGet( "S_死亡セリフ_ジェーデ_済" ) == 0 ) and ( not UnitIsExist( "PID_ジェーデ" ) ) then

		PuppetDemo( "M009", "MID_TK1P" )
		Yield()
		UnitJoin( "PID_ジェーデ" )
		Yield()

	end
	
	PuppetDemo("M009", "MID_ED2")
	
end

function GameOver()
	
	Log("GameOver");
	
end