Include("Common")

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

function MapDispos()
	TerrainSet( 18,	19, "TID_床" )
	TerrainSet( 17,	18, "TID_床" )
	TerrainSet( 19,	17, "TID_床" )
	TerrainSet(  7,	14, "TID_床" )
	TerrainSet(  9,	15, "TID_床" )
	TerrainSet(  3,	 8, "TID_床" )
	TerrainSet(  4,	 9, "TID_床" )
	TerrainSet(  5,	 7, "TID_床" )
	TerrainSet( 15,	 7, "TID_床" )
	TerrainSet( 16,	 8, "TID_床" )
	TerrainSet( 17,	 7, "TID_床" )
end

function MapOpening()
	Log("MapOpening")


	if ExistRareEnemy() then
		Log("レア敵が発生しています");

		index = ForceUnitGetFirst(FORCE_ENEMY)
		while index != nil do
			if UnitGetPID(index) == "PID_遭遇戦_レア経験値"	then
				AiSetSequence(index, AI_ORDER_MIND, "AI_MI_Escape","pos(1,17)")
				AiSetSequence(index, AI_ORDER_ATTACK, "AI_AT_Null")
				AiSetSequence(index, AI_ORDER_MOVE, "AI_MV_Escape","pos(1,17)")
			end
			if UnitGetPID(index) == "PID_遭遇戦_レアお金"	then
				AiSetSequence(index, AI_ORDER_MIND, "AI_MI_Escape","pos(21,2)")
				AiSetSequence(index, AI_ORDER_ATTACK, "AI_AT_Null")
				AiSetSequence(index, AI_ORDER_MOVE, "AI_MV_Escape","pos(21,2)")
			end

			index = ForceUnitGetNext(index)
		end
	end


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