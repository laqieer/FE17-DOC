Include("Common")
g_pid_lueur = "PID_リュール";

-- -----------------------------------


function Startup()
	
	Log("Startup")
	
	-- 勝利条件の設定
	WinRuleSetDestroyBoss( true )	-- 敵将撃破
	WinRuleSetMID( "MID_RULE_M009_WIN" )
	
	-- 変数の登録
	VariableEntry( "砦到着_カゲツ_済", 0 );
	VariableEntry( "砦到着_ゼルコバ_済", 0 );
	
	イベント登録()
	
	フラグ登録()
	
end

function フラグ登録()
	VariableEntry( "アイビー_行動開始_済", 0 )
	VariableEntry( "アイビーアクティブ_済", 0 )
	VariableEntry( "アクスナイト_交戦開始_済", 0 )
end

function イベント登録()
	
	EventEntryTurn(進撃開始直後イベント, 1, 1,  FORCE_PLAYER);
	EventEntryTurn(勝利条件, 1, 1, FORCE_PLAYER)
	EventEntryTurn(ターン５_緑軍AI設定, 5, 5, FORCE_ALLY);
	
	EventEntryTurnAfter(敵１ターンめイベント, 1, 1, FORCE_ENEMY, "敵１ターンめイベント_済")
	EventEntryTurn(砦到着_カゲツ, -1, -1, FORCE_PLAYER, 判定_砦到着_カゲツ )	
	EventEntryTurn(砦到着_ゼルコバ, -1, -1, FORCE_PLAYER, 判定_砦到着_ゼルコバ )
	
	-- アイビー
	EventEntryBattleTalk(Talk, "", FORCE_PLAYER, "PID_M009_アイビー", FORCE_ENEMY, true, "戦闘前会話_アイビー_済", "MID_BT1")
	EventEntryDie(Talk, "PID_M009_アイビー", FORCE_ENEMY, condition_true, "MID_BT2")
	
	-- ゼルコバ
	EventEntryBattleTalk(Talk, "", FORCE_PLAYER, "PID_M009_ゼルコバ", FORCE_ENEMY, true, "戦闘前会話_ゼルコバ_済", "MID_BT3")
	EventEntryDie(Talk, "PID_M009_ゼルコバ", FORCE_ENEMY, condition_true, "MID_BT4")
	
	-- カゲツ
	EventEntryBattleTalk(Talk, "", FORCE_PLAYER, "PID_M009_カゲツ", FORCE_ENEMY, true, "戦闘前会話_カゲツ_済", "MID_BT5")
	EventEntryDie(Talk, "PID_M009_カゲツ", FORCE_ENEMY, condition_true, "MID_BT6")
	
	
	EventEntryBattleTalk(Talk, "", FORCE_ENEMY, "PID_ジェーデ", FORCE_ALLY, true, "戦闘前会話_ジェーデ_済", "MID_BT7");
	
	
	-- ジェーデ仲間入り
	EventEntryTalk(ジェーデ加入_リュール,		g_pid_lueur,		FORCE_PLAYER, "PID_ジェーデ", FORCE_ALLY,	true, "ジェーデ会話_リュール_済")
	EventEntryTalk(ジェーデ加入_ディアマンド,	"PID_ディアマンド", FORCE_PLAYER, "PID_ジェーデ", FORCE_ALLY,	true, "ジェーデ会話_ディアマンド_済")
	
	EventEntryTalk(Talk,						g_pid_lueur,		FORCE_PLAYER, "PID_ジェーデ", FORCE_PLAYER, true, "ジェーデ会話_リュール_済",		"MID_TK1")
	EventEntryTalk(Talk,						"PID_ディアマンド",	FORCE_PLAYER, "PID_ジェーデ", FORCE_PLAYER, true, "ジェーデ会話_ディアマンド_済",	"MID_TK3")
	
	-- ジェーデ死亡
	EventEntryDie(EmptyFunction, "PID_ジェーデ", FORCE_ALL, "S_死亡セリフ_ジェーデ_済")
	
	EventEntryPickup(アイビー_行動開始, "PID_M009_アイビー", "アイビー_行動開始_済");
	EventEntryBattleBefore(アクスナイト_交戦開始, "PID_M009_イルシオン兵_アクスナイト",FORCE_ENEMY, "", FORCE_ALL,	true, "アクスナイト_交戦開始_済");	
	EventEntryTurn( アイビーアクティブ, -1, -1, FORCE_PLAYER, condition_アイビーアクティブ )
	
	-- カゲツ戦闘後北アーマー隊アクティブ化
	EventEntryBattleBefore(カゲツ_戦闘開始, "PID_M009_カゲツ",FORCE_ENEMY, "", FORCE_ALL);
	-- ゼルコバ戦闘後北アーマー隊アクティブ化
	EventEntryBattleBefore(ゼルコバ_戦闘開始, "PID_M009_ゼルコバ",FORCE_ENEMY, "", FORCE_ALL);
end


function Cleanup()
	
	Log("Cleanup");
	
end

-- -----------------------------------

function Opening()
	
	Log("Opening");
	
	PuppetDemo("M009", "MID_OP1")
		
	FadeInAndWait(FADE_NORMAL)
		Movie("S13")
		SkipEscape()
		
		Movie("Scene14")
		SkipEscape()
	FadeOutAndWait(FADE_NORMAL)
	
end

function MapOpening()
	
	Log("MapOpening");
	
	CursorSetPos_FromPid_DistanceModeNear(g_pid_lueur);
	FadeWait();
	
	Talk("MID_OP3");
	
end

-- -----------------------------------

function EmptyFunction()
end

function アイビー_行動開始()
	
	AiSetActive("PID_M009_ゼルコバ", true)
	AiSetActive("PID_M009_カゲツ", true)
	AiSetActive("M009_異形兵_シーフ_1", true)
	AiSetActive("M009_異形兵_シーフ_2", true)
	AiSetActive("M009_異形兵_ソードファイター_1", true)
	AiSetActive("M009_異形兵_ソードファイター_2", true)
	
end

function カゲツ_戦闘開始()
	
	if DifficultyGet() == DIFFICULTY_NORMAL
		or DifficultyGet() == DIFFICULTY_HARD then
			return false
	end
	
	-- AI変更
	AiSetSequence("PID_M009_イルシオン兵_ランスアーマー隊", AI_ORDER_ATTACK, "AI_AT_Attack")
	AiSetSequence("PID_M009_イルシオン兵_ランスアーマー隊", AI_ORDER_CAUSE, "AI_AC_Everytime")
	AiSetSequence("PID_M009_イルシオン兵_ランスアーマー隊", AI_ORDER_MOVE, "AI_MV_WeakEnemy")
	
end

function ゼルコバ_戦闘開始()
	
	if DifficultyGet() == DIFFICULTY_NORMAL
		or DifficultyGet() == DIFFICULTY_HARD then
			return false
	end
	
	-- AI変更
	AiSetSequence("PID_M009_イルシオン兵_アクスアーマー隊", AI_ORDER_ATTACK, "AI_AT_Attack")
	AiSetSequence("PID_M009_イルシオン兵_アクスアーマー隊", AI_ORDER_CAUSE, "AI_AC_Everytime")
	AiSetSequence("PID_M009_イルシオン兵_アクスアーマー隊", AI_ORDER_MOVE, "AI_MV_WeakEnemy")
	
end

function アクスナイト_交戦開始()
end

function condition_アイビーアクティブ()
	
	if VariableGet( "アイビーアクティブ_済" ) == 1 then
		return false
	end
	
	if VariableGet( "アクスナイト_交戦開始_済" ) == 1 then
		return true
	end
	
	return false
	
end

function アイビーアクティブ()
	
	VariableSet( "アイビーアクティブ_済", 1 )
	
end

function 進撃開始直後イベント()
	
	MapCameraWait()
	
	CursorSetPos_FromPid("PID_ジェーデ");
	Talk("MID_OP4");
	
	Tutorial("TUTID_会話")
	
end

function 敵１ターンめイベント()
	
	CursorSetPos_FromPid("PID_M009_アイビー")
	
	Talk("MID_EV1")
	
end

function ジェーデ加入_リュール()
	Talk("MID_TK1");
	ジェーデ加入();
end

function ジェーデ加入_ディアマンド()
	Talk("MID_TK2");
	ジェーデ加入();
end

function ジェーデ加入()
	pid = "PID_ジェーデ";
	if UnitExistOnMap( pid ) then
		UnitJoin( pid )
	end
end

-- -----------------------------------

function 砦到着_カゲツ()
	CursorSetPos_FromPid( "PID_M009_カゲツ" );
	Talk( "MID_EV14" );
	
	-- 増援
	Dispos("Enemy_Kagetsu_Fort", DISPOS_FLAG_NONE)
	Yield()
	WaitTime(0.5);
	
	-- AI変更
	AiSetSequence("PID_M009_カゲツ", AI_ORDER_ATTACK, "AI_AT_Attack")
	AiSetSequence("PID_M009_カゲツ", AI_ORDER_CAUSE, "AI_AC_AttackRange")
	AiSetSequence("PID_M009_カゲツ", AI_ORDER_MOVE, "AI_MV_WeakEnemy")
	
	-- 再度非アクティブにする
	AiSetActive("PID_M009_カゲツ", false)
			
	
	VariableSet( "砦到着_カゲツ_済", 1 );
	
	-- アイビーがアクティブ状態ならアクティブに
	if VariableGet( "アイビー_行動開始_済" ) == 1 then
	
	AiSetActive("PID_M009_カゲツ", true)
	AiSetActive("M009_異形兵_ソードファイター_1", true)
	AiSetActive("M009_異形兵_ソードファイター_2", true)	
	end
end

function 判定_砦到着_カゲツ()
	pid = "PID_M009_カゲツ"
	x = 15
	z = 16
	
	-- ------------------
	
	if VariableGet( "砦到着_カゲツ_済" ) == 1 then
		return false
	end
	
	if not UnitExistOnMap( pid ) then
		return false
	end
	
	-- ------------------
	
	return 指定座標にいるか判定(pid, x, z)
end

-- -----------------------------------

function 砦到着_ゼルコバ()
	CursorSetPos_FromPid( "PID_M009_ゼルコバ" );
	Talk( "MID_EV15" );
	
	-- 増援
	Dispos("Enemy_Zelkova_Fort", DISPOS_FLAG_NONE)
	Yield()
	WaitTime(0.5);
	
	-- AI変更
	AiSetSequence("PID_M009_ゼルコバ", AI_ORDER_ATTACK, "AI_AT_Attack")
	AiSetSequence("PID_M009_ゼルコバ", AI_ORDER_CAUSE, "AI_AC_AttackRange")
	AiSetSequence("PID_M009_ゼルコバ", AI_ORDER_MOVE, "AI_MV_WeakEnemy")
	
	-- 再度非アクティブにする
	AiSetActive("PID_M009_ゼルコバ", false)
			
	VariableSet( "砦到着_ゼルコバ_済", 1 );
	
	-- アイビーがアクティブ状態ならアクティブに
	if VariableGet( "アイビー_行動開始_済" ) == 1 then
	
	AiSetActive("PID_M009_ゼルコバ", true)
	AiSetActive("M009_異形兵_シーフ_1", true)
	AiSetActive("M009_異形兵_シーフ_2", true)	
	end
end

function 判定_砦到着_ゼルコバ()
	pid = "PID_M009_ゼルコバ"
	x = 15
	z = 2
	
	-- ------------------
	
	if VariableGet( "砦到着_ゼルコバ_済" ) == 1 then
		return false
	end
	
	if not UnitExistOnMap( pid ) then
		return false
	end
	
	-- ------------------
	
	return 指定座標にいるか判定(pid, x, z)
end

-- -----------------------------------

function 指定座標にいるか判定(pid, x, z)
	_x = UnitGetX(pid)
	_z = UnitGetZ(pid)
	
	if ( _x == x ) and ( _z == z ) then
		return true
	else
		return false
	end
end

-- -----------------------------------

function ターン５_緑軍AI設定()

	AiSetSequence("PID_ジェーデ", AI_ORDER_MOVE, "AI_MV_Position", "pos(12, 9)");
end

-- -----------------------------------

function MapEnding()
	
	Log("MapEnding");
	
end

function Ending()
	
	Log("Ending");
	
end

function GameOver()
	
	Log("GameOver");
	
end
