Include("Common")


help_point_list = {
	{  1,  9, HELP_POINT_UP+HELP_POINT_RIGHT },
	{  1,  3, HELP_POINT_UP+HELP_POINT_RIGHT },
	{  4,  9, HELP_POINT_OTHER_DOWN },
	{  5,  5, HELP_POINT_OTHER_LEFT },
	{  5,  1, HELP_POINT_OTHER_DOWN },
	{ 11,  1, HELP_POINT_OTHER_DOWN },
	{ 11,  6 },
	{ 10, 10, HELP_POINT_OTHER_LEFT},
	{ 16,  5, HELP_POINT_OTHER_RIGHT },
	{ 15, 13, HELP_POINT_OTHER_LEFT }
}

-- -----------------------------------

function Startup()
	
	Log("Startup")

	WinRuleSetMID( "MID_RULE_ANNIHILATE" )
	LoseRuleSetMID( "MID_RULE_TURN_LOSE", 10 )

	--　初期配置のエントリーパネルを有効化する
	VariableEntry( "加勢_5_13", 1 )

	イベント登録()
end

function MapDispos()
	
	加勢ポイントのエフェクト展開( 5, 13, HELP_POINT_ALL )
	
end

function イベント登録()

	EventEntryTurn(勝利条件, 1, 1, FORCE_PLAYER)

	加勢ポイントのエリアイベント登録( help_point_list )

end

function Cleanup()
	
	Log("Cleanup");
	
end