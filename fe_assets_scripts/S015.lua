Include("Common")

g_pid_lueur				= "PID_リュール"
g_pid_banditRing		= "PID_S015_異形兵_蛮族_指輪"
g_key_banditRing_dead	= "指輪蛮族_撃破_済"
g_key_recapture			= "指輪奪還_済"
g_key_phase				= "フェイズ調整_済"
g_key_active			= "ボス周辺行動開始"
g_key_activeCounter		= "ボス周辺行動開始カウンター"

-- -----------------------------------

function Startup()
	
	Log("Startup")
	
	変数登録()
	イベント登録()
	
	
	-- 勝利条件の設定
	if ( VariableGet( g_key_recapture ) == 0 ) then
		WinRuleSetEnemyNumberLessThanOrEqualTo(-1)
		WinRuleSetMID( "MID_RULE_S015_WIN" )
		LoseRuleSetMID( "MID_RULE_S015_LOSE" )
	end
	
	VariableSet( "G_置換_MIID_H_PromiseRing",	1 )
	
end

function Cleanup()
	
	Log("Cleanup")
	
	VariableSet( "G_置換_MIID_H_PromiseRing",	0 )
	
end

-- -----------------------------------

function Opening()
	
	Log("Opening")
	
	FadeInAndWait( FADE_NORMAL )
	PuppetDemo("S015", "MID_OP1")
	FadeOutAndWait( FADE_NORMAL )
	
end

function MapOpening()
	
	Log("MapOpening")
	
end

-- -----------------------------------

function 変数登録()
	
	VariableEntry( g_key_banditRing_dead, 0 )
	VariableEntry( g_key_recapture, 0 )
	VariableEntry( g_key_phase, 0 )
	VariableEntry( g_key_active, 0 )
	VariableEntry( g_key_activeCounter, 2 )
	
end

function イベント登録()
	
	EventEntryTurn(勝利条件, 1, 1, FORCE_PLAYER)
	
	EventEntryDie(EmptyFunction, g_pid_banditRing, FORCE_ENEMY, g_key_banditRing_dead)
	
	-- ==================================
	-- 敵から攻撃させて撃破
	EventEntryBattleAfter(指輪奪還, g_pid_banditRing, FORCE_ENEMY, "", FORCE_PLAYER, false, condition_指輪奪還)
	
	-- ----------------------------------
	-- 味方から攻撃して撃破
	EventEntryBattleAfter(VariableSet, "", FORCE_PLAYER, g_pid_banditRing, FORCE_ENEMY, false, condition_強制敵フェイズ終了, "行動後フェイズ終了", 1)
	EventEntryFixed(指輪奪還, "", FORCE_PLAYER, condition_指輪奪還)
	
	-- ----------------------------------
	-- アイクの覇克・天空で撃破
	EventEntryTurnAfter(指輪奪還_フェイズ処理なし, -1, -1, FORCE_PLAYER, condition_指輪奪還)
	
	-- ==================================
	
	EventEntryEscape(指輪持ち逃げ, 13, 27, g_pid_banditRing, condition_指輪持ち逃げ)
	EventEntryEscape(指輪持ち逃げ, 14, 27, g_pid_banditRing, condition_指輪持ち逃げ)
	EventEntryEscape(指輪持ち逃げ, 15, 27, g_pid_banditRing, condition_指輪持ち逃げ)
	
	EventEntryTurn(フェイズ調整, -1, -1, FORCE_PLAYER, condition_フェイズ調整)
	
	EventEntryTurn(VariableSet, -1, -1, FORCE_ENEMY, condition_ボス周辺行動開始カウンター, g_key_active, 1)
	
	EventEntryBattleTalk(Talk, "",			FORCE_PLAYER, "PID_S015_異形兵_蛮族_指輪",	FORCE_ENEMY, true, "戦闘前会話_指輪蛮族_済",		"MID_EV2")
	EventEntryBattleTalk(Talk, g_pid_lueur,	FORCE_PLAYER, "PID_S015_異形兵_ボス",		FORCE_ENEMY, true, "戦闘前会話_ボス_リュール_済",	"MID_BT2")
	EventEntryBattleTalk(Talk, "",			FORCE_PLAYER, "PID_S015_異形兵_ボス",		FORCE_ENEMY, true, "戦闘前会話_ボス_済",			"MID_BT1")
	
	EventEntryDie(Talk, "PID_S015_異形兵_ボス", FORCE_ENEMY, "死亡会話_ボス_済", "MID_BT3")
	
end

-- -----------------------------------

function EmptyFunction()
end

-- -----------------------------------

function condition_強制敵フェイズ終了()
	
	if VariableGet( g_key_banditRing_dead ) == 1 then 
		return true
	end
	
end

-- -----------------------------------

function condition_指輪奪還()
	
	if VariableGet( g_key_recapture ) == 1 then
		return false
	end
	
	if VariableGet( g_key_banditRing_dead ) == 1 then
		return true
	end
	
	return false
	
end

function 指輪奪還()
	
	指輪奪還_フェイズ処理なし()
	
	VariableSet( "敵軍フェイズスキップ", 1 )
	VariableSet( "行動後フェイズ終了", 1 )
	
end

function 指輪奪還_フェイズ処理なし()
	
	local _x = CursorGetX()
	local _z = CursorGetZ()
		
		Dialog( "MID_TUT_NAVI_S015_GET" )
		
		CursorSetPos( 5, 22 )
		MapCameraWait()
		Dispos( "Reinforcement1_1", DISPOS_FLAG_NONE )
		Yield()
		WaitTime(0.5)
		
		CursorSetPos( 23, 22 )
		MapCameraWait()
		Dispos( "Reinforcement1_2", DISPOS_FLAG_NONE )
		Yield()
		WaitTime(0.5)
		
		Dispos( "Reinforcement1_3", DISPOS_FLAG_FOCUS )
		Yield()
		WaitTime(0.5)
		
		Talk( "MID_EV1" )
		
		CursorSetPos_FromPid( g_pid_lueur )
		MapCameraWait()
		
		WinRuleSetEnemyNumberLessThanOrEqualTo(0)
		WinRuleSetMID( "MID_RULE_ANNIHILATE" )
		LoseRuleSetMID( "MID_RULE_COMMON_LOSE" )
		WinRule()
		
	CursorSetPos( _x, _z )
	MapCameraWait()
	
	VariableSet( g_key_recapture, 1 )
	
end
-- -----------------------------------

function condition_フェイズ調整()
	
	if VariableGet( g_key_phase ) == 1 then
		return false
	end
	
	if VariableGet( g_key_recapture ) == 1 then
		return true
	end
	
	return false
	
end

function フェイズ調整()
	
	VariableSet( "行動後フェイズ終了", 0 )
	VariableSet( "敵軍フェイズスキップ", 0 )
	
	VariableSet( g_key_phase, 1 )
	
end

-- -----------------------------------

function condition_ボス周辺行動開始カウンター()
	
	if DifficultyGet() == DIFFICULTY_NORMAL then
		return false
	end
	
	if VariableGet( g_key_active ) == 1 then
		return false
	end
	
	if VariableGet( g_key_phase ) == 0 then
		return false
	end
	
	local counter = VariableGet( g_key_activeCounter )
	if counter <= 0 then
		return true
	end
	
	counter = counter - 1
	VariableSet( g_key_activeCounter, counter )
	
end

-- -----------------------------------

function condition_指輪持ち逃げ()
	if VariableGet( g_key_recapture ) == 1 then
		return false
	end
	
	return true
end

function 指輪持ち逃げ()
	Talk( "MID_EV3" )
	VariableSet( "敗北", 1 )
end

-- -----------------------------------

function MapEnding()
	
	Log("MapEnding")
	
end

function Ending()
	
	Log("Ending")
	
	VariableSet( "G_置換_MIID_H_PromiseRing",	0 )
	
	FadeInAndWait( FADE_NORMAL )
		PuppetDemo("S015", "MID_ED1")
		Tutorial( "TUTID_約束の指輪" )
		Dialog( "MID_TUT_NAVI_S015_ENGAGERING" )
		UnitReliancePermitAPlus()
	FadeOutAndWait( FADE_NORMAL )
	
end

function GameOver()
	
	Log("GameOver")
	
end
