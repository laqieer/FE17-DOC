Include("Common")

help_point_list = {
	{  3,  4, HELP_POINT_OTHER_LEFT },
	{  6,  9, HELP_POINT_OTHER_RIGHT },
	{  7,  5, HELP_POINT_OTHER_RIGHT },
	{  8,  1, HELP_POINT_UP+HELP_POINT_LEFT },
	{ 14,  1, HELP_POINT_OTHER_DOWN },
	{ 19,  1, HELP_POINT_UP+HELP_POINT_RIGHT },
	{ 21,  4 }
}

-- -----------------------------------

function Startup()
	
	Log("Startup")
	
	WinRuleSetMID( "MID_RULE_ANNIHILATE" )
	LoseRuleSetMID( "MID_RULE_TURN_LOSE", 10 )

	--　初期配置のエントリーパネルを有効化する
	VariableEntry( "加勢_2_10", 1 )

	イベント登録()

end

function MapDispos()
	
	加勢ポイントのエフェクト展開( 2, 10, HELP_POINT_ALL )
	
end

function イベント登録()

	EventEntryTurn(勝利条件, 1, 1, FORCE_PLAYER)
	
	加勢ポイントのエリアイベント登録( help_point_list )

end

function Cleanup()
	
	Log("Cleanup");
	
end