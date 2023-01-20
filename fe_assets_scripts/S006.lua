Include("Common")
g_pid_lueur					= "PID_リュール"
g_pid_byleth				= "PID_S006_ベレト"

g_key_battled				= "戦闘開始_ベレト周辺"
g_key_entryArea				= "エリア進入_済"
g_key_changedAI				= "AI変更_済"
g_key_changedAI2			= "AI変更2_済"
g_key_changedAI2_Permssn	= "AI変更2_許可"
g_key_byleth_on_inmovable	= "ベレト不動設定"
g_key_byleth_off_inmovable	= "ベレト不動解除"

g_CrystalMaxNum				= 19
g_key_CrystalBrokenNum		= "破壊クリスタル数"

g_key_battleTalk_byleth_lueur		= "戦闘前会話_ベレト_リュール_済"
g_key_battleTalk_byleth_holtencia	= "戦闘前会話_ベレト_オルテンシア_済"

-- -----------------------------------

function Startup()
	
	Log("Startup")
	
	Startup_紋章士外伝_対象紋章士を一時的に無効化( "GID_ベレト" )
	
	-- 勝利条件の設定
	WinRuleSetDestroyBoss( true )	-- 敵将撃破
	WinRuleSetMID( "MID_RULE_S006_WIN" )
	
	変数登録()
	イベント登録()
	
end

-- -----------------------------------

function 変数登録()
	VariableEntry( g_key_battled,				0 )
	VariableEntry( g_key_entryArea,				0 )
	VariableEntry( g_key_changedAI,				0 )
	VariableEntry( g_key_changedAI2,			0 )
	VariableEntry( g_key_changedAI2_Permssn,	0 )
	VariableEntry( g_key_CrystalBrokenNum,		0 )
	VariableEntry( g_key_byleth_on_inmovable,	0 )
	VariableEntry( g_key_byleth_off_inmovable,	0 )
end

-- -----------------------------------

function イベント登録()
	
	EventEntryTurn(開始直後, 1, 1, FORCE_PLAYER)
	EventEntryTurn(勝利条件, 1, 1, FORCE_PLAYER)
	
	EventEntryTurn(増援,		 7,	 7,	FORCE_PLAYER)
	EventEntryTurn(増援,		 9,	 9,	FORCE_PLAYER, condition_増援ハード以上)
	EventEntryTurn(無限増援,	11,	-1,	FORCE_PLAYER, condition_増援ルナ以上)
	
	EventEntryBattleBefore(EmptyFunction, "", FORCE_PLAYER, "PID_S006_幻影兵_マスターモンク_ベレト側近",	FORCE_ENEMY, true, g_key_battled)
	EventEntryBattleBefore(EmptyFunction, "", FORCE_PLAYER, "PID_S006_幻影兵_スナイパー_ベレト側近",	FORCE_ENEMY, true, g_key_battled)
	EventEntryBattleBefore(EmptyFunction, "", FORCE_PLAYER, "PID_S006_幻影兵_エーデルガルト",	FORCE_ENEMY, true, g_key_battled)
	EventEntryBattleBefore(EmptyFunction, "", FORCE_PLAYER, "PID_S006_幻影兵_ディミトリ",		FORCE_ENEMY, true, g_key_battled)
	EventEntryBattleBefore(EmptyFunction, "", FORCE_PLAYER, "PID_S006_幻影兵_クロード",			FORCE_ENEMY, true, g_key_battled)
	
	EventEntryBattleTalk(Talk, g_pid_byleth, FORCE_ENEMY, g_pid_lueur,			FORCE_PLAYER, true, g_key_battleTalk_byleth_lueur,		"MID_BT1")
	EventEntryBattleTalk(Talk, g_pid_byleth, FORCE_ENEMY, "PID_オルテンシア",	FORCE_PLAYER, true, g_key_battleTalk_byleth_holtencia,	"MID_BT2")
	
	EventEntryArea(EmptyFunction,  1, 1, 19, 3, FORCE_PLAYER, g_key_entryArea)
	EventEntryArea(EmptyFunction,  1, 4,  3, 7, FORCE_PLAYER, g_key_entryArea)
	EventEntryArea(EmptyFunction,  4, 4,  4, 4, FORCE_PLAYER, g_key_entryArea)
	EventEntryArea(EmptyFunction, 17, 4, 19, 7, FORCE_PLAYER, g_key_entryArea)
	EventEntryArea(EmptyFunction,  7, 4, 13, 5, FORCE_PLAYER, g_key_entryArea)
	EventEntryTurnEnd(AI変更,	-1, -1,		FORCE_ENEMY,	condition_AI変更)
	EventEntryTurnEnd(AI変更,	 7,  7,		FORCE_ENEMY)
	
	EventEntryTurnAfter(ベレト不動設定, -1, -1, FORCE_ENEMY, condition_ベレト不動設定)
	EventEntryTurnEnd(	ベレト不動解除, -1, -1, FORCE_ENEMY, condition_ベレト不動解除)
	
	EventEntryTurn(VariableSet,	-1, -1,		FORCE_PLAYER,	condition_AI変更2_許可, g_key_changedAI2_Permssn, 1)
	EventEntryTurnEnd(AI変更2,	-1, -1,		FORCE_ENEMY,	condition_AI変更2)
	
	EventEntryDestroy(水晶破壊,  3, 24)
	EventEntryDestroy(水晶破壊,  5, 24)
	EventEntryDestroy(水晶破壊, 15, 24)
	EventEntryDestroy(水晶破壊, 17, 24)
	EventEntryDestroy(水晶破壊,  7, 23)
	EventEntryDestroy(水晶破壊, 13, 23)
	EventEntryDestroy(水晶破壊,  4, 20)
	EventEntryDestroy(水晶破壊, 16, 20)
	EventEntryDestroy(水晶破壊,  3, 19)
	EventEntryDestroy(水晶破壊,  4, 18)
	EventEntryDestroy(水晶破壊, 16, 18)
	EventEntryDestroy(水晶破壊, 17, 17)
	EventEntryDestroy(水晶破壊,  4, 16)
	EventEntryDestroy(水晶破壊, 16, 16)
	EventEntryDestroy(水晶破壊,  4, 14)
	EventEntryDestroy(水晶破壊, 16, 14)
	EventEntryDestroy(水晶破壊,  4, 12)
	EventEntryDestroy(水晶破壊, 16, 12)
	EventEntryDestroy(水晶破壊, 16,  9)
	
end

-- -----------------------------------

function Cleanup()
	
	Log("Cleanup")

	Cleanup_紋章士外伝_対象紋章士の無効化解除( "GID_ベレト" )
	
end

-- -----------------------------------

function Opening()
	
	Log("Opening")
	
	PuppetDemo("S006", "MID_OP1")
	
end

function MapOpening()
	
	Log("MapOpening")
	
end

-- -----------------------------------

function 開始直後()
	
	CursorSetPos_FromPid( g_pid_byleth )
	Talk( "MID_EV1" )
	
	CursorSetPos( 4, 20 )
	MapCameraWait()
	
	MapObjectCreate("Eff_Cursor01", "Effects/BMap/UI/Guide/Prefabs/Eff_Cursor_W1H1", 3, 19)
	MapObjectCreate("Eff_Cursor02", "Effects/BMap/UI/Guide/Prefabs/Eff_Cursor_W1H1", 4, 18)
	MapObjectCreate("Eff_Cursor03", "Effects/BMap/UI/Guide/Prefabs/Eff_Cursor_W1H1", 4, 20)
	WaitTime( 2.0 )
	
	Talk( "MID_EV2" )
	
	MapObjectDelete("Eff_Cursor01")
	MapObjectDelete("Eff_Cursor02")
	MapObjectDelete("Eff_Cursor03")
	
	Dialog( "MID_TUT_NAVI_S006_RULE" )
	
end

-- -----------------------------------

function EmptyFunction()
end

-- -----------------------------------

function condition_増援ハード以上()
	if モードはノーマル() then
		return false
	end
	
	return true
end

function condition_増援ルナ以上()
	if モードはノーマル() or モードはハード() then
		return false
	end
	
	local turn = MapGetTurn()
	if ( turn % 2 ) == 1 then
		return true
	end
	
	return false
end

function 増援()
	
	Dispos("Reinforcement1", DISPOS_FLAG_FOCUS)
	Yield()
	WaitTime(0.5)
	
end

function 無限増援()
	
	Dispos("Reinforcement2", DISPOS_FLAG_FOCUS)
	Yield()
	WaitTime(0.5)
	
end

-- -----------------------------------

function 水晶破壊()
	
	Dialog( "MID_TUT_NAVI_S006_BREAK" )
	
	local num = VariableGet( g_key_CrystalBrokenNum )
	num = num + 1
	VariableSet( g_key_CrystalBrokenNum, num )
	
	
	if ( num == g_CrystalMaxNum ) then
		水晶全破壊()
	end
	
end

function 水晶全破壊()
	
	-- 生き残り全員を攻撃AIに変更
	local index = ForceUnitGetFirst( FORCE_ENEMY )
	while index != nil do
		
		if AI変更_攻撃( index ) then
			
			local pid = UnitGetPID( index )
			
			if		( pid == g_pid_byleth ) then
				AiSetSequence(g_pid_byleth, AI_ORDER_ATTACK, "AI_AT_AttackToEngageDance", "1,1")
				
			elseif	( pid == "PID_S006_幻影兵_マスターモンク_ベレト側近" ) then
				AiSetSequence(pid, AI_ORDER_ATTACK, "AI_AT_RodWarp", "1,1")
				
			end
			
		end
		
		index = ForceUnitGetNext(index)	
		
	end
	
end

-- -----------------------------------

function condition_AI変更()
	if VariableGet( g_key_changedAI ) == 1 then
		return false
	end
	
	if		( VariableGet( g_key_entryArea ) == 1 )
		or	( VariableGet( g_key_battled ) == 1 )
		or	( VariableGet( g_key_battleTalk_byleth_lueur ) == 1 )
		or	( VariableGet( g_key_battleTalk_byleth_holtencia ) == 1 ) then
		return true
	end
	
	return false
end

function AI変更()
	
	if UnitExistOnMap( g_pid_byleth ) then
		AiSetSequence(g_pid_byleth, AI_ORDER_ATTACK, "AI_AT_EngageDance", "1,1")
		AiSetActive(g_pid_byleth, true)
	end
	
	AI変更_地形破壊( "PID_S006_幻影兵_エーデルガルト" )
	AI変更_地形破壊( "PID_S006_幻影兵_ディミトリ" )
	AI変更_地形破壊( "PID_S006_幻影兵_クロード" )
	
	
	local unit = ForceUnitGetFirst(FORCE_ENEMY)
	while unit != nil do
		
		local pid = UnitGetPID( unit )
		
		if ( pid == "PID_S006_幻影兵_マスターモンク_ベレト側近" ) then
			AiSetSequence(unit, AI_ORDER_ATTACK, "AI_AT_RodWarpFarZ")
			AiSetActive(unit, true)
			
		elseif ( pid == "PID_S006_幻影兵_スナイパー_ベレト側近" ) then
			AI変更_地形破壊( unit )
			
		end
		
		unit = ForceUnitGetNext(unit)	
	end
	
	
	VariableSet( g_key_changedAI, 1 )
	
end

-- -----------------------------------

function condition_ベレト不動設定()
	if	( VariableGet( g_key_byleth_on_inmovable ) == 1 ) then
		return false
	end
	
	if ( VariableGet( g_key_changedAI ) == 1 ) then
		return true
	end
	
	return false
end

function ベレト不動設定()
	スキル装備( g_pid_byleth, "SID_不動_隠蔽" )
	VariableSet( g_key_byleth_on_inmovable, 1 )
end

function condition_ベレト不動解除()
	if ( VariableGet( g_key_byleth_off_inmovable ) == 1 ) then
		return false
	end
	
	if ( VariableGet( g_key_byleth_on_inmovable ) == 1 ) then
		return true
	end
	
	return false
end

function ベレト不動解除()
	スキル解除( g_pid_byleth, "SID_不動_隠蔽" )
	VariableSet( g_key_byleth_off_inmovable, 1 )
end

-- -----------------------------------

function condition_AI変更2_許可()
	if ( VariableGet( g_key_changedAI2 ) == 0 )
		and ( VariableGet( g_key_changedAI ) == 1 ) then
			return true
	end
	
	return false
end

-- -----------------------------------

function condition_AI変更2()
	if VariableGet( g_key_changedAI2 ) == 1 then
		return false
	end
	
	if VariableGet( g_key_changedAI2_Permssn ) == 1 then
		return true
	end
	
	return false
end

function AI変更2()
	
	AI変更_地形破壊( g_pid_byleth )
	
	local unit = ForceUnitGetFirst(FORCE_ENEMY)
	while unit != nil do
		
		local pid = UnitGetPID( unit )
		
		if ( pid == "PID_S006_幻影兵_マスターモンク_ベレト側近" ) then
			if AI変更_地形破壊( unit ) then
				AiSetSequence(unit, AI_ORDER_ATTACK, "AI_AT_RodWarpFarZ")
			end
			
		end
		
		unit = ForceUnitGetNext(unit)	
	end
	
	VariableSet( g_key_changedAI2, 1 ) 
	
end

-- -----------------------------------

function AI変更_地形破壊( unit )
	if UnitExistOnMap( unit ) then
		UnitClearStatus(unit, UNIT_STATUS_MOVE_NOT_ALLOW)
		UnitClearStatus(unit, UNIT_STATUS_DONT_POS_CHANGE)
		AiSetSequence(unit, AI_ORDER_ATTACK,	"AI_AT_Null")
		AiSetSequence(unit, AI_ORDER_MOVE,		"AI_MV_TerrainDestroy")
		AiSetActive(unit, true)
		return true
	end
	
	return false
end

function AI変更_攻撃( unit )
	if UnitExistOnMap( unit ) then
		AiSetSequence(unit, AI_ORDER_ATTACK,	"AI_AT_Attack")
		AiSetSequence(unit, AI_ORDER_MOVE,		"AI_MV_NearestEnemy")
		return true
	end
	
	return false
end

-- -----------------------------------

function MapEnding()
	
	Log("MapEnding")
	
	local brokenNum = VariableGet( g_key_CrystalBrokenNum )
	local message = ""
	
	if brokenNum <= 3 then
		MessSetArgument( 0, "MIID_Talisman" )
		MessSetArgument( 1, "MIID_Medicine" )
		Dialog( "MID_TUT_NAVI_S006_REWARD1" )
		ItemGain(nil, "IID_魔よけ")
		ItemGain(nil, "IID_特効薬")
		
	elseif brokenNum <= 10 then
		MessSetArgument( 0, "MIID_Talisman" )
		Dialog( "MID_TUT_NAVI_S006_REWARD2" )
		ItemGain(nil, "IID_魔よけ")
		
	else
		Dialog( "MID_TUT_NAVI_S006_REWARD3" )
		
		
	end
	
end

function Ending()
	
	Log("Ending")

	PuppetDemo("S006", "MID_ED1")
	
	紋章士外伝_レベルキャップ開放( "ベレト", "S006" )
	
end

function GameOver()
	
	Log("GameOver")
	
end