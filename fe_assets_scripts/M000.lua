Include("Common")
g_pid_lueur				= "PID_M000_リュール"

g_key_attack			= "攻撃しよう_済"
g_key_go_closer			= "早く敵に近づこう_済"
g_key_go_attack			= "早く攻撃しよう_済"
g_key_engage			= "エンゲージしよう_済"
g_key_engage_attack		= "エンゲージ技使おう_済"
g_key_battle			= "戦闘前会話_リュール_ソンブル_済"

-- -----------------------------------

function Startup()
	
	Log("Startup")
	
	VariableSet( "禁止_持ち物", 2 )
	VariableSet( "禁止_直接ターゲット選択", 1 )
	VariableSet( "禁止_チェインアタック", 1 )
	VariableSet( "禁止_チェインガード", 1 )
	VariableSet( "禁止_ブレイク", 1 )
	VariableSet( "禁止_エンゲージキャンセル", 1 )
	
	-- 勝利条件の設定
	WinRuleSetDestroyBoss( true )	-- 敵将撃破
	WinRuleSetMID("MID_RULE_M000_WIN")
	LoseRuleSetMID( "MID_RULE_COMMON_LOSE" )

	フラグ登録()
	イベント登録()
	
end

function フラグ登録()
	VariableEntry(g_key_go_closer,			0)
	VariableEntry(g_key_attack,				0)
	VariableEntry(g_key_go_attack,			0)
	VariableEntry(g_key_engage,				0)
	VariableEntry(g_key_engage_attack,		0)
	VariableEntry(g_key_battle,				0)
end

function イベント登録()
	EventEntryTurn(エンゲージカウント上書き, 1, 1, FORCE_PLAYER)
	EventEntryTurnAfter(移動しよう, 1, 1, FORCE_PLAYER)
	EventEntryUnitCommandPrepare(チュートリアル_ユニットコマンド, g_pid_lueur, "チュートリアル_ユニットコマンド_済")
	EventEntryTurn(ターン交代, 1, 1, FORCE_ENEMY)
	
	EventEntryTurnAfter(攻撃しよう,				2, -1, FORCE_PLAYER, condition_攻撃しよう)
	EventEntryTurnAfter(早く敵に近づこう,		2, -1, FORCE_PLAYER, condition_早く敵に近づこう)
	EventEntryTurnAfter(早く攻撃しよう,			3, -1, FORCE_PLAYER, condition_早く攻撃しよう)
	
	EventEntryBattleTalk(戦闘前会話_リュール_ソンブル, g_pid_lueur, FORCE_PLAYER, "PID_M000_ソンブル", FORCE_ENEMY, true, g_key_battle)
	
	EventEntryTurnAfter(エンゲージしよう,		3, -1, FORCE_PLAYER, condition_エンゲージしよう )
	EventEntryEngageBefore( エンゲージ, g_pid_lueur, "エンゲージ_済" )
	
	EventEntryDie(Talk, "PID_M000_ソンブル", FORCE_ENEMY, condition_true, "MID_BT2")
end

function Cleanup()
	
	Log("Cleanup")
	
end

-- -----------------------------------

function Opening()
	
	Log("Opening")
	
	FadeInAndWait(FADE_SLOW)
		Movie("S02")
		SkipEscape()
	FadeOutAndWait(FADE_NORMAL)
	
end

function MapOpening()
	
	Log("MapOpening")
	
	
	-- マルスとシンクロ
	UnitCreateGodUnit(g_pid_lueur, "GID_M000_マルス")
	UnitSetEngageCount(g_pid_lueur, 3)
	
	
	CursorSetPos(5, 4)
	CursorSetDistanceMode(CURSOR_DISTANCE_NEAR)
	MapCameraWait()
	FadeWait()
	
	UnitMovePos(g_pid_lueur, 5, 4, MOVE_FLAG_NONE)
	UnitMoveWait()
	WaitTime(0.5)
	
	CursorSetPos_FromPid("PID_M000_ソンブル")
	MapCameraWait()
	WaitTime(0.5)
	Talk("MID_OP2")
	WaitTime(1.0)
	Talk("MID_OP3")
	
	CursorAnimeCreate_FromPid( "PID_M000_ソンブル" )
		WinRule()
	CursorAnimeDelete()
end

-- -----------------------------------

function エンゲージカウント上書き()
	UnitSetEngageCount(g_pid_lueur, 3)
end

-- -----------------------------------

function 移動しよう()
	Talk("MID_EV1")
	Tutorial("TUTID_移動")
end

-- -----------------------------------

function チュートリアル_ユニットコマンド()
	Tutorial("TUTID_ユニットコマンド")
end

-- -----------------------------------

function ターン交代()
	CursorSetPos_FromPid_DistanceModeNear("PID_M000_ソンブル")
	Talk("MID_EV2")
	Tutorial("TUTID_フェイズチェンジ")
end

-- -----------------------------------

function condition_早く敵に近づこう()
	if VariableGet(g_key_go_closer) == 1 then
		return false
	end
	
	if VariableGet(g_key_attack) == 1 then
		return false
	end
	
	local distance = 二点間距離( UnitGetX( g_pid_lueur ), UnitGetZ( g_pid_lueur ), UnitGetX( "PID_M000_ソンブル" ), UnitGetZ( "PID_M000_ソンブル" ) )
	if distance > 5 then
		return true
	end
	
	return false
end

function 早く敵に近づこう()
	Talk("MID_EV5")
	VariableSet(g_key_go_closer, 1)
end

-- -----------------------------------

function condition_攻撃しよう()
	if VariableGet(g_key_attack) == 1 then
		return false
	end
	if VariableGet(g_key_battle) == 1 then
		return false
	end
	
	local distance = 二点間距離( UnitGetX( g_pid_lueur ), UnitGetZ( g_pid_lueur ), UnitGetX( "PID_M000_ソンブル" ), UnitGetZ( "PID_M000_ソンブル" ) )
	if distance <= 5 then
		return true
	end
	
	return false
end

function 攻撃しよう()
	Talk("MID_EV3")
	Tutorial("TUTID_攻撃")
	VariableSet(g_key_attack, 1)
end

-- -----------------------------------

function condition_早く攻撃しよう()
	if VariableGet(g_key_go_attack) == 1 then
		return false
	end
	if VariableGet(g_key_battle) == 1 then
		return false
	end
	if VariableGet(g_key_attack) == 0 then
		return false
	end
	
	return true
end

function 早く攻撃しよう()
	Talk("MID_EV6")
	VariableSet(g_key_go_attack, 1)
end

-- -----------------------------------

function 戦闘前会話_リュール_ソンブル()
	
	VariableSet(g_key_go_attack, 1)
	Talk("MID_BT1")
	
end

-- -----------------------------------

function condition_エンゲージしよう()
	
	if VariableGet(g_key_engage) == 1 then
		return false
	end
	
	if ( UnitGetEngageCount( g_pid_lueur ) == 7 ) and ( not UnitIsStatus( g_pid_lueur, UNIT_STATUS_ENGAGING ) ) then
		return true
	end
	
	return false
	
end

function エンゲージしよう()
	
	Talk("MID_EV7")
	Tutorial("TUTID_エンゲージ")
	
	VariableSet( "禁止_攻撃", 1 )
	VariableSet( "禁止_待機", 1 )
	
	VariableSet(g_key_engage, 1)
	
end

-- -----------------------------------

function エンゲージ()
	FadeOutAndWait(FADE_FAST)
	Movie("S03")
	UnitSetEngaging( g_pid_lueur, true )
	FadeInAndWait(FADE_FAST)
	
	エンゲージ技使おう()
end

function エンゲージ技使おう()
	
	-- ここでファルシオンに持ち替え
	UnitSetItemEquip(g_pid_lueur, "IID_マルス_ファルシオン")
	
	Talk( "MID_EV4" )
	Tutorial( "TUTID_エンゲージ技" )
	
	VariableSet(g_key_engage_attack, 1)
	
end

-- -----------------------------------

function MapEnding()
	
	Log("MapEnding")
	
end

function Ending()
	
	Log("Ending")
	
	--SoundPostEvent("Play_BGM_EVT_Serious")
	PuppetDemo("M000", "MID_ED1")
	
end

function GameOver()
	
	Log("GameOver")
	
end