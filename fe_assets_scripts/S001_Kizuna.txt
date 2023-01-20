Include("Common")

g_key_join_jean			= "S_ジャン加入会話_済"
g_key_villager_all_dead = "S_村人が全員死んだ"
g_key_villager_dead		= "S_村人が死んだ"
g_key_jean_dead			= "S_ジャン_死亡"

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
	
	-- ジャンが死んでいない
	-- または
	-- カジュアル味方撤退
	
	if	( VariableGet( g_key_jean_dead ) == 0 ) or
		( ( UnitIsExist( "PID_ジャン" ) )
			and ( VariableGet( g_key_join_jean ) == 1 ) 
			and ( GameModeGet() == GAMEMODE_CASUAL ) ) then

		PuppetDemo( "S001", "MID_ED4" )
		
		if not UnitIsExist( "PID_ジャン" ) then
			
			UnitJoin( "PID_ジャン" )
			
		end
		
	end
	
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