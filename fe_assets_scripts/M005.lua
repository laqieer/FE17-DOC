Include("Common")
g_pid_lueur = "PID_リュール"

g_key_trsr_active			= "エリアイベント_宝物庫前全アクティブ化_済"
g_key_pltn4_active			= "エリアイベント_ボス部屋手前全アクティブ化_済"

g_key_pltn4_action			= "小隊４_行動開始_済"
g_key_reinforcementCounter	= "増援出現カウンター"
g_key_reinforcement_appear	= "増援出現_済"
g_Key_bossActive_Lunatic	= "ボス行動開始"

g_key_destroyWall			= "壁破壊_済"

g_key_tutorial_hpstock = "チュートリアル_ＨＰストック_済"
g_key_tutorial_hpstock_permission = "チュートリアル_ＨＰストック_再生許可"

-- -----------------------------------

function Startup()
	
	Log("Startup")
	
	
	-- 勝利条件の設定
	WinRuleSetDestroyBoss( true )	-- 敵将撃破
	WinRuleSetMID( "MID_RULE_M005_WIN" )
	
	イベント登録()
	変数登録()
	
end

function イベント登録()
	
	EventEntryTurn(勝利条件_敵将フォーカス, 1, 1, FORCE_PLAYER, condition_true, "PID_M005_Irc_ボス" )
	
	-- 扉のチュートリアル
	EventEntryTurnAfter(扉チュートリアル, 1, 1, FORCE_PLAYER)
	
	
	-- 宝物庫前
	EventEntryTurn(盗賊_行動開始, 1, 1, FORCE_ENEMY)
	
	EventEntryTurn(宝物庫前AI変更_ソードファイター停止, 4, 4, FORCE_PLAYER, condition_ノーマルか)
	EventEntryTurn(宝物庫前AI変更_ソードファイター停止, 3, 3, FORCE_PLAYER, condition_ノーマル以上か)
	
	EventEntryTurn(宝物庫前AI変更_全アクティブ化, 5, 5, FORCE_ENEMY)
	
	EventEntryArea(エリア_宝物庫進入, 1, 14, 5, 25, FORCE_PLAYER, g_key_trsr_active)
	
	EventEntryTurnEnd( VariableSet, -1, -1, FORCE_ENEMY, condition_ボス行動開始, g_Key_bossActive_Lunatic, 1 )
	
	
	-- ボス部屋手前
	EventEntryArea(ボス部屋手前小隊アクティブ化, 8, 12, 18, 25, FORCE_PLAYER, g_key_pltn4_active)
	
	
	-- 増援
	EventEntryTurn(増援出現, -1, -1, FORCE_PLAYER, condition_増援出現)
	
	EventEntryBattleAfter(EmptyFunction, "", FORCE_PLAYER, "PID_M005_Irc_pltn4_ランスアーマー",		FORCE_ENEMY, true, g_key_pltn4_action)
	EventEntryBattleAfter(EmptyFunction, "", FORCE_PLAYER, "PID_M005_Irc_pltn4_アクスファイター",		FORCE_ENEMY, true, g_key_pltn4_action)
	EventEntryBattleAfter(EmptyFunction, "", FORCE_PLAYER, "PID_M005_Irc_pltn4_アーチャー",			FORCE_ENEMY, true, g_key_pltn4_action)
	EventEntryBattleAfter(EmptyFunction, "", FORCE_PLAYER, "PID_M005_Irc_pltn4_マージ",				FORCE_ENEMY, true, g_key_pltn4_action)
	
	
	-- ＨＰストックのチュートリアル
	EventEntryBattleAfter( VariableSet, "", FORCE_PLAYER, "PID_M005_Irc_ボス", FORCE_ENEMY, true, condition_チュートリアル_ＨＰストック_再生許可, g_key_tutorial_hpstock_permission, 1 )
	EventEntryFixed( チュートリアル_ＨＰストック, "", FORCE_ALL, condition_チュートリアル_ＨＰストック )
	
	
	-- ボス会話
	EventEntryBattleTalk(Talk, g_pid_lueur,			FORCE_PLAYER, "PID_M005_Irc_ボス", FORCE_ENEMY, true, "戦闘前会話_ボス_リュール_済", 		"MID_BT4")
	EventEntryBattleTalk(Talk, "PID_アルフレッド",	FORCE_PLAYER, "PID_M005_Irc_ボス", FORCE_ENEMY, true, "戦闘前会話_ボス_アルフレッド_済", 	"MID_BT2")
	EventEntryBattleTalk(Talk, "PID_セリーヌ",		FORCE_PLAYER, "PID_M005_Irc_ボス", FORCE_ENEMY, true, "戦闘前会話_ボス_セリーヌ_済", 		"MID_BT3")
	EventEntryBattleTalk(Talk, "",					FORCE_PLAYER, "PID_M005_Irc_ボス", FORCE_ENEMY, true, "戦闘前会話_ボス_済", 				"MID_BT1")
	EventEntryDie(Talk, "PID_M005_Irc_ボス", FORCE_ENEMY, condition_true, "MID_BT5")
	
	
	-- 宝箱
	EventEntryTbox(宝箱入手, 2, 23, "IID_アーマーキラー")
	EventEntryTbox(宝箱入手, 4, 24, "IID_アイスロック")
	
	
	-- 壊れる壁
	EventEntryDestroy(玉座左壁破壊, 6, 20, 7, 21)
	
	
end

-- -----------------------------------

function condition_チュートリアル_ＨＰストック_再生許可()
	if VariableGet( g_key_tutorial_hpstock ) == 1 then
		return false
	end
	
	if VariableGet( g_key_tutorial_hpstock_permission ) == 0 then
		return true
	end
	
	return false
end

function condition_チュートリアル_ＨＰストック()
	if VariableGet( g_key_tutorial_hpstock ) == 1 then
		return false
	end
	
	if VariableGet( g_key_tutorial_hpstock_permission ) == 1 then
		return true
	end
	
	return false
end

function チュートリアル_ＨＰストック()
	
	Talk( "MID_EV5" )
	
	Tutorial( "TUTID_HPストック" )
	-- Dialog( "MID_TUT_BMAP_HPSTOCK_0" )
	
	VariableSet( g_key_tutorial_hpstock, 1 )
end

-- -----------------------------------

function 変数登録()
	
	VariableEntry( g_key_reinforcement_appear, 0 )
	
	if モードはノーマル() or モードはハード() then
		VariableEntry( g_key_reinforcementCounter, 2 )
	else
		VariableEntry( g_key_reinforcementCounter, 1 )
	end
	
	VariableEntry( g_key_tutorial_hpstock, 0 )
	VariableEntry( g_key_tutorial_hpstock_permission, 0 )
	VariableEntry( g_Key_bossActive_Lunatic, 0 )
	VariableEntry( g_key_destroyWall, 0 )
	
end

function Cleanup()
	
	Log("Cleanup")
	
end

-- -----------------------------------

function Opening()
	
	Log("Opening")
	
	PuppetDemo("M005", "MID_OP1")
	
	Movie("Scene08")
	SkipEscape()
	
	PuppetDemo("M005", "MID_OP3")
	PuppetDemo("M005", "MID_OP4")
	
end

function MapOpening()
	
	Log("MapOpening")
	
	Talk("MID_OP5")
	
	CursorSetPos(13, 24)
	MapCameraWait()
	
	Talk("MID_OP6")
	
	-- セピア退場
	UnitMovePos("PID_セピア",	13, 25, MOVE_FLAG_ESCAPE)
	UnitMoveWait()
	if UnitExistOnMap("PID_セピア") then
		UnitDelete("PID_セピア")
	end
	
	WaitTime(0.5)
	
	-- ボス周辺整列
	UnitMovePos("PID_M005_Irc_ボス", 13, 24)
	UnitMovePosFromPos(11, 25, 12, 24)
	UnitMovePosFromPos(15, 25, 14, 24)
	UnitMoveWait()
	
	UnitRotation("PID_M005_Irc_ボス", ROTATE_DOWN)
	UnitRotation(UnitGetByPos(12, 24), ROTATE_DOWN)
	UnitRotation(UnitGetByPos(14, 24), ROTATE_DOWN)
	UnitMoveWait()
	
	WaitTime(0.5)
	
	CursorSetPos_FromPid( g_pid_lueur )
	
end

-- -----------------------------------

function 扉チュートリアル()
	
	MapCameraWait()
	
	-- 扉
	CursorSetPos(13, 11)
	MapCameraWait()
	
	CursorAnimeCreate( 12, 11, "W3H1" )
	Talk( "MID_EV1" )
	CursorAnimeDelete()
	
	Tutorial( "TUTID_扉" )
	
end

-- -----------------------------------

function condition_ノーマルか()
	
	if DifficultyGet() == DIFFICULTY_NORMAL then
		return true
	end
	
	return false
	
end

function condition_ノーマル以上か()
	
	if DifficultyGet() > DIFFICULTY_NORMAL then
		return true
	end
	
	return false
	
end

function 盗賊_行動開始()
	
	if not UnitExistOnMap( "PID_M005_シーフ" ) then
		return
	end
	
	
	CursorSetPos(3, 23)
	MapCameraWait()
	
	MapObjectCreate("Eff_Cursor01", "Effects/BMap/UI/Guide/Prefabs/Eff_Cursor_W1H1", 2, 23)
	MapObjectCreate("Eff_Cursor02", "Effects/BMap/UI/Guide/Prefabs/Eff_Cursor_W1H1", 4, 24)
	WaitTime( 2.0 )
	MapObjectDelete("Eff_Cursor01")
	MapObjectDelete("Eff_Cursor02")
	
	CursorSetPos_FromPid( "PID_M005_シーフ" )
	Talk("MID_EV2")
	
	CursorSetPos_FromPid( g_pid_lueur )
	Talk("MID_EV3")
	
	Tutorial( "TUTID_宝箱" )

end

-- -----------------------------------

function エリア_宝物庫進入()
	
	-- 破壊済みなら再生しない
	if VariableGet( "破壊_6_20" ) == 0 then
		
		-- 壊れる壁
		CursorSetPos(6, 21)
		MapCameraWait()
		
		MapObjectCreate("Eff_Cursor01", "Effects/BMap/UI/Guide/Prefabs/Eff_Cursor_W1H1", 6, 20)
		MapObjectCreate("Eff_Cursor02", "Effects/BMap/UI/Guide/Prefabs/Eff_Cursor_W1H1", 6, 21)
		MapObjectCreate("Eff_Cursor03", "Effects/BMap/UI/Guide/Prefabs/Eff_Cursor_W1H1", 7, 20)
		MapObjectCreate("Eff_Cursor04", "Effects/BMap/UI/Guide/Prefabs/Eff_Cursor_W1H1", 7, 21)
		WaitTime( 2.0 )
		MapObjectDelete("Eff_Cursor01")
		MapObjectDelete("Eff_Cursor02")
		MapObjectDelete("Eff_Cursor03")
		MapObjectDelete("Eff_Cursor04")
		
		CursorSetPos_FromPid( g_pid_lueur )
		Talk( "MID_EV4" )
		
		Tutorial( "TUTID_地形破壊" )
		
	end
	
	-- - - - - - - - - - - - - - - - - - - -
	
	宝物庫前AI変更_全アクティブ化()
	
end

function 宝物庫前AI変更_ソードファイター停止()
	
	local pid = "PID_M005_Irc_trsr_ソードファイター"
	if UnitExistOnMap( pid ) then
		
		local value = VariableGet( g_key_trsr_active )
		if value == 0 then
		
			宝物庫前ソードファイターAI変更()
			
			-- 再度非アクティブにする
			AiSetActiveAll(FORCE_ENEMY, pid, false)
			
		end
		
	end
end

function 宝物庫前AI変更_全アクティブ化()
	
	local pid = "PID_M005_Irc_trsr_ランスアーマー"
	if UnitExistOnMap( pid ) then
		AiSetActiveAll(FORCE_ENEMY, pid, true)
	end
	
	pid = "PID_M005_Irc_trsr_アクスファイター"
	if UnitExistOnMap( pid ) then
		AiSetActiveAll(FORCE_ENEMY, pid, true)
	end
	
	pid = "PID_M005_Irc_trsr_ソードファイター"
	if UnitExistOnMap( pid ) then
		宝物庫前ソードファイターAI変更()
		AiSetActiveAll(FORCE_ENEMY, pid, true)
	end
	
	pid = "PID_M005_Irc_trsr_アーチャー"
	if UnitExistOnMap( pid ) then
		AiSetActiveAll(FORCE_ENEMY, pid, true)
	end
	
end

function 宝物庫前ソードファイターAI変更()
	pid = "PID_M005_Irc_trsr_ソードファイター"
	if UnitExistOnMap( pid ) then
		AiSetSequence(pid, AI_ORDER_CAUSE, "AI_AC_TurnAttackRange", "5")
		AiSetSequence(pid, AI_ORDER_MOVE, "AI_MV_WeakEnemy")
	end
end

-- -----------------------------------

function 玉座左壁破壊()
	
	ボス部屋手前小隊アクティブ化()
	
	VariableSet( g_key_destroyWall, 1 )
end

-- -----------------------------------

function ボス部屋手前小隊アクティブ化()
	
	local pid = "PID_M005_Irc_pltn4_ランスアーマー"
	if UnitExistOnMap( pid ) then
		AiSetActiveAll(FORCE_ENEMY, pid, true)
	end
	
	pid = "PID_M005_Irc_pltn4_アクスファイター"
	if UnitExistOnMap( pid ) then
		AiSetActiveAll(FORCE_ENEMY, pid, true)
	end
	
	pid = "PID_M005_Irc_pltn4_アーチャー"
	if UnitExistOnMap( pid ) then
		AiSetActiveAll(FORCE_ENEMY, pid, true)
	end
	
	pid = "PID_M005_Irc_pltn4_マージ"
	if UnitExistOnMap( pid ) then
		AiSetActiveAll(FORCE_ENEMY, pid, true)
	end
	
end

-- -----------------------------------

function condition_増援出現()
	
	local value = VariableGet( g_key_reinforcement_appear )
	if value == 1 then
		return false
	end
	
	-- 小隊４と交戦開始していないし、壁破壊されていない
	if ( VariableGet( g_key_pltn4_action ) == 0 ) and ( VariableGet( g_key_destroyWall ) == 0 ) then
		return false
	end
	
	
	value = VariableGet( g_key_reinforcementCounter )
	value = value - 1
	VariableSet( g_key_reinforcementCounter, value )
	
	
	if value == 0 then
		return true
	else
		return false
	end
	
end

function 増援出現()
	
	Dispos( "Reinforcement1", DISPOS_FLAG_FOCUS )
	Yield()
	WaitTime( 0.5 )
	
	Dispos( "Reinforcement0", DISPOS_FLAG_FOCUS )
	Yield()
	WaitTime( 0.5 )
	
	VariableSet( g_key_reinforcement_appear, 1 )
	
end

function EmptyFunction()
end

-- -----------------------------------

function condition_ボス行動開始()
	
	if not モードはルナティック() then
		return false
	end
	
	if VariableGet( g_Key_bossActive_Lunatic ) == 1 then
		return false
	end
	
	-- １番小隊の人がアクティブになっているか
	local unit = ForceUnitGetFirst(FORCE_ENEMY)
	while unit != nil do
		
		if ( AiGetBandNo( unit ) == 1 ) and AiGetActive( unit ) then
			return true
		end
		
		unit = ForceUnitGetNext(unit)
	end
	
	return false
	
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