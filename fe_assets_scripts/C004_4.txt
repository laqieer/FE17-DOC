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
	
	-- 地形属性の上書き
	TerrainSetBegin()
	 	TerrainSet( 15,  7, "TID_平地" )
	 	TerrainSet( 18,  9, "TID_平地" )
	 	TerrainSet( 12, 10, "TID_平地" )
	 	TerrainSet( 11, 14, "TID_平地" )
	 	TerrainSet(  2, 13, "TID_平地" )
	 	TerrainSet(  3,  9, "TID_平地" )

	TerrainSetEnd()
	
end


-- -----------------------------------