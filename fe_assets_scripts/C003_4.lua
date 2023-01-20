Include("Common")

-- -----------------------------------
function Startup()
	
	Log("Startup")

	WinRuleSetMID( "MID_RULE_ANNIHILATE" )

	イベント登録()
	
end

function MapDispos()

	Log("MapOpening")
	
	オブジェクト消去()

end

function MapOpening()

	Log("MapOpening")
	
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

	
	-- 地形属性の上書き
	TerrainSetBegin()
	 	TerrainSet(  6,  7, "TID_地面" )
	 	TerrainSet(  6,  2, "TID_地面" )
	 	TerrainSet( 11,  5, "TID_地面" )
	 	TerrainSet( 16,  9, "TID_地面" )
	 	TerrainSet( 15,  2, "TID_地面" )
	 	TerrainSet( 22,  8, "TID_地面" )
	 	TerrainSet( 22,  3, "TID_地面" )

	TerrainSetEnd()
	
end

-- -----------------------------------