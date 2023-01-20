Include("Common")

help_point_list = {
	{  6,  5, HELP_POINT_OTHER_UP },
	{  1,  9, HELP_POINT_UP+HELP_POINT_DOWN },
	{  4,  9 },
	{  1, 16, HELP_POINT_OTHER_LEFT },
	{  6, 15 },
	{ 10, 18, HELP_POINT_OTHER_UP },
	{  4, 21 },
	{  1, 24, HELP_POINT_OTHER_LEFT },
	{  7, 24 },
	{ 11, 23 },
	{  7, 28 }
}

-- -----------------------------------

function Startup()
	
	Log("Startup")

	WinRuleSetMID( "MID_RULE_ANNIHILATE" )
	LoseRuleSetMID( "MID_RULE_TURN_LOSE", 15 )

	--　初期配置のエントリーパネルを有効化する
	VariableEntry( "加勢_3_2", 1 )

	イベント登録()

end

function MapDispos()
	
	加勢ポイントのエフェクト展開( 3, 2, HELP_POINT_ALL )
	
end

function MapOpening()
	
end

function イベント登録()

	EventEntryTurn(勝利条件, 1, 1, FORCE_PLAYER)

	加勢ポイントのエリアイベント登録( help_point_list )

end

function Cleanup()
	
	Log("Cleanup");
	
end