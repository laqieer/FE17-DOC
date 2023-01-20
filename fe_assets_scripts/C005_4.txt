Include("Common")

-- -----------------------------------
function Startup()
	
	Log("Startup")

	WinRuleSetMID( "MID_RULE_ANNIHILATE" )

	イベント登録()
	
end

function MapDispos()
	
	オブジェクト消去()

end

function MapOpening()

	Log("MapOpening")
	飛行ユニットの０ダメージ攻撃を許可()
	
end


function イベント登録()

	EventEntryTurn(勝利条件, 1, 1, FORCE_PLAYER)

end


function Cleanup()
	
	Log("Cleanup");
	
end

function オブジェクト消去()
	
	-- オブジェクトの消去
	   ObjectDeactivate("MapSetting/SummonFloor")
	   ObjectDeactivate("MapSetting/SummonFloor (1)")
	   ObjectDeactivate("MapSetting/SummonFloor (2)")
	   ObjectDeactivate("MapSetting/SummonFloor (3)")
	   ObjectDeactivate("MapSetting/SummonFloor (4)")
	   ObjectDeactivate("MapSetting/SummonFloor (5)")
	   ObjectDeactivate("MapSetting/SummonFloor (6)")
	   ObjectDeactivate("MapSetting/SummonFloor (7)")
	
	-- 地形属性の上書き
	TerrainSetBegin()
	 	TerrainSet(  3,  9, "TID_砂漠" )
	 	TerrainSet(  9,  8, "TID_砂漠" )
	 	TerrainSet(  6, 15, "TID_砂漠" )
	 	TerrainSet(  9, 16, "TID_砂漠" )
	 	TerrainSet(  8, 21, "TID_砂漠" )
	 	TerrainSet(  2, 21, "TID_砂漠" )
	 	TerrainSet(  4, 26, "TID_砂漠" )
	 	TerrainSet(  9, 28, "TID_砂漠" )

	TerrainSetEnd()
	
end

-- -----------------------------------