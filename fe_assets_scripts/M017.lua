Include("Common")
Include("Common_E")

g_pid_lueur = "PID_リュール"
g_key_runaways = "暴走_初回"


-- -----------------------------------

function Startup()
	
	Log("Startup")
	
	-- 勝利条件設定：敵将撃破
	WinRuleSetDestroyBoss(true)
	WinRuleSetMID( "MID_RULE_M017_WIN" )
	
	変数登録()
	イベント登録()
	
end

-- -----------------------------------

function 変数登録()
	
	VariableEntry( "増援_戦闘後増援_済", 0 )
	VariableEntry( g_key_runaways, 0 )
	
	E_BattleTalk_VariableEntry()
	
end

function イベント登録()
	EventEntryTurn(勝利条件, 1, 1, FORCE_PLAYER)
	
	-- 増援戦闘後イベント
	EventEntryBattleAfter(EmptyFunction, "", FORCE_PLAYER, "PID_M017_セピア", FORCE_ENEMY, true, "戦闘後イベント_済")
	
	-- ヴェイル
	EventEntryBattleTalk(Talk, g_pid_lueur, FORCE_PLAYER, "PID_M017_ヴェイル", FORCE_ENEMY, true, "戦闘前会話_ヴェイル_リュール_済", "MID_BT1")
	EventEntryBattleTalk(Talk, "", FORCE_PLAYER, "PID_M017_ヴェイル", FORCE_ENEMY, true, "戦闘前会話_ヴェイル_済", "MID_BT2")
	EventEntryReviveBefore(	ヴェイル暴走前, "PID_M017_ヴェイル", FORCE_ENEMY, "ヴェイル暴走前_済" )
	EventEntryReviveAfter(	ヴェイル暴走後, "PID_M017_ヴェイル", FORCE_ENEMY, "ヴェイル暴走後_済" )
	EventEntryDie(Talk, "PID_M017_ヴェイル", FORCE_ENEMY, condition_true, "MID_BT3")
	
	-- セピア
	E_BattleTalkEntry_Sepia( "PID_M017_セピア" )
	EventEntryBattleTalk(Talk, "", FORCE_PLAYER, "PID_M017_セピア", FORCE_ENEMY, true, "戦闘前会話_セピア_済", "MID_BT4")
	EventEntryReviveBefore(	セピア暴走前, "PID_M017_セピア", FORCE_ENEMY, "セピア暴走前_済" )
	EventEntryReviveAfter(	セピア暴走後, "PID_M017_セピア", FORCE_ENEMY, "セピア暴走後_済" )
	EventEntryDie(Talk, "PID_M017_セピア", FORCE_ENEMY, condition_true, "MID_BT5")
	
	-- グリ
	E_BattleTalkEntry_Gris( "PID_M017_グリ" )
	EventEntryBattleTalk(Talk, "", FORCE_PLAYER, "PID_M017_グリ", FORCE_ENEMY, true, "戦闘前会話_グリ_済", "MID_BT6")
	EventEntryDie(Talk, "PID_M017_グリ", FORCE_ENEMY, condition_true, "MID_BT7")
	
	-- マロン
	E_BattleTalkEntry_Marron( "PID_M017_マロン" )
	EventEntryBattleTalk(Talk, "", FORCE_PLAYER, "PID_M017_マロン", FORCE_ENEMY, true, "戦闘前会話_マロン_済", "MID_BT8")
	EventEntryDie(Talk, "PID_M017_マロン", FORCE_ENEMY, condition_true, "MID_BT9")
	
	-- モーヴ
	EventEntryBattleTalk(Talk, "", FORCE_PLAYER, "PID_M017_モーヴ", FORCE_ENEMY, true, "戦闘前会話_モーヴ_済", "MID_BT10")
	EventEntryDie(Talk, "PID_M017_モーヴ", FORCE_ENEMY, condition_true, "MID_BT11")
	
	-- ハイアシンス
	EventEntryBattleTalk(Talk, "PID_アイビー",		FORCE_PLAYER, "PID_M017_異形兵_ハイアシンス", FORCE_ENEMY, true, "戦闘前会話_ハイアシンス_アイビー_済",		"MID_BT12")
	EventEntryBattleTalk(Talk, "PID_オルテンシア",	FORCE_PLAYER, "PID_M017_異形兵_ハイアシンス", FORCE_ENEMY, true, "戦闘前会話_ハイアシンス_オルテンシア_済",	"MID_BT13")
	EventEntryBattleTalk(Talk, "",					FORCE_PLAYER, "PID_M017_異形兵_ハイアシンス", FORCE_ENEMY, true, "戦闘前会話_ハイアシンス_済",				"MID_BT14")
	EventEntryReviveBefore(	ハイアシンス暴走前, "PID_M017_異形兵_ハイアシンス", FORCE_ENEMY, "ハイアシンス暴走前_済" )
	EventEntryReviveAfter(	ハイアシンス暴走後, "PID_M017_異形兵_ハイアシンス", FORCE_ENEMY, "ハイアシンス暴走後_済" )
	EventEntryDie(Talk, "PID_M017_異形兵_ハイアシンス", FORCE_ENEMY, condition_true, "MID_BT15")
	
	-- 戦闘後AI変更_グリ
	EventEntryBattleAfter(グリ_AI変更, "PID_M017_グリ", FORCE_ENEMY, "", FORCE_PLAYER, false)
	
	-- 戦闘後AI変更_マロン
	EventEntryBattleAfter(マロン_AI変更, "PID_M017_マロン", FORCE_ENEMY, "", FORCE_PLAYER, false)
	
	-- 戦闘後AI変更_異形兵_ハイアシンス
	EventEntryBattleAfter(異形兵_ハイアシンス_AI変更, "PID_M017_異形兵_ハイアシンス", FORCE_ENEMY, "", FORCE_PLAYER, false)
	
	-- 戦闘後AI変更_ヴェイル
	EventEntryBattleAfter(ヴェイル_AI変更, "PID_M017_ヴェイル", FORCE_ENEMY, "", FORCE_PLAYER, false)
end

-- -----------------------------------

function Cleanup()
	
	Log("Cleanup")
	
end

-- -----------------------------------

function Opening()
	
	Log("Opening")
	
	PuppetDemo("M017", "MID_OP1")

	Movie("Scene19")
	SkipEscape()

	PuppetDemo("M017", "MID_OP2")

	Movie("Scene20")
	SkipEscape()
end

function MapOpening()
	
	Log("MapOpening")
	
	FadeWait()
	
	CursorSetPos_FromPid( "PID_M017_異形兵_ハイアシンス" )
	
	Talk("MID_EV1")
	
	CursorSetPos_FromPid( g_pid_lueur )
	
end

-- -----------------------------------

function EmptyFunction()
	-- なにも処理しない
	-- 空のイベント関数
end

function グリ_AI変更()

	-- AIを変更
	AiSetSequence("PID_M017_グリ", AI_ORDER_ATTACK, "AI_AT_Attack")
	
end

function マロン_AI変更()

	-- AIを変更
	AiSetSequence("PID_M017_マロン", AI_ORDER_ATTACK, "AI_AT_Attack")
	
end

function 異形兵_ハイアシンス_AI変更()

	-- AIを変更
	AiSetSequence("PID_M017_異形兵_ハイアシンス", AI_ORDER_ATTACK, "AI_AT_Attack")
	
end

function ヴェイル_AI変更()

	-- AIを変更
	AiSetSequence("PID_M017_ヴェイル", AI_ORDER_ATTACK, "AI_AT_Attack")
	
end

function condition_戦闘後増援()
	
	-- 既にこのイベントが処理されていたらfalse
	if VariableGet( "増援_戦闘後増援_済" ) == 1 then
		return false
	end
	
	-- 戦闘したかチェック
	if VariableGet( "戦闘後イベント_済" ) == 1 then
		return true
	end
	
	return false
	
end

function 青軍ターン開始直前1()
	
	-- 増援
	Dispos("Reinforcement1_1", DISPOS_FLAG_FOCUS)
	Yield()
	
	CursorSetPos( 2, 16 )
	WaitTime(0.5)
	
	-- 増援
	Dispos("Reinforcement1_2", DISPOS_FLAG_FOCUS)
	Yield()
	
	CursorSetPos( 16, 16 )
	WaitTime(0.5)
	
	-- 再びこのイベントが再生されないように、実行済みフラグを立てておく
	VariableSet( "増援_戦闘後増援_済", 1 )
	
end

function ヴェイル暴走前()
	CursorSetPos_FromPid( "PID_M017_ヴェイル" )
	Talk("MID_EV2")
end

function ヴェイル暴走後()
	Talk("MID_EV3")
	初回暴走イベント()
end

function セピア暴走前()
	CursorSetPos_FromPid( "PID_M017_セピア" )
	Talk("MID_EV4")
end

function セピア暴走後()
	Talk("MID_EV5")
	初回暴走イベント()
end

function ハイアシンス暴走前()
	CursorSetPos_FromPid( "PID_M017_異形兵_ハイアシンス" )
	Talk("MID_EV6")
end

function ハイアシンス暴走後()
	Talk("MID_EV7")
	初回暴走イベント()
end

function 初回暴走イベント()
	
	if VariableGet( g_key_runaways ) == 0 then
		
		Talk( "MID_EV8" )
		
		VariableSet( g_key_runaways, 1 )
	end
	
end

-- -----------------------------------

function MapEnding()
	
	Log("MapEnding")
	
end

function Ending()
	
	Log("Ending")
	
end

function GameOver()
	
	Log("GameOver")
	
end
