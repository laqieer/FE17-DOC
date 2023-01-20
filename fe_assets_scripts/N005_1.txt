Include("Common")

help_point_list = {
	{ 19,  1, HELP_POINT_OTHER_DOWN },
	{  8,  1, HELP_POINT_OTHER_DOWN },
	{  2,  8, HELP_POINT_OTHER_UP },
	{  9,  8, HELP_POINT_OTHER_UP },
	{ 12,  5 },
	{ 18,  8 },
}

-- -----------------------------------

function Startup()
	
	Log("Startup")

	WinRuleSetMID( "MID_RULE_ANNIHILATE" )
	LoseRuleSetMID( "MID_RULE_TURN_LOSE", 15 )


	--　初期配置のエントリーパネルを有効化する
	VariableEntry( "加勢_26_4", 1 )

	イベント登録()

end

function MapDispos()
	
	加勢ポイントのエフェクト展開( 26, 4, HELP_POINT_ALL )
	
end

function イベント登録()

	EventEntryTurn(勝利条件, 1, 1, FORCE_PLAYER)

	加勢ポイントのエリアイベント登録( help_point_list )

end

function Cleanup()
	
	Log("Cleanup");
	
end