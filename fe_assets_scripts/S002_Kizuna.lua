Include("Common")
Include("Hub_Common")

g_key_anna_dead = "S_アンナ_死亡"

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
	
	PuppetDemo( "S002", "MID_ED1" )
	
	-- アンナが死んでいない
	-- または
	-- カジュアル味方撤退
	
	if	( VariableGet( g_key_anna_dead ) == 0 ) or
		( ( UnitIsExist( "PID_アンナ" ) )
			and ( VariableGet( g_key_anna_dead ) == 1 ) 
			and ( GameModeGet() == GAMEMODE_CASUAL ) ) then

		PuppetDemo( "S002", "MID_ED2" )
		
		if not UnitIsExist( "PID_アンナ" ) then
			
			UnitJoin( "PID_アンナ" )
			
		end
		
	else
		
		PuppetDemo( "S002", "MID_ED3" )
		
	end
	
end

function MapOpening()
	
	Log("MapOpening")
	
end

function MapEnding()
	
	Log("MapEnding")
	
end

function Ending()
	
	Log("Ending");
	
end

function GameOver()
	
	Log("GameOver");
	
end