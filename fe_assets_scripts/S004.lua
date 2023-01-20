Include("Common")
g_pid_lueur = "PID_リュール"

g_key_atk = "全突撃_済"

-- -----------------------------------

function Startup()
	
	Log("Startup")
	
	Startup_紋章士外伝_対象紋章士を一時的に無効化( "GID_リン" )
	
	-- 勝利条件の設定
	WinRuleSetDestroyBoss( true )	-- 敵将撃破
	WinRuleSetMID( "MID_RULE_S004_WIN" )
	
	変数登録()
	イベント登録()
	
end

-- -----------------------------------

function 変数登録()
	VariableEntry(g_key_atk, 0)
end

-- -----------------------------------

function イベント登録()
	EventEntryTurn(開始直後, 1, 1, FORCE_PLAYER)
	EventEntryTurn(勝利条件, 1, 1, FORCE_PLAYER)


	EventEntryTurn(リン移動開始予告, 7, 7, FORCE_PLAYER)
	EventEntryTurn(リン移動開始, 7, 7, FORCE_PLAYER)
--	if DifficultyGet() == DIFFICULTY_NORMAL then
--		EventEntryTurn(リン移動開始予告, 8, 8, FORCE_PLAYER)
--		EventEntryTurn(リン移動開始, 8, 8, FORCE_PLAYER)
--	else
--	end
	EventEntryTurn(増援, -1, -1, FORCE_PLAYER)


	EventEntryBattleTalk(Talk, "PID_S004_リン", FORCE_ENEMY, g_pid_lueur,			FORCE_PLAYER, true, "戦闘前会話_リン_リュール_済", "MID_BT1")
	EventEntryBattleTalk(Talk, "PID_S004_リン", FORCE_ENEMY, "PID_アイビー",	FORCE_PLAYER, true, "戦闘前会話_リン_アイビー_済", "MID_BT2")
	EventEntryBattleTalk(Talk, "PID_S004_リン", FORCE_ENEMY, "PID_オルテンシア",	FORCE_PLAYER, true, "戦闘前会話_リン_オルテンシア_済", "MID_BT3")
	
	EventEntryBattleBefore(リン攻撃, "PID_S004_リン", FORCE_ENEMY, "", FORCE_PLAYER, true, "戦闘前実行済み")

--	EventEntryBattleTalk(Talk, "PID_S004_リン", FORCE_ENEMY, "",	FORCE_ALL, true, "戦闘前会話_リン_済", "MID_BT1")
--	EventEntryBattleTalk(EmptyFunction, "PID_S004_リン", FORCE_ENEMY, "", FORCE_ALL, true, 全突撃)
--	EventEntryBattleTalk(Talk, "PID_S004_リン", FORCE_ENEMY, "",FORCE_ALL, true, "戦闘前会話_リン_済", "MID_BT1")
--	EventEntryTurn(増援２, -1, -1, FORCE_PLAYER, condition_増援２)
end

-- -----------------------------------

function Cleanup()
	
	Log("Cleanup")
	
	Cleanup_紋章士外伝_対象紋章士の無効化解除( "GID_リン" )
	
end

-- -----------------------------------

function Opening()
	
	Log("Opening")
	
	
	PuppetDemo("S004", "MID_OP1")
	
end

function MapOpening()
	
	Log("MapOpening")
	
end

function 開始直後()
	
	CursorAnimeCreate_FromPid("PID_S004_リン")
	Talk( "MID_EV1" )
	CursorAnimeDelete()
	
	CursorSetPos_FromPid( "PID_S004_幻影兵_トリオル" )
	CursorAnimeCreate( 16, 17, "W3H2" )
	
	Talk("MID_EV2")
	
	CursorAnimeDelete()
	
end

-- -----------------------------------

function リン移動開始予告()
	-- Dialog( "リン移動予告" )

	CursorAnimeCreate_FromPid("PID_S004_リン")
	Talk("MID_EV3")
	CursorAnimeDelete()
	
	AiSetSequence("PID_S004_リン", AI_ORDER_CAUSE, "AI_AC_Everytime")
end
function リン移動開始()
	UnitClearStatus("PID_S004_リン", UNIT_STATUS_MOVE_NOT_ALLOW)
	AiSetSequence("PID_S004_リン", AI_ORDER_ATTACK, "AI_AT_EngageVision", "2,2")
end


function EmptyFunction()
end

function 全突撃()

	if VariableGet( g_key_atk ) < 1 then
		-- Dialog( "全突撃" )
		VariableSet(g_key_atk, 1)
	--	Talk( "MID_BT1" )
	--	ここで何某か会話イベントして、エンゲージ技の設定とかする。
	--AiSetSequence("PID_オルテンシア", AI_ORDER_ATTACK, "AI_AT_EngageAttack")
	end


--	AiSetSequence("PID_オルテンシア", AI_ORDER_CAUSE, "AI_AC_Everytime")	--	AI_AC_InterferenceRange
--	AiSetSequence("PID_M014_セピア", AI_ORDER_CAUSE, "AI_AC_Everytime")
--	AiSetSequence("PID_M014_マロン", AI_ORDER_CAUSE, "AI_AC_Everytime")
--	AiSetSequence("PID_M014_モーヴ", AI_ORDER_CAUSE, "AI_AC_Everytime")

end


-- -----------------------------------


function リン攻撃()
	VariableSet(g_key_atk, 1)
end

-- -----------------------------------

function 増援()


	if VariableGet( g_key_atk ) == 1 then
		index = ForceUnitGetFirst(FORCE_ENEMY)
		while index != nil do
			AiSetSequence(index, AI_ORDER_CAUSE, "AI_AC_Everytime")
			UnitClearStatus(UnitGetPID(index), UNIT_STATUS_MOVE_NOT_ALLOW)
			index = ForceUnitGetNext(index)
		end
		if UnitExistOnMap("PID_S004_幻影兵_クドカ") then
			Dispos( "Enemy_Reinforcement1", DISPOS_FLAG_FOCUS )
			Yield()
			WaitTime(0.5)
		end
		if UnitExistOnMap("PID_S004_幻影兵_マラル") then
			Dispos( "Enemy_Reinforcement2", DISPOS_FLAG_FOCUS )
			Yield()
			WaitTime(0.5)
		end
		if UnitExistOnMap("PID_S004_幻影兵_トリオル") then
			Dispos( "Enemy_Reinforcement3", DISPOS_FLAG_FOCUS )
			Yield()
			WaitTime(0.5)
		end
		if UnitExistOnMap("PID_S004_幻影兵_ブラクル") then
			Dispos( "Enemy_Reinforcement4", DISPOS_FLAG_FOCUS )
			Yield()
			WaitTime(0.5)
		end
		if UnitExistOnMap("PID_S004_幻影兵_カブル") then
			Dispos( "Enemy_Reinforcement5", DISPOS_FLAG_FOCUS )
			Yield()
			WaitTime(0.5)
		end
		if UnitExistOnMap("PID_S004_幻影兵_チャン") then
			Dispos( "Enemy_Reinforcement6", DISPOS_FLAG_FOCUS )
			Yield()
			WaitTime(0.5)
		end
		-- Dialog( "突撃増援" )
		VariableSet(g_key_atk, 2)
	end
end

-- -----------------------------------

function MapEnding()
	
	Log("MapEnding")
	
end

function Ending()
	
	Log("Ending")
	
	PuppetDemo("S004", "MID_ED1")
	
	紋章士外伝_レベルキャップ開放( "リン", "S004" )
	
end

function GameOver()
	
	Log("GameOver")
	
end