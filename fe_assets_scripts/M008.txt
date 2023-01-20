Include("Common")

-- -----------------------------------

function Startup()
	
	Log("Startup")
	
	-- 勝利条件の設定
	WinRuleSetDestroyBoss( true )	-- 敵将撃破
	WinRuleSetMID( "MID_RULE_M008_WIN" )
	LoseRuleSetMID( "MID_RULE_M008_LOSE" )
	
	フラグ登録()
	
	イベント登録()
	
end

function フラグ登録()
	VariableEntry( "アイビー動くよイベント再生_済", 0 )
	VariableEntry( "臣下死亡", 0 )
	VariableEntry( "カゲツ死亡", 0 )
	VariableEntry( "ゼルコバ死亡", 0 )
	
end

function イベント登録()
	
	-- 勝利条件
	EventEntryBreakdownEnemy(VariableSet, 8,	19, "防衛エリア_8_19_済",	"敗北", 1)
	EventEntryBreakdownEnemy(VariableSet, 9,	19, "防衛エリア_9_19_済",	"敗北", 1)
	EventEntryBreakdownEnemy(VariableSet, 10,	19, "防衛エリア_10_19_済",	"敗北", 1)
	EventEntryBreakdownEnemy(VariableSet, 11,	19, "防衛エリア_11_19_済",	"敗北", 1)
	EventEntryBreakdownEnemy(VariableSet, 12,	19, "防衛エリア_12_19_済",	"敗北", 1)
	
	-- イベント登録
	EventEntryTurn(進撃開始直後イベント, 1, 1,  FORCE_PLAYER)
	EventEntryTurn(勝利条件_敵将フォーカス, 1, 1, FORCE_PLAYER, condition_true, "PID_M008_アイビー")
	EventEntryTurnAfter(弓砲台チュートリアル, 2, 2,  FORCE_PLAYER)
	EventEntryPickup(チュートリアル_ロイ, "PID_ディアマンド", "チュートリアル_ロイ_済")
	
	-- カゲツ
	EventEntryBattleTalk(Talk, "", FORCE_PLAYER, "PID_M008_カゲツ", FORCE_ENEMY, true, "戦闘前会話_カゲツ_済", "MID_BT6")
	EventEntryDie(カゲツ死亡イベント, "PID_M008_カゲツ", FORCE_ENEMY, "カゲツ死亡")
	
	-- ゼルコバ
	EventEntryBattleTalk(Talk, "", FORCE_PLAYER, "PID_M008_ゼルコバ", FORCE_ENEMY, true, "戦闘前会話_ゼルコバ_済", "MID_BT4")
	EventEntryDie(ゼルコバ死亡イベント, "PID_M008_ゼルコバ", FORCE_ENEMY, "ゼルコバ死亡")
	
	-- アイビー
	EventEntryBattleTalk(Talk, "PID_リュール", FORCE_PLAYER, "PID_M008_アイビー", FORCE_ENEMY, true, "戦闘前会話_主人公VSアイビー_済", "MID_BT2")
	EventEntryBattleTalk(Talk, "", FORCE_PLAYER, "PID_M008_アイビー", FORCE_ENEMY, true, "戦闘前会話_青軍VSアイビー_済", "MID_BT1")
	EventEntryDie(Talk, "PID_M008_アイビー", FORCE_ENEMY, condition_true, "MID_BT3")
	
	-- 増援
	EventEntryTurn(アイビー_どんどん増援, 2, 2, FORCE_PLAYER)
	EventEntryTurn(増援１, 2, 2, FORCE_PLAYER)
	EventEntryTurn(増援２, 3, 3, FORCE_PLAYER)
	EventEntryTurn(増援３, 4, 4, FORCE_PLAYER)
	EventEntryTurn(増援４, 5, 5, FORCE_PLAYER)
	EventEntryTurn(増援５, 7, 7, FORCE_PLAYER)
	
	EventEntryTurn(増援_Normal_１, 2, 2, FORCE_PLAYER)
	EventEntryTurn(増援_Normal_２, 3, 3, FORCE_PLAYER)
	EventEntryTurn(増援_Normal_３, 4, 4, FORCE_PLAYER)
	EventEntryTurn(増援_Normal_４, 5, 5, FORCE_PLAYER)
	
	EventEntryTurn(増援_Lunatic_６, 7, 7, FORCE_PLAYER)
	-- （アイビー）ターン経過のチェック
	EventEntryTurnAfter(アイビー_そろそろ動く, -1, 7, FORCE_PLAYER, condition_アイビー動けるかチェック)
	
end


function Cleanup()
	
	Log("Cleanup")
	
end

-- -----------------------------------

function Opening()
	
	Log("Opening")
	
	--SceneLoad("Fld_M004")
	--main = CameraGetMain()
	--CameraSetMain("CastleView_Opening")
		
	PuppetDemo("M008", "MID_OP1")
	
	FadeInAndWait(FADE_NORMAL)
		Movie("S11")
		SkipEscape()
	FadeOutAndWait(FADE_NORMAL)
	
	PuppetDemo("M008", "MID_OP2")
	PuppetDemo("M008", "MID_OP3")
	
	FadeInAndWait(FADE_NORMAL)
		Movie("Kengen04")
		SkipEscape()
	FadeOutAndWait(FADE_NORMAL)
	
	PuppetDemo("M008", "MID_OP4")
	
	FadeInAndWait(FADE_NORMAL)
		Movie("S12")
		SkipEscape()
	FadeOutAndWait(FADE_NORMAL)
	
	PuppetDemo("M008", "MID_OP5")
	
	--CameraSetMain(main)
	--SceneUnload()
	
end

function MapOpening()
	
	Log("MapOpening")
	
	-- スタート地点にとぶ
	CursorSetPos(10, 17)
	CursorSetDistanceMode(CURSOR_DISTANCE_NEAR)
	MapCameraWait()
	
	UnitSetEngageCount("PID_ディアマンド", 7)
	
end

-- -----------------------------------------------------------------------------


function 進撃開始直後イベント()
	
	Dispos("Ally_Amber", DISPOS_FLAG_FOCUS)
	Yield()
	
	Talk("MID_EV1")
	
	UnitMovePos("PID_アンバー",  8, 16)
	UnitMoveWait()
	
	-- 緑軍→青軍
	UnitJoin( "PID_ディアマンド", "PID_アンバー" )
	
	UnitRotation("PID_アンバー", ROTATE_DOWN)
	UnitMoveWait()
	
	WaitTime(1.0)
	
	CursorSetPos(10, 19)
	MapCameraWait()
	
	CursorAnimeCreate( 8, 19, "W5H1" )
	Talk("MID_EV2")
	CursorAnimeDelete()
	
end

function 弓砲台チュートリアル()
	
	CursorSetPos_FromPid("PID_リュール")
	Talk("MID_EV3")
	
	CursorAnimeCreate(10, 11)
	CursorAnimeDelete()
	
	Tutorial("TUTID_弓砲台")
end

function アイビー_どんどん増援()
	
	CursorSetPos_FromPid("PID_M008_アイビー")
	Talk("MID_EV5")
	
end

function チュートリアル_ロイ()
	
	Talk( "MID_EV4" )
	
	Tutorial("TUTID_紋章士ロイ")
	
end

-- -----------------------------------------------------------------------------

function 増援１()
	
	if DifficultyGet() == DIFFICULTY_NORMAL then
		return false
	end
	
	Dispos("Enemy_Reinforcement0", DISPOS_FLAG_FOCUS)
	Yield()
	WaitTime(0.5)
	
end

function 増援２()
	
	if DifficultyGet() == DIFFICULTY_NORMAL then
		return false
	end
	
	Dispos("Enemy_Reinforcement1", DISPOS_FLAG_FOCUS)
	Yield()
	UnitMoveWait()
	
	UnitRotation("PID_M008_イルシオン兵_ソードペガサス_増援上向き", ROTATE_UP)
	UnitRotation("PID_M008_イルシオン兵_ソードペガサス_増援上向き2", ROTATE_UP)
	UnitMoveWait()
	
	WaitTime(0.5)
	
end

function 増援３()
	
	if DifficultyGet() == DIFFICULTY_NORMAL then
		return false
	end
	
	Dispos("Enemy_Reinforcement2", DISPOS_FLAG_FOCUS)
	Yield()
	WaitTime(0.5)
	
	Dispos("Enemy_Reinforcement2_1", DISPOS_FLAG_FOCUS)
	Yield()
	WaitTime(0.5)
	
end

function 増援４()
	
	if DifficultyGet() == DIFFICULTY_NORMAL then
		return false
	end
	
	Dispos("Enemy_Reinforcement3", DISPOS_FLAG_FOCUS)
	Yield()
	WaitTime(0.5)
	
end

function 増援５()
	
	if DifficultyGet() == DIFFICULTY_NORMAL then
		return false
	end
	
	Dispos("Enemy_Reinforcement4", DISPOS_FLAG_FOCUS)
	Yield()
	WaitTime(0.5)
		
	Dispos("Enemy_Reinforcement4_1", DISPOS_FLAG_FOCUS)
	Yield()
	WaitTime(0.5)
	
end

-- -----------------------------------------------------------------------------

function 増援_Normal_１()
	
	Dispos("Enemy_Reinforcement0_Normal", DISPOS_FLAG_FOCUS)
	Yield()
	WaitTime(0.5)
	
end

function 増援_Normal_２()
	
	Dispos("Enemy_Reinforcement1_Normal", DISPOS_FLAG_FOCUS)
	Yield()
	WaitTime(0.5)
	
end

function 増援_Normal_３()
	
	Dispos("Enemy_Reinforcement2_Normal", DISPOS_FLAG_FOCUS)
	Yield()
	WaitTime(0.5)
	
end

function 増援_Normal_４()
	
	Dispos("Enemy_Reinforcement3_Normal", DISPOS_FLAG_FOCUS)
	Yield()
	WaitTime(0.5)
	
end

-- -----------------------------------------------------------------------------

function 増援_Lunatic_６()
	
	if DifficultyGet() == DIFFICULTY_NORMAL
		or DifficultyGet() == DIFFICULTY_HARD then
			return false
	end
	
	Dispos("Enemy_Reinforcement６_Lunatic1", DISPOS_FLAG_FOCUS)
	Yield()
	WaitTime(0.5)
	
	Dispos("Enemy_Reinforcement６_Lunatic1_1", DISPOS_FLAG_FOCUS)
	Yield()
	WaitTime(0.5)
	
end

-- -----------------------------------------------------------------------------

function アイビー_そろそろ動く()
	
	-- 戦闘会話済みならMID_EV6を再生しない
	if(VariableGet( "戦闘前会話_主人公VSアイビー_済" ) == 0)
		and(VariableGet( "戦闘前会話_青軍VSアイビー_済" ) == 0)then
		
		CursorSetPos_FromPid("PID_M008_アイビー")
		Talk("MID_EV6")
	end
	
	-- みんなのAIを変更する
	index = ForceUnitGetFirst(FORCE_ENEMY)
	while index != nil do
		AiSetSequence(index, AI_ORDER_MOVE, "AI_MV_BreakDown")
		index = ForceUnitGetNext(index)
	end
	
	-- 再びこのイベントが再生されないように、実行済みフラグを立てておく
	VariableSet( "アイビー動くよイベント再生_済", 1 )
end

function condition_アイビー動けるかチェック() -- 下３つのフラグのどれかが満たされたとき「アイビー_そろそろ動く」が再生される
	
	-- 既にこのイベントが処理されていたらfalse
	if VariableGet( "アイビー動くよイベント再生_済" ) == 1 then
		return false
	end
	
	-- 臣下二人が死亡したかチェック
	if VariableGet( "臣下死亡" ) == 1 then
		return true
	end
	
	-- ７ターンになったかチェック
	if MapGetTurn() >= 7 then
		return true
	end
	
	return false
	
end

function カゲツ死亡イベント()
	
	if VariableGet("ゼルコバ死亡") == 1 then
		VariableSet( "臣下死亡", 1 )
	end
	
	Talk("MID_BT7")
	
end

function ゼルコバ死亡イベント()
	
	if VariableGet("カゲツ死亡") == 1 then
		VariableSet( "臣下死亡", 1 )
	end
	
	Talk("MID_BT5")
	
end

-- ----------------------------------------------------------------------------

function MapEnding()
	
	-- MID_EV7 は パペットデモに変更になりました。MID_ED1の直前で再生させています。
	-- Talk("MID_EV7")
	
	Log("MapEnding")
	
end

function Ending()
	
	Log("Ending")
	
end

function GameOver()
	
	Log("GameOver")
	
end
