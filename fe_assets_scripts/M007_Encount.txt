Include("Common")


-- -----------------------------------

emblem_effect = {

	{23, 13},
	{24, 13},
	{16, 14},
	{18, 14}

}

-- -----------------------------------

function Startup()
	
	Log("Startup")
--	紋章氣マスの登録( emblem_effect )

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

--	紋章氣エフェクトの配置( emblem_effect )

	if ExistRareEnemy() then
		Log("レア敵が発生しています");

		index = ForceUnitGetFirst(FORCE_ENEMY)
		while index != nil do
			if UnitGetPID(index) == "PID_遭遇戦_レア経験値"	then
				AiSetSequence(index, AI_ORDER_MIND, "AI_MI_Escape","pos(14,17)")
				AiSetSequence(index, AI_ORDER_ATTACK, "AI_AT_Null")
				AiSetSequence(index, AI_ORDER_MOVE, "AI_MV_Escape","pos(14,17)")
			end
			if UnitGetPID(index) == "PID_遭遇戦_レアお金"	then
				AiSetSequence(index, AI_ORDER_MIND, "AI_MI_Escape","pos(14,17)")
				AiSetSequence(index, AI_ORDER_ATTACK, "AI_AT_Null")
				AiSetSequence(index, AI_ORDER_MOVE, "AI_MV_Escape","pos(14,17)")
			end

			index = ForceUnitGetNext(index)
		end
	end

	飛行ユニットの０ダメージ攻撃を許可()

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