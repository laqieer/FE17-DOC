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

function MapOpening()
	Log("MapOpening")


	if ExistRareEnemy() then
		Log("レア敵が発生しています");

		index = ForceUnitGetFirst(FORCE_ENEMY)
		while index != nil do
			if UnitGetPID(index) == "PID_遭遇戦_レア経験値"	then
				AiSetSequence(index, AI_ORDER_MIND, "AI_MI_Escape","pos(10,1)")
				AiSetSequence(index, AI_ORDER_ATTACK, "AI_AT_Null")
				AiSetSequence(index, AI_ORDER_MOVE, "AI_MV_Escape","pos(10,1)")
			end
			if UnitGetPID(index) == "PID_遭遇戦_レアお金"	then
				AiSetSequence(index, AI_ORDER_MIND, "AI_MI_Escape","pos(10,1)")
				AiSetSequence(index, AI_ORDER_ATTACK, "AI_AT_Null")
				AiSetSequence(index, AI_ORDER_MOVE, "AI_MV_Escape","pos(10,1)")
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