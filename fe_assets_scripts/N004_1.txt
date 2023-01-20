Include("Common")

help_point_list = {
	{  6,  1, HELP_POINT_OTHER_DOWN },
	{ 10,  5, HELP_POINT_OTHER_RIGHT },
	{  5,  5, },
	{  7,  8, }
}

-- -----------------------------------

function Startup()
	
	Log("Startup")

        WinRuleSetLimitTurn(10)
        WinRuleSetMID( "MID_RULE_SURVIVE_TURN", 10 )
	LoseRuleSetMID( "MID_RULE_COMMON_LOSE" )

	--　初期配置のエントリーパネルを有効化する
	VariableEntry( "加勢_9_2", 1 )
	
	イベント登録()
end

function MapDispos()
	
	加勢ポイントのエフェクト展開( 9, 2, HELP_POINT_ALL )

end

function イベント登録()

	EventEntryTurn(勝利条件, 1, 1, FORCE_PLAYER)

	加勢ポイントのエリアイベント登録( help_point_list )

	EventEntryTurn(増援１,  3,  3, FORCE_PLAYER)
	EventEntryTurn(増援２,  4,  4, FORCE_PLAYER)
	EventEntryTurn(増援３,  5,  5, FORCE_PLAYER)
	EventEntryTurn(増援４,  6,  6, FORCE_PLAYER)
	EventEntryTurn(増援５,  7,  7, FORCE_PLAYER)
	EventEntryTurn(増援６,  8,  8, FORCE_PLAYER)
	EventEntryTurn(増援７,  9,  9, FORCE_PLAYER)
	EventEntryTurn(増援８, 10 ,10, FORCE_PLAYER)	


	EventEntryDie(死亡イベント, "", FORCE_PLAYER, condition_死亡イベント)

end

function condition_死亡イベント()
	local num = ForceUnitGetCount(FORCE_PLAYER)
	if num == 1 then
		return true
	else
		return false
	end

end

function 死亡イベント()
	VariableSet("敗北", 1)
end

function 勝利イベント()
	VariableSet("勝利", 1)

end

function Cleanup()
	
	Log("Cleanup")
	
end

-- -----------------------------------

function 増援１()
	
	Dispos( "Reinforcement1_1", DISPOS_FLAG_FOCUS )
	Yield()
	WaitTime( 0.5 )
	
	
end

-- -----------------------------------

function 増援２()
	
	Dispos( "Reinforcement1_2", DISPOS_FLAG_FOCUS )
	Yield()
	WaitTime( 0.5 )
	
end

-- -----------------------------------

function 増援３()
	
	Dispos( "Reinforcement1_3", DISPOS_FLAG_FOCUS )
	Yield()
	WaitTime( 0.5 )
	
end

-- -----------------------------------

function 増援４()
	
	Dispos( "Reinforcement1_4", DISPOS_FLAG_FOCUS )
	Yield()
	WaitTime( 0.5 )
	
end

-- -----------------------------------

function 増援５()
	
	Dispos( "Reinforcement1_5", DISPOS_FLAG_FOCUS )
	Yield()
	WaitTime( 0.5 )
	
end

-- -----------------------------------

function 増援６()
	
	Dispos( "Reinforcement1_6", DISPOS_FLAG_FOCUS )
	Yield()
	WaitTime( 0.5 )
	
end

-- -----------------------------------

function 増援７()
	
	Dispos( "Reinforcement1_7", DISPOS_FLAG_FOCUS )
	Yield()
	WaitTime( 0.5 )
	
end

-- -----------------------------------

function 増援８()
	
	Dispos( "Reinforcement1_8", DISPOS_FLAG_FOCUS )
	Yield()
	WaitTime( 0.5 )
	
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

-- -----------------------------------