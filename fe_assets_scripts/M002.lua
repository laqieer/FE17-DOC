Include("Common")

g_pid_lueur						= "PID_リュール"
g_pid_rumiere					= "PID_M002_ルミエル"


g_key_tutorial_break			= "チュートリアル_ブレイク_済"
g_key_die_axefighter			= "アクスファイター_イベント_撃破_済"
g_key_battled_axefighter		= "アクスファイター戦闘後_済"
g_key_rumiere_run				= "ルミエル行動開始_済"
g_key_rumiere_Defeat1st			= "ルミエル撃破一回目_済"

g_key_tutorial_monk				= "チュートリアル_モンク_済"
g_key_tutorial_magic			= "チュートリアル_魔法_済"
g_key_tutorial_attackRange		= "チュートリアル_危険範囲_済"

g_key_battleTalk_lueur1			= "戦闘前会話_リュール_前半戦_済"
g_key_battleTalk_lueur2			= "戦闘前会話_リュール_後半戦_済"
g_key_battleTalk_clan			= "戦闘前会話_クラン_ルミエル_済"
g_key_battleTalk_fran			= "戦闘前会話_フラン_ルミエル_済"
g_key_battleTalk_vandre			= "戦闘前会話_ヴァンドレ_ルミエル_済"
g_key_battled_vandre2			= "ヴァンドレと戦闘_後半戦_済"
	
g_key_battleAfter_rumiere		= "ルミエルから攻撃後死亡_済"
g_key_enemyDelete				= "残った敵の削除_済"
g_key_end_battle1				= "一回戦終了"
g_key_start_battle2				= "二回戦開始"
g_key_tutorial_emblemPowerSpot	= "チュートリアル_紋章氣マス_済"
g_key_rumiere_runned			= "ルミエル出撃イベント_済"
g_key_rumiere_fixed				= "ルミエル待機後イベント_済"
g_key_rumiere_defeat			= "撃破会話_ルミエル_済"

-- -----------------------------------

function Startup()
	
	Log("Startup")
	
	VariableSet( "禁止_輸送隊", 2 )
	VariableSet( "禁止_チェインアタック", 1 )
	
	-- 勝利条件の設定
	WinRuleSetEnemyNumberLessThanOrEqualTo(-1)		-- 敵全滅判定を無効化
	WinRuleSetMID( "MID_RULE_M002_WIN" )
	
	フラグ登録()
	イベント登録()
	
end

-- -----------------------------------

function フラグ登録()
	
	VariableEntry( g_key_tutorial_break,			0 )
	VariableEntry( g_key_die_axefighter,			0 )
	VariableEntry( g_key_battled_axefighter,		0 )
	VariableEntry( g_key_rumiere_run,				0 )
	VariableEntry( g_key_rumiere_Defeat1st,			0 )
	
	VariableEntry( g_key_tutorial_monk,				0 )
	VariableEntry( g_key_tutorial_magic,			0 )
	VariableEntry( g_key_tutorial_attackRange,		0 )
	
	VariableEntry( g_key_battleTalk_lueur1,			0 )
	VariableEntry( g_key_battleTalk_lueur2,			0 )
	VariableEntry( g_key_battleTalk_clan,			0 )
	VariableEntry( g_key_battleTalk_fran,			0 )
	VariableEntry( g_key_battleTalk_vandre,			0 )
	VariableEntry( g_key_battled_vandre2,			0 )
	
	VariableEntry( g_key_battleAfter_rumiere,		0 )
	VariableEntry( g_key_enemyDelete,				0 )
	VariableEntry( g_key_end_battle1,				0 )
	VariableEntry( g_key_start_battle2,				0 )
	
	VariableEntry( g_key_tutorial_emblemPowerSpot,	0 )
	
	VariableEntry( g_key_rumiere_runned,			0 )
	VariableEntry( g_key_rumiere_fixed,				0 )
	VariableEntry( g_key_rumiere_defeat,			0 )
	
end

function イベント登録()
	
	EventEntryTurn(エンゲージカウント上書き, 1, 1, FORCE_PLAYER)
	
	EventEntryTurnAfter(ターン後_射程チュートリアル, 1, 1, FORCE_PLAYER)
	
	EventEntryPickup(チュートリアル_ブレイク,	"",				condition_チュートリアル_ブレイク	)
	EventEntryPickup(チュートリアル_モンク,		"PID_フラン",	g_key_tutorial_monk)
	EventEntryPickup(チュートリアル_魔法,		"PID_クラン",	g_key_tutorial_magic)
	
	EventEntryPickup(チュートリアル_危険範囲,	"",				condition_チュートリアル_危険範囲	)
	
	EventEntryDie(EmptyFunction, "PID_M002_幻影兵_アクスファイター_イベント", FORCE_ENEMY, g_key_die_axefighter)
	EventEntryBattleAfter(アクスファイター戦闘後, g_pid_lueur, FORCE_PLAYER, "PID_M002_幻影兵_アクスファイター_イベント", FORCE_ENEMY, false, condition_アクスファイター戦闘後)
	
	EventEntryTurn(ルミエル移動禁止解除, 2, 2, FORCE_PLAYER)
	EventEntryTurnAfter(ルミエル行動開始, 2, 2, FORCE_ENEMY, condition_ルミエル行動開始)
	
	-- ルミエル死亡
	EventEntryDie(VariableSet, g_pid_rumiere, FORCE_ENEMY, condition_ルミエル撃破一回目, g_key_rumiere_Defeat1st, 1)
	
	-- --------------------------------------------------
	
	-- ルミエルから攻撃してきて死亡した場合
	EventEntryBattleAfter(ルミエルから攻撃後死亡, g_pid_rumiere, FORCE_ENEMY, "", FORCE_PLAYER, false, condition_ルミエルから攻撃後死亡)
	EventEntryTurnEnd(一回戦終了から二回戦開始, -1, -1, FORCE_ENEMY, condition_一回戦終了)
	
	-- --------------------------------------------------
	
	-- プレイヤー軍から攻撃して死亡した場合
	EventEntryFixed(一回戦終了, "", FORCE_PLAYER, condition_一回戦終了)
	EventEntryTurn(二回戦開始, -1, -1, FORCE_PLAYER, condition_二回戦開始)
	
	-- --------------------------------------------------
	
	EventEntryTurnAfter(チュートリアル_紋章氣マス, -1, -1, FORCE_PLAYER, condition_チュートリアル_紋章氣マス)
	
	EventEntryTurnAfter(ルミエル出撃イベント, -1, -1, FORCE_ENEMY, condition_ルミエル出撃イベント)
	EventEntryFixed(ルミエル待機後イベント, g_pid_rumiere, FORCE_ENEMY, condition_ルミエル待機後イベント)
	
	EventEntryBattleTalk(戦闘前イベント_リュール,	g_pid_lueur,		FORCE_PLAYER,	g_pid_rumiere, FORCE_ENEMY, true, condition_戦闘前イベント_リュール)
	EventEntryBattleTalk(戦闘前イベント_ヴァンドレ,	"PID_ヴァンドレ",	FORCE_PLAYER,	g_pid_rumiere, FORCE_ENEMY, true, condition_戦闘前イベント_ヴァンドレ)
	EventEntryBattleTalk(Talk,						"PID_クラン",		FORCE_PLAYER,	g_pid_rumiere, FORCE_ENEMY, true, g_key_battleTalk_clan, "MID_BT4")
	EventEntryBattleTalk(Talk,						"PID_フラン",		FORCE_PLAYER,	g_pid_rumiere, FORCE_ENEMY, true, g_key_battleTalk_fran, "MID_BT5")
	
	EventEntryDie(ルミエル撃破イベント, g_pid_rumiere, FORCE_ENEMY, condition_ルミエル撃破イベント)
	
end

-- -----------------------------------

function Cleanup()
	
	Log("Cleanup")
	
end

-- -----------------------------------

function Opening()
	
	Log("Opening")
		
	PuppetDemo("M002", "MID_OP1")
	PuppetDemo("M002", "MID_OP2")
	PuppetDemo("M002", "MID_OP3")
	
end

function MapOpening()
	
	Log("MapOpening")
	
	FadeOutAndWait(FADE_FAST)
	
	CursorSetPos(6, 3)
	
	UnitSetEngageCount(g_pid_lueur, 6)
	
	FadeInAndWait(FADE_FAST)
	
	-- ルミエルが幻影兵を召喚
	Dispos("EnemyIllusion", DISPOS_FLAG_FOCUS + DISPOS_FLAG_WARP)
	Yield()
	WaitTime(1.0)
	
	PuppetDemo("M002", "MID_OP4")
	
	UnitTransfer(g_pid_rumiere, FORCE_ENEMY)
	
	CursorAnimeCreate_FromPid( "PID_M002_ルミエル" )
		WinRule()
	CursorAnimeDelete()
end

-- ---------------------------------------------------------

function エンゲージカウント上書き()
	UnitSetEngageCount( g_pid_lueur, 6 )
end

-- ---------------------------------------------------------

function ターン後_射程チュートリアル()
	
	CursorAnimeCreate_FromPid("PID_M002_幻影兵_アーチャー_イベント")
	Talk("MID_EV1")
	CursorAnimeDelete()
	Tutorial( "TUTID_射程" )
	
end

-- ---------------------------------------------------------

function condition_チュートリアル_ブレイク()
	
	if VariableGet( g_key_tutorial_break ) == 1 then
		return false
	end
	
	if VariableGet( g_key_start_battle2 ) == 1 then
		return false
	end
	
	local pid = UnitGetPID(MindGetUnit())
	if not ( ( pid == g_pid_lueur ) or ( pid == "PID_ヴァンドレ" ) ) then
		return false
	end
	
	pid = "PID_M002_幻影兵_アクスファイター_イベント"
	if UnitExistOnMap( pid ) then
		return true
	end
	
	return false
end

function チュートリアル_ブレイク()
	
	CursorAnimeCreate_FromPid( "PID_M002_幻影兵_アクスファイター_イベント" )
	Talk("MID_EV2")
	CursorAnimeDelete()
	Tutorial( "TUTID_ブレイク" )
	
	VariableSet( g_key_tutorial_break, 1 )
	
end

-- ---------------------------------------------------------

function チュートリアル_モンク()
	CursorSetPos_FromPid(MindGetUnit())
	MapCameraWait()
	
	Talk( "MID_EV4" )
	
	Tutorial( "TUTID_杖" )
	Tutorial( "TUTID_気功スタイル" )
	
	if VariableGet( g_key_tutorial_magic ) == 0 then
		チュートリアル_竜族スタイル()
	end
end

function チュートリアル_魔法()
	CursorSetPos_FromPid(MindGetUnit())
	MapCameraWait()
	
	Talk( "MID_EV5" )
	
	Tutorial( "TUTID_魔法" )
	Tutorial( "TUTID_魔法スタイル" )
	
	if VariableGet( g_key_tutorial_monk ) == 0 then
		チュートリアル_竜族スタイル()
	end
end

function チュートリアル_竜族スタイル()
	Tutorial( "TUTID_竜族スタイル" )	-- 通知のみ
end

-- ---------------------------------------------------------

function condition_チュートリアル_危険範囲()
	if VariableGet( g_key_start_battle2 ) == 0 then
		return false
	end
	
	if VariableGet( g_key_tutorial_attackRange ) == 1 then
		return false
	end
	
	return true
end

function チュートリアル_危険範囲()
	
	CursorSetPos_FromPid(MindGetUnit())
	MapCameraWait()
	
	Tutorial( "TUTID_危険範囲" )
	
	VariableSet( g_key_tutorial_attackRange, 1 )
	
end

-- ---------------------------------------------------------

function EmptyFunction()
end

function condition_アクスファイター戦闘後()
	if ( VariableGet( g_key_battled_axefighter ) == 1 ) then
		return false
	end
	
	if ( VariableGet( g_key_die_axefighter ) == 1 ) then
		return false
	end
	
	-- 行動可能な味方がいるか
	local unit = ForceUnitGetFirst(FORCE_PLAYER)
	while unit != nil do
		if ( not ( UnitGetPID( unit ) == g_pid_lueur ) ) and ( not UnitIsStatus( unit, UNIT_STATUS_FIXED ) ) then
			return true
		end
		unit = ForceUnitGetNext( unit )
	end
	
	return false
end

function アクスファイター戦闘後()
	Talk( "MID_EV3" )
	VariableSet( g_key_battled_axefighter, 1 )
end

-- ---------------------------------------------------------

function ルミエル移動禁止解除()
	if VariableGet( g_key_end_battle1 ) == 0 then
		UnitClearStatus( g_pid_rumiere, UNIT_STATUS_MOVE_NOT_ALLOW )
	end
end

-- ---------------------------------------------------------

function condition_ルミエル行動開始()
	if VariableGet( g_key_rumiere_run ) == 1 then
		return false
	end
	
	if ( VariableGet( g_key_battleTalk_lueur1 ) == 1 )
		or ( VariableGet( g_key_battleTalk_vandre ) == 1 )
		or ( VariableGet( g_key_battleTalk_clan ) == 1 )
		or ( VariableGet( g_key_battleTalk_fran ) == 1 ) then
		
		return false
		
	end
	
	return true
end

function ルミエル行動開始()
	CursorSetPos_FromPid( g_pid_rumiere )
	Talk( "MID_EV6" )
	VariableSet( g_key_rumiere_run, 1 )
end

-- ---------------------------------------------------------

function condition_戦闘前イベント_リュール()
	if ( VariableGet( g_key_start_battle2 ) == 0 ) and ( VariableGet( g_key_battleTalk_lueur1 ) == 0 )  then
		return true
	end
	
	if ( VariableGet( g_key_start_battle2 ) == 1 ) and ( VariableGet( g_key_battleTalk_lueur2 ) == 0 )  then
		return true
	end
	
	return false
end

function 戦闘前イベント_リュール()
	if ( VariableGet( g_key_start_battle2 ) == 0 ) then
		Talk("MID_BT1")
		VariableSet( g_key_battleTalk_lueur1, 1 )
	else
		Talk("MID_BT2")
		VariableSet( g_key_battleTalk_lueur2, 1 )
		ルミエルのAI変更()
	end
end

-- ---------------------------------------------------------

function condition_戦闘前イベント_ヴァンドレ()
	if ( VariableGet( g_key_battleTalk_vandre ) == 0 ) then
		return true
	end
	
	if ( VariableGet( g_key_start_battle2 ) == 1 )
			and ( VariableGet( g_key_battled_vandre2 ) == 0 )
			and ( UnitGetPID( MindGetUnit() ) == g_pid_rumiere ) then
		return true
	end
	
	return false
end

function 戦闘前イベント_ヴァンドレ()
	-- 戦闘前会話
	if ( VariableGet( g_key_battleTalk_vandre ) == 0 ) then
		Talk( "MID_BT3" )
		VariableSet( g_key_battleTalk_vandre, 1 )
	end
	
	
	-- 後半戦・ルミエルのAIを変更する
	if ( VariableGet( g_key_start_battle2 ) == 1 ) and ( UnitGetPID( MindGetUnit() ) == g_pid_rumiere ) then
		VariableSet( g_key_battled_vandre2, 1 )
		ルミエルのAI変更()
	end
end

-- ---------------------------------------------------------

function ルミエルのAI変更()
	if (  VariableGet( g_key_battled_vandre2 ) == 0 ) then
		
		-- ヴァンドレ狙い
		AiSetSequence(g_pid_rumiere, AI_ORDER_ATTACK, "AI_AT_Person", "PID_ヴァンドレ")
		
	elseif ( VariableGet( g_key_battleTalk_lueur2 ) == 0 ) then
		
		-- リュール狙い
		AiSetSequence(g_pid_rumiere, AI_ORDER_ATTACK, "AI_AT_Person", "PID_リュール")
		
	else
		
		-- ヴァンドレ以外の適当に弱い人を狙う
		AiSetSequence(g_pid_rumiere, AI_ORDER_ATTACK, "AI_AT_ExcludePerson", "PID_ヴァンドレ")
		
	end
end

-- ---------------------------------------------------------

function condition_ルミエル撃破一回目()
	if VariableGet( g_key_rumiere_Defeat1st ) == 1 then
		return false
	end
	
	return true
end

-- ---------------------------------------------------------

function condition_ルミエルから攻撃後死亡()
	if VariableGet( g_key_battleAfter_rumiere ) == 1 then
		return false
	end
	
	if VariableGet( g_key_end_battle1 ) == 1 then
		return false
	end
	
	if VariableGet( g_key_rumiere_Defeat1st ) == 1 then
		return true
	end
	
	return false
end

function ルミエルから攻撃後死亡()
	VariableSet( "行動後フェイズ終了", 1 )
	VariableSet( g_key_battleAfter_rumiere, 1 )
end

-- ---------------------------------------------------------

function condition_残った敵の削除とルミエルのコメント()
	if VariableGet( g_key_enemyDelete ) == 1 then
		return false
	end
	
	if VariableGet( g_key_battleAfter_rumiere ) == 1 then
		return true
	end
	
	return false
end

function 残った敵の削除とルミエルのコメント()
	
	local x = CursorGetX()
	local z = CursorGetZ()
	
	-- 場に残っている幻影兵が消える
	local list = {}
	local index = ForceUnitGetFirst(FORCE_ENEMY)
	while index != nil do
		if not ( UnitGetPID( index ) == g_pid_rumiere ) then
			list[ #list + 1 ] = index
		end
		index = ForceUnitGetNext(index)
	end
	
	if ( #list > 0 ) then
		for index = 1, #list do
			CursorSetPos_FromPid( list[index] )
			UnitDie( list[index] )
			WaitTime( 0.5 )
		end
		
		-- カメラをルミエルに戻す
		CursorSetPos( x, z )
		MapCameraWait()
	end
	
	Talk("MID_EV7")
	
	VariableSet( "行動後フェイズ終了", 0 )
	VariableSet( g_key_enemyDelete, 1 )
	
end

-- ---------------------------------------------------------

function 一回戦終了から二回戦開始()
	一回戦終了()
	二回戦開始()
end

-- ---------------------------------------------------------

function condition_一回戦終了()
	if VariableGet( g_key_end_battle1 ) == 1 then
		return false
	end
	
	if VariableGet( g_key_rumiere_Defeat1st ) == 1 then
		return true
	end
	
	return false
end

function 一回戦終了()
	
	残った敵の削除とルミエルのコメント()
	
	VariableSet( "自軍フェイズスキップ", 1 )
	VariableSet( "敵軍フェイズスキップ", 1 )
	VariableSet( "行動後フェイズ終了", 1 )
	
	FadeOutAndWait(FADE_NORMAL)
	
	-- 前半戦ルミエル消去
	UnitDelete( g_pid_rumiere )
	
	自軍パラメータ初期化(g_pid_lueur,		6, 3)
	自軍パラメータ初期化("PID_ヴァンドレ",	6, 2)
	自軍パラメータ初期化("PID_クラン",		7, 2)
	自軍パラメータ初期化("PID_フラン",		5, 2)
	
	Dispos( "Enemy2", DISPOS_FLAG_NONE )
	Yield()
	
	スキル装備( g_pid_rumiere, "SID_相手の必殺０" )
	
	CursorSetPos( 6, 2 )
	MapCameraWait()
	
	VariableSet( g_key_end_battle1, 1 )
	
end

-- ---------------------------------------------------------

function 自軍パラメータ初期化( pid, x, z )
	
	-- 再配置、HP回復、エンゲージカウントの初期化、待機状態の解除
	
	UnitSetPos(pid, x, z)
	UnitResetParam(pid)
	UnitRotation(pid, ROTATE_UP)
	
end

-- ---------------------------------------------------------

function condition_二回戦開始()
	if VariableGet( g_key_start_battle2 ) == 1 then
		return false
	end
	
	if VariableGet( g_key_end_battle1 ) == 1 then
		return true
	end
	
	return false
end

function 二回戦開始()
		
	VariableSet( "自軍フェイズスキップ", 0 )
	VariableSet( "敵軍フェイズスキップ", 0 )
	VariableSet( "行動後フェイズ終了", 0 )
	
	UnitSetEngageCount(g_pid_lueur, 0)
	
	FadeInAndWait(FADE_NORMAL)
	
	WaitTime(0.5)
	CursorSetPos( 6, 14 )
	MapCameraWait()
	
	Talk("MID_EV8")
	
	FadeOutAndWait(FADE_FAST)
			
			PuppetDemo("M002", "MID_EV8_2")
			Movie("Kengen01")
			SkipEscape()
			
			-- シグルドとエンゲージ
			UnitCreateGodUnit(g_pid_rumiere, "GID_M002_シグルド")
			UnitSetEngageCount(g_pid_rumiere, 7)
			
			-- 紋章氣マス配置
			MapOverlapSetOne(8, 4, "TID_紋章氣")
			
	FadeInAndWait(FADE_NORMAL)
	
	Talk("MID_EV9")
	
	FadeInAndWait(FADE_NORMAL)
	
	-- 再び幻影兵召喚
	Dispos( "EnemyIllusion2_3", DISPOS_FLAG_FOCUS + DISPOS_FLAG_WARP )
	Yield()
	WaitTime(0.5)
	Dispos( "EnemyIllusion2_2", DISPOS_FLAG_FOCUS + DISPOS_FLAG_WARP )
	Yield()
	WaitTime(0.5)
	Dispos( "EnemyIllusion2_1", DISPOS_FLAG_FOCUS + DISPOS_FLAG_WARP )
	Yield()
	WaitTime(0.5)
	
	Talk("MID_EV10")
	
	VariableSet( g_key_start_battle2, 1 )
	
end

-- ---------------------------------------------------------

function condition_チュートリアル_紋章氣マス()
	if VariableGet( g_key_start_battle2 ) == 0 then
		return false
	end
	
	if VariableGet( g_key_tutorial_emblemPowerSpot ) == 0 then
		return true
	end
	
	return false
end

function チュートリアル_紋章氣マス()
	
	CursorAnimeCreate( 8, 4 )
	
	Tutorial( "TUTID_紋章氣" )
	
	CursorAnimeDelete()
	
	VariableSet( g_key_tutorial_emblemPowerSpot, 1 )
end

-- ---------------------------------------------------------

function condition_ルミエル出撃イベント()
	
	if VariableGet( g_key_start_battle2 ) == 0 then
		return false
	end
	
	if VariableGet( g_key_rumiere_runned ) == 1 then
		return false
	end
	
	local index = ForceUnitGetFirst(FORCE_PLAYER)
	while index != nil do
		
		local x = UnitGetX(index)
		local z = UnitGetZ(index)
		
		-- マップ範囲内か判定
		if ( x >= 1 ) and ( z >= 8 ) and ( x <= 11 ) and ( z <= 14 ) then
			return true
		elseif ( x >= 2 ) and ( x <= 10 ) and ( z == 7 ) then
			return true
		elseif ( x >= 3 ) and ( x <= 9 ) and ( z == 6 ) then
			return true
		end
		
		index = ForceUnitGetNext(index)
		
	end
	
	return false
	
end

function ルミエル出撃イベント()
	
	CursorSetPos_FromPid(g_pid_rumiere)
	Talk("MID_EV11")
	
	UnitSetEngaging(g_pid_rumiere, true)
	
	VariableSet( g_key_rumiere_runned, 1 )
	
end

-- -----------------------------------

function condition_ルミエル待機後イベント()
	
	if VariableGet( g_key_rumiere_fixed ) == 1 then
		return false
	end
	
	if VariableGet( g_key_start_battle2 ) == 0 then
		return false
	end
	
	return true
	
end

function ルミエル待機後イベント()
	Talk( "MID_EV12" )
	スキル解除( g_pid_rumiere, "SID_相手の必殺０" )
	VariableSet( g_key_rumiere_fixed, 1 )
end

-- -----------------------------------

function condition_ルミエル撃破イベント()
	
	if VariableGet( g_key_rumiere_defeat ) == 1 then
		return false
	end
	
	if VariableGet( g_key_start_battle2 ) == 0 then
		return false
	end
	
	return true
	
end

function ルミエル撃破イベント()
	Talk( "MID_BT6" )
	VariableSet( "勝利", 1 )
	VariableSet( g_key_rumiere_defeat, 1 )
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