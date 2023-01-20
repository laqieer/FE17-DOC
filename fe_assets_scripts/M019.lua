Include("Common")
Include("Common_E")

g_pid_lueur = "PID_リュール"
g_key_area = "モーヴアクティブ_済"

-- -----------------------------------

function Startup()
	
	Log("Startup");
	
	-- 勝利条件設定：敵将撃破
	WinRuleSetDestroyBoss(true)
	WinRuleSetMID( "MID_RULE_M019_WIN" )
	
	フラグ登録()
	イベント登録()
	
end

function Cleanup()
	
	Log("Cleanup");
	
end

function フラグ登録()
	
	VariableEntry(g_key_area, 0)
	
	E_BattleTalk_VariableEntry()
	
end


-- -----------------------------------

function イベント登録()
	EventEntryTurnAfter(青１ターン開始直後, 1, 1, FORCE_PLAYER);
	EventEntryTurn(勝利条件, 1, 1, FORCE_PLAYER)



	if DifficultyGet() == DIFFICULTY_NORMAL then
		EventEntryTurn(増援４, 6, 6, FORCE_PLAYER);
		EventEntryTurn(増援５, 4, 4, FORCE_PLAYER);
		EventEntryTurn(増援３,12,12, FORCE_PLAYER);

	elseif DifficultyGet() == DIFFICULTY_LUNATIC then
		EventEntryTurn(増援４, 4, 4, FORCE_PLAYER);
		EventEntryTurn(増援５, 3, 3, FORCE_PLAYER);
		EventEntryTurn(増援３,10,10, FORCE_PLAYER);
		EventEntryTurn(増援３,12,12, FORCE_PLAYER);

		EventEntryTurn(モーヴアクティブ化,14,14, FORCE_PLAYER);
	else
		EventEntryTurn(増援４, 4, 4, FORCE_PLAYER);
		EventEntryTurn(増援５, 3, 3, FORCE_PLAYER);
		EventEntryTurn(増援３,10,10, FORCE_PLAYER);
	end



	-- モーヴ
	EventEntryArea(モーヴアクティブ化, 9, 7, 24, 16, FORCE_PLAYER, g_key_area)

	
	-- 村訪問
	EventEntryVisit(村１訪問イベント, 10, 6,"村訪問１_済")
	EventEntryVisit(村２訪問イベント, 15, 20,"村訪問２_済")


	-- ザフィーア会話
	EventEntryTalk(ザフィーア会話, g_pid_lueur,			FORCE_PLAYER, "PID_ザフィーア", FORCE_ALLY, true, "ザフィーア会話_済",	"MID_TK1")
	EventEntryTalk(ザフィーア会話, "PID_ディアマンド",	FORCE_PLAYER, "PID_ザフィーア", FORCE_ALLY, true, "ザフィーア会話_済",	"MID_TK2")
	EventEntryTalk(ザフィーア会話, "PID_スタルーク",	FORCE_PLAYER, "PID_ザフィーア", FORCE_ALLY, true, "ザフィーア会話_済",	"MID_TK3")
	EventEntryDie(EmptyFunction, "PID_ザフィーア", FORCE_ALLY, "S_死亡セリフ_ザフィーア_済")
	
	-- マロン
	E_BattleTalkEntry_Marron( "PID_M019_マロン" )
	EventEntryBattleTalk(Talk, "", FORCE_PLAYER, "PID_M019_マロン", FORCE_ENEMY, true, "戦闘前会話_マロン_済", "MID_BT1");
	EventEntryDie(Talk, "PID_M019_マロン", FORCE_ENEMY, condition_true, "MID_BT3");
	EventEntryReviveAfter(	マロン暴走後, "PID_M019_マロン", FORCE_ENEMY, "マロン暴走後_済" )
	
	-- モーヴ
	EventEntryBattleTalk(Talk, "", FORCE_PLAYER, "PID_M019_モーヴ", FORCE_ENEMY, true, "戦闘前会話_モーヴ_済", "MID_BT4");
	EventEntryDie(Talk, "PID_M019_モーヴ", FORCE_ENEMY, condition_true, "MID_BT6");
	EventEntryReviveAfter(	モーヴ暴走後, "PID_M019_モーヴ", FORCE_ENEMY, "モーヴ暴走後_済" )

end

-- -----------------------------------

function Opening()
	
	Log("Opening");

	PuppetDemo("M019", "MID_OP1")
	PuppetDemo("M019", "MID_OP2")
end

function MapOpening()
	
	Log("MapOpening");
	
	CursorSetPos_FromPid( "PID_M019_マロン" )
	Talk("MID_OP3")
	UnitMovePos("PID_M019_マロン",	22 ,11, MOVE_FLAG_NONE)
	UnitMovePos("PID_M019_モーヴ",	15 ,11, MOVE_FLAG_NONE)
	UnitMoveWait()
	UnitRotation( "PID_M019_マロン", ROTATE_DOWN_LEFT )
	UnitMoveWait()
	--瘴気配置()
end

-- -----------------------------------

function EmptyFunction()
end

-- -----------------------------------

function 青１ターン開始直後()

	CursorAnimeCreate(2,11)
	Talk( "MID_EV4" )
	CursorAnimeDelete()

	CursorAnimeCreate_FromPid("PID_ザフィーア")
	Talk( "MID_EV1" )
	CursorAnimeDelete()
end

function ザフィーア会話( mid )
	Talk(mid)
	
	-- 緑軍→青軍
	pid = "PID_ザフィーア"
	if UnitExistOnMap( pid ) and ( UnitGetForce(pid) == FORCE_ALLY ) then
		UnitJoin( pid );
	end
end

-- -----------------------------------
function 増援３()
	
	Dispos( "Enemy_Reinforcement3", DISPOS_FLAG_FOCUS )
	Yield()
	WaitTime(0.5)
	
end
function 増援４()
	
	Dispos( "Enemy_Reinforcement4", DISPOS_FLAG_FOCUS )
	Yield()
	WaitTime(0.5)
	
end
function 増援５()
	
	Dispos( "Enemy_Reinforcement5", DISPOS_FLAG_FOCUS )
	Yield()
	WaitTime(0.5)
	
end

function モーヴアクティブ化()

	--	ここで何某か会話イベントして、エンゲージ技の設定とかする。
	--AiSetSequence("PID_オルテンシア", AI_ORDER_ATTACK, "AI_AT_EngageAttack")



	AiSetSequence("PID_M019_モーヴ", AI_ORDER_CAUSE, "AI_AC_Everytime")	--	AI_AC_InterferenceRange
	AiSetSequence("PID_M019_モーヴ", AI_ORDER_ATTACK, "AI_AT_RodRescue","1,1")
--	AiSetSequence("PID_M019_モーヴ", AI_ORDER_ATTACK, "AI_AT_Attack")	--	AI_AC_InterferenceRange
	UnitClearStatus("PID_M019_モーヴ", UNIT_STATUS_MOVE_NOT_ALLOW)

	VariableSet(g_key_area, 1)


	--Dispos( "Enemy_Reinforcement4", DISPOS_FLAG_FOCUS )
	--Yield()
	--WaitTime(0.5)

end

-- -----------------------------------

function モーヴ暴走後()
	CursorSetPos_FromPid( "PID_M019_モーヴ" )
	Yield()
	WaitTime(0.5)

--	Dialog("モーヴ暴走")
	Talk("MID_BT8");
	--Talk( "MID_EV1" )	--暴走
	UnitClearStatus("PID_M019_モーヴ", UNIT_STATUS_MOVE_NOT_ALLOW)
--	UnitSetItemEquip( "PID_M019_モーヴ", "IID_ミカヤ_セイニー" )
	--ItemGainSilent(string pid, string iid)
--	AiSetPriority("PID_モーヴ", 50)


--	AiSetPriority("PID_M014_マロン", 100)

	AiSetSequence("PID_M019_モーヴ", AI_ORDER_ATTACK, "AI_AT_RodRescue","1,1")

--	AiSetSequence("PID_M014_イルシオン兵_ブレイブヒーロー", AI_ORDER_CAUSE, "AI_AC_Everytime")
end

function マロン暴走後()
	CursorSetPos_FromPid( "PID_M019_マロン" )
	Yield()
	WaitTime(0.5)


--	Dialog("マロン暴走")
	Talk("MID_BT7");

	AiSetSequence( "PID_M019_マロン", AI_ORDER_ATTACK, "AI_AT_EngageAttack", "1, 1" )

	--Talk( "MID_EV1" )	--暴走
	UnitSetItemEquip( "PID_M019_マロン", "IID_ロイ_封印の剣" )
	--ItemGainSilent(string pid, string iid)
--	AiSetPriority("PID_モーヴ", 50)
	AiSetSequence("PID_M019_モーヴ", AI_ORDER_CAUSE, "AI_AC_Everytime")	--	AI_AC_InterferenceRange
	AiSetSequence("PID_M019_モーヴ", AI_ORDER_ATTACK, "AI_AT_RodRescue","1,1")
	VariableSet(g_key_area, 1)


--	AiSetPriority("PID_M014_マロン", 100)


--	AiSetSequence("PID_M014_イルシオン兵_ブレイブヒーロー", AI_ORDER_CAUSE, "AI_AC_Everytime")
end

-- ---------------------------------------------------------

function 村１訪問イベント()
	Talk("MID_EV2");

	Dispos( "Enemy_Reinforcement1", DISPOS_FLAG_FORCED )
	Yield()
	WaitTime(0.5)

end
function 村２訪問イベント()
	Talk("MID_EV3");

	Dispos( "Enemy_Reinforcement2", DISPOS_FLAG_FORCED )
	Yield()
	WaitTime(0.5)

end


-- -----------------------------------

function 瘴気配置()

	MapOverlapSetBegin()
	for i = 8 , 23 do
		for j = 1 , 22 do
			MapOverlapSet(i, j, "TID_瘴気_永続")
		end
	end
	MapOverlapSetEnd()
end

-- -----------------------------------

function MapEnding()
	
	Log("MapEnding");
	
	
end

function Ending()
	
	Log("Ending");
	
	-- 紋章士ロイと紋章士ミカヤの指輪が返ってきた
	GodUnitSetEscape("GID_ロイ",	false)
	GodUnitSetEscape("GID_ミカヤ",	false)
	
	PuppetDemo("M019", "MID_ED1")
	PuppetDemo("M019", "MID_ED2")
	
end

function GameOver()
	
	Log("GameOver");
	
end
