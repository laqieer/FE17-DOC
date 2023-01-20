Include("Common")
g_pid_lueur					= "PID_リュール"
g_pid_boss					= "PID_M006_ボス"

g_key_tutorial_search		= "チュートリアル_索敵_済"
g_key_tutorial_michaiah		= "チュートリアル_ミカヤ_済"
g_key_engage_michaiah		= "戦闘後会話_ミカヤエンゲージ_済"
g_key_tutorial_shine		= "チュートリアル_シャイン_済"

g_key_fixed_boss			= "待機後_ボス_済"

g_key_ringBandit_Die		= "指輪持ち蛮族死亡_済"
g_key_Boss_Die				= "ボス死亡_済"

-- -----------------------------------

function Startup()
	
	Log("Startup")
	
	-- 勝利条件の設定
	-- ユナカが生存したまま、指輪の奪還と敵将撃破
	WinRuleSetEnemyNumberLessThanOrEqualTo(-1)
	WinRuleSetMID( "MID_RULE_M006_WIN" )
	LoseRuleSetMID( "MID_RULE_M006_LOSE" )
	
	変数登録()
	
	イベント登録()
	
end

-- -----------------------------------

function 変数登録()
	VariableEntry( g_key_tutorial_search, 0 )
	VariableEntry( g_key_tutorial_michaiah, 0 )
	VariableEntry( g_key_tutorial_shine, 0 )
	VariableEntry( g_key_fixed_boss, 0 )
	VariableEntry( g_key_engage_michaiah, 0 )
end

function イベント登録()
	
	EventEntryTurn(進撃開始直後イベント, 1, 1,  FORCE_PLAYER)
	EventEntryTurn(勝利条件_敵将フォーカス, 1, 1, FORCE_PLAYER, condition_true, "PID_M006_ボス")
	
	EventEntryPickup( チュートリアル_索敵,		g_pid_lueur,	g_key_tutorial_search )
	EventEntryPickup( チュートリアル_索敵,		"PID_ユナカ",	condition_チュートリアル_索敵_ユナカ )
	EventEntryPickup( チュートリアル_ミカヤ,	"PID_ユナカ",	condition_チュートリアル_ミカヤ )
	
	EventEntryEngageAfter(エンゲージ後に再生, "PID_ユナカ",		g_key_tutorial_shine)
	
	EventEntryDie(ユナカ死亡, "PID_ユナカ", FORCE_PLAYER, condition_true )
	
	-- 指輪持ち蛮族
	EventEntryBattleTalk( Talk, "", FORCE_PLAYER, "PID_M006_蛮族_指輪持ち", FORCE_ENEMY, true, "戦闘前会話_指輪持ち_済", "MID_BT1")
	EventEntryDie(指輪持ち蛮族死亡, "PID_M006_蛮族_指輪持ち", FORCE_ENEMY, g_key_ringBandit_Die )
	EventEntryBattleAfter(戦闘後会話_ミカヤエンゲージ, "PID_M006_蛮族_指輪持ち", FORCE_ENEMY, "", FORCE_PLAYER, false, condition_戦闘後会話_ミカヤエンゲージ )
	EventEntryFixed(戦闘後会話_ミカヤエンゲージ, "", FORCE_PLAYER, condition_戦闘後会話_ミカヤエンゲージ)
	
	
	EventEntryTurnAfter(敵１ターン_明かりを消せ, 1, 1, FORCE_ENEMY)
	EventEntryTurnAfter(自軍２ターン_明かりを灯せ, 2, 2,  FORCE_PLAYER)
	
	
	-- M006ボス
	EventEntryFixed(待機後_ボス, g_pid_boss, FORCE_ENEMY, condition_待機後_ボス)
	EventEntryBattleTalk(Talk, "", FORCE_PLAYER, g_pid_boss, FORCE_ENEMY, true, "戦闘前会話_ボス_済", "MID_BT3")
	EventEntryDie(ボス死亡, g_pid_boss, FORCE_ENEMY, g_key_Boss_Die )
	
end

-- -----------------------------------

function Cleanup()
	
	Log("Cleanup")
	
end

-- -----------------------------------

function Opening()
	
	Log("Opening")
	
	PuppetDemo("M006", "MID_OP1")
	PuppetDemo("M006", "MID_OP2")
	PuppetDemo("M006", "MID_OP3")
	
end

function MapOpening()
	
	Log("MapOpening")
	
	-- ----------------------------------------
	
	-- リュール動かしておく
	UnitSetPos(g_pid_lueur, 22, 14)
	
	
	-- ヴァンドレ達一旦退避
	UnitSetPosFromPos( 19, 2,	21, 1 )
	UnitSetPosFromPos( 18, 2,	20, 1 )
	UnitSetPosFromPos( 17, 2,	19, 1 )
	UnitSetPosFromPos( 19, 3,	21, 2 )
	UnitSetPosFromPos( 18, 3,	20, 2 )
	UnitSetPosFromPos( 17, 3,	19, 2 )
	UnitSetPosFromPos( 16, 3,	18, 2 )
	UnitSetPosFromPos( 18, 4,	20, 3 )
	UnitSetPosFromPos( 17, 4,	19, 3 )
	
	
	-- カメラはヴァンドレ達にあわせておく
	CursorSetPos(17, 3)
	CursorSetDistanceMode(CURSOR_DISTANCE_NEAR)
	MapCameraWait()
	FadeIn(FADE_NORMAL)
	WaitTime(0.1)
	
	
	-- ヴァンドレ達登場
	UnitMovePosFromPos( 19, 3,	17, 4 )
	UnitMovePosFromPos( 20, 3,	18, 4 )
	UnitMovePosFromPos( 18, 2,	16, 3 )
	UnitMovePosFromPos( 19, 2,	17, 3 )
	UnitMovePosFromPos( 20, 2,	18, 3 )
	UnitMovePosFromPos( 21, 2,	19, 3 )
	UnitMovePosFromPos( 19, 1,	17, 2 )
	UnitMovePosFromPos( 20, 1,	18, 2 )
	UnitMovePosFromPos( 21, 1,	19, 2 )
	
	
	UnitMoveWait()
	FadeWait()
	WaitTime(1.5)
	CursorSetPos(19, 13)
	
	
	-- リュールとユナカの入場演出
	if UnitExistOnMap("PID_ユナカ") then
		UnitMovePos("PID_ユナカ", 20, 14, MOVE_FLAG_NONE)
	end
	if UnitExistOnMap(g_pid_lueur) then
		UnitMovePos(g_pid_lueur, 19, 14, MOVE_FLAG_NONE)
	end
	
	UnitMoveWait()
	MapCameraWait()
	
	UnitRotation(g_pid_lueur,	ROTATE_LEFT)
	UnitRotation("PID_ユナカ",	ROTATE_LEFT)
	UnitMoveWait()
	
	-- ----------------------------------------
	
	Talk("MID_EV1")
	
end

-- ---------------------------------------------------------

function 進撃開始直後イベント()
	
	CursorSetPos_FromPid(g_pid_lueur)
	
	Talk( "MID_EV5" )
	
	-- ユナカ前に出る
	if UnitExistOnMap("PID_ユナカ") then
		UnitMovePos("PID_ユナカ", 19, 13, MOVE_FLAG_NONE)
	end
	UnitMoveWait()
	UnitRotation("PID_ユナカ",	ROTATE_LEFT)
	UnitMoveWait()
	
	WaitTime( 0.5 )
	
	-- 緑軍→青軍
	pid = "PID_ユナカ"
	if UnitExistOnMap( pid ) then
		UnitJoin( pid )
	end
	
	WaitTime(0.5)
	
	Talk( "MID_EV5_2" )
	
	-- チュートリアル：索敵
	Tutorial( "TUTID_索敵" )
	
	local ringX = UnitGetX("PID_M006_蛮族_指輪持ち")
	local ringZ = UnitGetZ("PID_M006_蛮族_指輪持ち")
	MapObjectCreate("Eff_Cursor01", "Effects/BMap/UI/Guide/Prefabs/Eff_Cursor_W1H1", ringX, ringZ)
	WaitTime( 2.0 )
	
	Talk("MID_EV2")
	
	MapObjectDelete("Eff_Cursor01")
	
	Talk("MID_EV3")
	Talk("MID_EV4")
end

-- ---------------------------------------------------------

function condition_チュートリアル_索敵_ユナカ()
	
	-- エンゲージ前か判定
	local value = VariableGet( g_key_engage_michaiah )
	if value == 1 then
		return false
	end
	
	value = VariableGet( g_key_tutorial_search )
	if value == 0 then
		return true
	end
	
	return false
	
end
	
function チュートリアル_索敵()
	
	MapCameraWait()
	
	Tutorial( "TUTID_毒" )
	Tutorial( "TUTID_隠密スタイル" ) -- 通知のみ
	
	VariableSet( g_key_tutorial_search, 1 )
	
end

-- ---------------------------------------------------------

function condition_戦闘後会話_ミカヤエンゲージ()
	
	-- 指輪持ち蛮族が死んだか
	if VariableGet( g_key_ringBandit_Die ) == 0 then
		return false
	end
	
	if VariableGet( g_key_engage_michaiah ) == 0 then
		return true
	end
	
	return false
end

function 戦闘後会話_ミカヤエンゲージ()
	
	Talk("MID_EV6")
	
	Movie("Kengen03")
	SkipEscape()
	FadeInAndWait( FADE_FAST )
	
	Talk("MID_EV7")
	Talk("MID_EV8")
	
	-- 神将顕現・シンクロ
	UnitCreateGodUnit("PID_ユナカ", "GID_ミカヤ")
	UnitSetEngageCount("PID_ユナカ", 7)
	
	VariableSet( g_key_engage_michaiah, 1 )
	
end

-- ---------------------------------------------------------

function condition_チュートリアル_ミカヤ()
	
	-- エンゲージ後か判定
	local value = VariableGet( g_key_engage_michaiah )
	if value == 0 then
		return false
	end
	
	value = VariableGet( g_key_tutorial_michaiah )
	if value == 0 then
		return true
	end
	
	return false
	
end

function チュートリアル_ミカヤ()
	
	MapCameraWait()
	Talk( "MID_EV10" )
	
	Tutorial( "TUTID_紋章士ミカヤ" )
	
	VariableSet( g_key_tutorial_michaiah, 1 )
	
end

-- ---------------------------------------------------------

function エンゲージ後に再生()
	
	Talk( "MID_EV11" )
	
	-- Dialog( "MID_TUT_BMAP_MICAIAH_SHINE_0" )
	
end

-- ---------------------------------------------------------

function 敵１ターン_明かりを消せ()
	CursorSetPos_FromPid( g_pid_boss )
	Talk( "MID_EV9" )
	
	-- 自分も消す
	TerrainSetOne( 3, 15, "TID_篝火消" )
	WaitTime( 0.5 )
	
end

function 自軍２ターン_明かりを灯せ()
	CursorSetPos_FromPid( g_pid_lueur )
	Talk( "MID_EV12" )
	Tutorial( "TUTID_篝火" )
end

-- -----------------------------------

function condition_待機後_ボス()
	
	if DifficultyGet() < DIFFICULTY_LUNATIC then
		return false
	end
	
	if VariableGet( g_key_fixed_boss ) == 1 then
		return false
	end
	
	x = UnitGetX(g_pid_boss)
	z = UnitGetZ(g_pid_boss)
	
	if ( x == 1 ) and ( z == 11 ) then
		return true
	end
	
end

function 待機後_ボス()
	
	-- AIを再設定する
	AiSetSequence(g_pid_boss, AI_ORDER_CAUSE, "AI_AC_TurnAttackRange", "10")
	AiSetSequence(g_pid_boss, AI_ORDER_MOVE, "AI_MV_WeakEnemy")
	AiSetBandNo(g_pid_boss, 1)
	AiSetActive(g_pid_boss, false)
	
	VariableSet( g_key_fixed_boss, 1 )
	
end

-- ---------------------------------------------------------

function 指輪持ち蛮族死亡()
	Talk( "MID_BT2" )
	
	スキル解除( g_pid_boss, "SID_死亡回避" )
	
	-- ボスが死んでいたらゲームクリア
	if VariableGet( g_key_Boss_Die ) == 1 then
		VariableSet( "勝利", 1 )
	end
end

function ボス死亡()
	Talk( "MID_BT4" )
	
	-- 指輪奪還済みならクリア
	if VariableGet( g_key_ringBandit_Die ) == 1 then
		VariableSet( "勝利", 1 )
	end
end

-- -----------------------------------

function ユナカ死亡()
	VariableSet( "敗北", 1 )
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
