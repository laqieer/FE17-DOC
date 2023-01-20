Include("Common")

help_point_list = {
	{  6,  7 },
	{  8,  1, HELP_POINT_OTHER_DOWN },
	{ 12,  9, HELP_POINT_OTHER_UP },
	{ 14,  1, HELP_POINT_OTHER_DOWN },
	{ 19,  9, HELP_POINT_OTHER_UP },
	{ 19,  3, HELP_POINT_OTHER_DOWN },
	{ 26,  7 },
	{ 24,  1, HELP_POINT_OTHER_DOWN }
}

-- -----------------------------------

function Startup()
	
	Log("Startup")

	WinRuleSetMID( "MID_RULE_ANNIHILATE" )
	LoseRuleSetMID( "MID_RULE_TURN_LOSE", 10 )

	--　初期配置のエントリーパネルを有効化する
	VariableEntry( "加勢_3_7", 1 )

	イベント登録()
	
end

function MapDispos()
	
	加勢ポイントのエフェクト展開( 3, 7, HELP_POINT_ALL )
	
end

function イベント登録()

	EventEntryTurn(勝利条件, 1, 1, FORCE_PLAYER)

	加勢ポイントのエリアイベント登録( help_point_list )

end

function Cleanup()
	
	Log("Cleanup");
	
end

	
