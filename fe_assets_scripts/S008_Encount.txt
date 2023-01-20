Include("Common")

-- -----------------------------------

function Startup()
	
	Log("Startup")


	if ExistRareEnemy() then
		Log("レア敵が発生しています");
		if MapIsSight() != true then
			MapSetSight(true)
		end
	else
		MapSetSight(false)
	end

end

function Cleanup()
	
	Log("Cleanup")
	
end

-- -----------------------------------

function Opening()
	
	Log("Opening")


end

function MapOpening()
	Log("MapO0pening")
	if ExistRareEnemy() then
		Log("レア敵が発生しています");

		index = ForceUnitGetFirst(FORCE_ENEMY)
		while index != nil do
			if UnitGetPID(index) == "PID_遭遇戦_レア経験値"	then
				AiSetSequence(index, AI_ORDER_MIND, "AI_MI_Escape","pos(11,1)")
				AiSetSequence(index, AI_ORDER_ATTACK, "AI_AT_Null")
				AiSetSequence(index, AI_ORDER_MOVE, "AI_MV_Escape","pos(11,1)")
			end
			if UnitGetPID(index) == "PID_遭遇戦_レアお金"	then
				AiSetSequence(index, AI_ORDER_MIND, "AI_MI_Escape","pos(11,1)")
				AiSetSequence(index, AI_ORDER_ATTACK, "AI_AT_Null")
				AiSetSequence(index, AI_ORDER_MOVE, "AI_MV_Escape","pos(11,1)")
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