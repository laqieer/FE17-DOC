Include("Common")
g_pid_lueur = "PID_リュール"


-- -----------------------------------

function Startup()
	
	Log("Startup")
	
	Startup_紋章士外伝_対象紋章士を一時的に無効化( "GID_アイク" )
	
	-- 勝利条件の設定
	WinRuleSetDestroyBoss( true )	-- 敵将撃破
	WinRuleSetMID( "MID_RULE_S005_WIN" )
	
--	変数登録()
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
	EventEntryBattleTalk(Talk, "PID_S005_アイク", FORCE_ENEMY, g_pid_lueur,			FORCE_PLAYER, true, "戦闘前会話_アイク_リュール_済", "MID_BT1")
	EventEntryBattleTalk(Talk, "PID_S005_アイク", FORCE_ENEMY, "PID_ミスティラ",	FORCE_PLAYER, true, "戦闘前会話_アイク_ミスティラ_済", "MID_BT2")
	EventEntryBattleTalk(Talk, "PID_S005_アイク", FORCE_ENEMY, "PID_フォガート",	FORCE_PLAYER, true, "戦闘前会話_アイク_フォガート_済", "MID_BT3")
	
	EventEntryDestroy(拠点破壊, 8, 15, 12, 15)


	if DifficultyGet() == DIFFICULTY_NORMAL then
		-- 増援
		EventEntryTurn(増援４ターン目, 5, 5, FORCE_PLAYER)
		EventEntryTurn(増援５ターン目, 6, 6, FORCE_PLAYER)
		EventEntryTurn(増援７ターン目, 8, 8, FORCE_PLAYER)
		EventEntryTurn(増援８ターン目, 9, 9, FORCE_PLAYER)
		EventEntryTurn(増援１２以降  ,12,13, FORCE_PLAYER)

	elseif DifficultyGet() == DIFFICULTY_LUNATIC then
		-- 増援
	--	EventEntryTurn(増援３ターン目, 3, 3, FORCE_PLAYER)
		EventEntryTurn(増援４ターン目, 4, 4, FORCE_PLAYER)
		EventEntryTurn(増援５ターン目, 5, 5, FORCE_PLAYER)
		EventEntryTurn(増援６ターン目, 6, 6, FORCE_PLAYER)
		EventEntryTurn(増援７ターン目, 7, 7, FORCE_PLAYER)
		EventEntryTurn(増援８ターン目, 8, 8, FORCE_PLAYER)
		EventEntryTurn(増援１２以降  ,11,20, FORCE_PLAYER)

	else
		-- 増援
		EventEntryTurn(増援４ターン目, 4, 4, FORCE_PLAYER)
		EventEntryTurn(増援５ターン目, 5, 5, FORCE_PLAYER)

		EventEntryTurn(増援７ターン目, 7, 7, FORCE_PLAYER)
		EventEntryTurn(増援８ターン目, 8, 8, FORCE_PLAYER)
		EventEntryTurn(増援１２以降  ,12,20, FORCE_PLAYER)

	end




end

-- -----------------------------------

function Cleanup()
	
	Log("Cleanup")

	Cleanup_紋章士外伝_対象紋章士の無効化解除( "GID_アイク" )
	
end

-- -----------------------------------

function Opening()
	
	Log("Opening")
	
	PuppetDemo("S005", "MID_OP1")
	
end

function MapOpening()
	
	Log("MapOpening")
	
end

function 開始直後()
	
	CursorAnimeCreate_FromPid("PID_S005_アイク")
	Talk( "MID_EV1" )
	CursorAnimeDelete()
	
end

-- ---------------------------------------------------------

function 増援３ターン目()

	Dispos("Enemy_ReinforcementD", DISPOS_FLAG_FOCUS)
	Yield()
	WaitTime(0.5)
end
function 増援４ターン目()

	Dispos("Enemy_ReinforcementD", DISPOS_FLAG_FOCUS)
	Yield()
	WaitTime(0.5)
--	Dispos("Enemy_ReinforcementR", DISPOS_FLAG_FOCUS)
--	Yield()
--	WaitTime(0.5)
end

function 増援５ターン目()
	CursorAnimeCreate_FromPid("PID_S005_アイク")
	Talk("MID_EV2")
	CursorAnimeDelete()


	Dispos("Enemy_ReinforcementU", DISPOS_FLAG_FOCUS)
	Yield()
	WaitTime(0.5)
--	Dispos("Enemy_ReinforcementL", DISPOS_FLAG_FOCUS)
--	Yield()
--	WaitTime(0.5)
end

function 増援６ターン目()
	Dispos("Enemy_ReinforcementU", DISPOS_FLAG_FOCUS)
	Yield()
	WaitTime(0.5)
	Dispos("Enemy_ReinforcementD", DISPOS_FLAG_FOCUS)
	Yield()
	WaitTime(0.5)
end

function 増援７ターン目()
--	Dispos("Enemy_ReinforcementD", DISPOS_FLAG_FOCUS)
--	Yield()
--	WaitTime(0.5)
	Dispos("Enemy_ReinforcementL", DISPOS_FLAG_FOCUS)
	Yield()
	WaitTime(0.5)
end
function 増援８ターン目()
	Dispos("Enemy_ReinforcementR", DISPOS_FLAG_FOCUS)
	Yield()
	WaitTime(0.5)
--	Dispos("Enemy_ReinforcementU", DISPOS_FLAG_FOCUS)
--	Yield()
--	WaitTime(0.5)
end

function 増援１２以降()
	Dispos("Enemy_ReinforcementU", DISPOS_FLAG_FOCUS)
	Yield()
	WaitTime(0.5)
	Dispos("Enemy_ReinforcementL", DISPOS_FLAG_FOCUS)
	Yield()
	WaitTime(0.5)
--	Dispos("Enemy_ReinforcementD", DISPOS_FLAG_FOCUS)
--	Yield()
--	WaitTime(0.5)
	Dispos("Enemy_ReinforcementR", DISPOS_FLAG_FOCUS)
	Yield()
	WaitTime(0.5)
end

-- -----------------------------------

function 拠点破壊()
	-- EventBrokenObject(8, 14)
	
	--	建物を平地に
	TerrainSetBegin()
	TerrainSet( 9,11, "TID_平地" )
	TerrainSet(10,11, "TID_平地" )
	TerrainSet(11,11, "TID_平地" )

	TerrainSet( 8,12, "TID_平地" )
	TerrainSet( 9,12, "TID_平地" )
	TerrainSet(10,12, "TID_平地" )
	TerrainSet(11,12, "TID_平地" )
	TerrainSet(12,12, "TID_平地" )

	TerrainSet( 8,13, "TID_平地" )
	TerrainSet( 9,13, "TID_平地" )
	TerrainSet(10,13, "TID_平地" )
	TerrainSet(11,13, "TID_平地" )
	TerrainSet(12,13, "TID_平地" )

	TerrainSet( 8,14, "TID_平地" )
	TerrainSet( 9,14, "TID_平地" )
	TerrainSet(10,14, "TID_平地" )
	TerrainSet(11,14, "TID_平地" )
	TerrainSet(12,14, "TID_平地" )
	TerrainSetEnd()
end

-- -----------------------------------


function MapEnding()
	
	Log("MapEnding")
	
end

function Ending()
	
	Log("Ending")
	
	PuppetDemo("S005", "MID_ED1")
	
	紋章士外伝_レベルキャップ開放( "アイク", "S005" )
	
end

function GameOver()
	
	Log("GameOver")
	
end



