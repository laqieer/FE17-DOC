Include("Common")
g_pid_lueur		= "PID_リュール"
map_width		= 22
map_height		= 24

g_key_dragonPulse = "竜脈_済"

-- -----------------------------------

function Startup()
	
	Log("Startup")
	
	Startup_紋章士外伝_対象紋章士を一時的に無効化( "GID_カムイ" )
	
	-- 勝利条件の設定
	WinRuleSetDestroyBoss( true )	-- 敵将撃破
	WinRuleSetMID( "MID_RULE_S007_WIN" )
	
	変数登録()
	イベント登録()
	
end

-- -----------------------------------

function 変数登録()
	
	VariableEntry( g_key_dragonPulse, 0 )
	
end

-- -----------------------------------

function イベント登録()
	EventEntryBattleTalk(Talk, "PID_S007_カムイ", FORCE_ENEMY, g_pid_lueur,		FORCE_PLAYER, true, "戦闘前会話_カムイ_リュール_済", "MID_BT1")
	EventEntryBattleTalk(Talk, "PID_S007_カムイ", FORCE_ENEMY, "PID_セアダス",	FORCE_PLAYER, true, "戦闘前会話_カムイ_セアダス_済", "MID_BT2")
	
	EventEntryTurn(はじまりイベント, 1, 1, FORCE_PLAYER)
	EventEntryTurn(勝利条件, 1, 1, FORCE_PLAYER)
	
	EventEntryTurn(増援１, 2, 2, FORCE_PLAYER)
	
	EventEntryTurnEnd(竜脈, 3, 3, FORCE_ENEMY, condition_竜脈)
	EventEntryTurnEnd(竜脈, 4, 4, FORCE_ENEMY, condition_竜脈_ノーマル)
end

-- -----------------------------------

function Cleanup()
	
	Log("Cleanup")
	
	Cleanup_紋章士外伝_対象紋章士の無効化解除( "GID_カムイ" )
	
end

-- -----------------------------------

function Opening()
	
	Log("Opening")
	
	PuppetDemo("S007", "MID_OP1")
	
end

function MapOpening()
	
	Log("MapOpening")
	
	FadeOutAndWait( FADE_FAST )
	
	FadeIn( FADE_FAST )
	
end

-- -----------------------------------

function はじまりイベント()
	
	CursorSetPos_FromPid( "PID_S007_カムイ" )
	
	--TalkBeginContinue()
		Talk( "MID_EV1" )
		Talk( "MID_EV2" )
	--TalkEndContinue()
	
end

function 増援１()
	
	Dispos( "Reinforcement1_1", DISPOS_FLAG_FOCUS )
	Yield()
	
	Dispos( "Reinforcement1_2", DISPOS_FLAG_FOCUS )
	Yield()
	
end

-- -----------------------------------

function condition_竜脈()
	
	if VariableGet( g_key_dragonPulse ) == 1 then
		return false
	end
	
	if DifficultyGet() > DIFFICULTY_NORMAL then
		return true
	end
	
	return false
	
end

function condition_竜脈_ノーマル()
	
	if VariableGet( g_key_dragonPulse ) == 1 then
		return false
	end
	
	if DifficultyGet() == DIFFICULTY_NORMAL then
		return true
	end
	
	return false
	
end

function 竜脈()
	
	CursorSetPos_FromPid( "PID_S007_カムイ" )
	Talk( "MID_EV3" )
	
	CursorSetPos( 11, 12 )
	MapCameraWait()
	
	EffectPlay( "カムイ竜脈", 11, 12 )
	EffectWait()
	
	マップ全体の地形変化( "TID_浅瀬", "TID_平地" )
	炎上配置()
	
	MapObjectAction( 11, 12, MAP_ACTION_DONE )
	MapMaterialSetFloat( "Terrain_Near", "Mt_Terrain_Bmap", "_RoughnessToWhite", 0 )
	MapMaterialSetFloat( "Terrain_Near", "Mt_Terrain_Combat", "_RoughnessToWhite", 0 )
	
	WaitTime( 1.0 )
	
	VariableSet( g_key_dragonPulse, 1 )
	
end

function マップ全体の地形変化( fromTid, toTid )
	
	TerrainSetBegin()
	for x = 0, map_width-1 do
		for z = 0, map_height-1 do
			if TerrainGet(x, z) == fromTid then
				TerrainSet(x, z, toTid)
			end
		end
	end
	TerrainSetEnd()
	
end

function 炎上配置()
	
	local fireList = {
		{  8,  1 },	{  9,  1 },	{ 10,  3 },	{ 11,  7 },
		{ 12,  9 },	{ 13, 10 },	{ 14, 10 },
		{  9, 11 },	{ 10, 11 },	{ 12, 12 },	{ 13, 12 },
		{  8, 13 },	{ 15, 13 },	{ 10, 14 },	{ 15, 15 },
		{  7, 16 },	{  5, 18 },	{  6, 18 },	{ 15, 18 },
		{ 17, 20 },	{ 18, 20 },	{  4, 22 },	{ 18, 22 }
	}
	
	MapOverlapSetBegin()
	for index in pairs( fireList ) do
		MapOverlapSet( fireList[index][1], fireList[index][2], "TID_炎上" )
	end
	MapOverlapSetEnd()
	
end

-- -----------------------------------

function MapEnding()
	
	Log("MapEnding")
	
end

function Ending()
	
	Log("Ending")

	PuppetDemo("S007", "MID_ED1")
	
	紋章士外伝_レベルキャップ開放( "カムイ", "S007" )

end

function GameOver()
	
	Log("GameOver")
	
end
