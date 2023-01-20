Include("Common")

-- -----------------------------------

function Startup()
	
	Log("Startup")

	-- 勝利条件の設定
	WinRuleSetDestroyBoss( true )	-- 敵将撃破
	
	イベント登録()
	
end

function MapDispos()

	Log("MapOpening")

	オブジェクト消去テスト()
	
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

function オブジェクト消去テスト()
	
	-- オブジェクトの消去
	   ObjectDeactivate("MapSetting/Islands/Island09")

	   ObjectDeactivate("MapSetting/Bridges/Bridge02")
	   ObjectDeactivate("MapSetting/Bridges/Bridge03")
	   ObjectDeactivate("MapSetting/Bridges/Bridge05")
	   ObjectDeactivate("MapSetting/Bridges/Bridge10")
	   ObjectDeactivate("MapSetting/Bridges/Bridge11")
	   ObjectDeactivate("MapSetting/Bridges/Bridge12")
	   ObjectDeactivate("MapSetting/Bridges/Bridge14")
	   ObjectDeactivate("MapSetting/Bridges/Bridge15")
	   ObjectDeactivate("MapSetting/Bridges/Bridge17")
	   ObjectDeactivate("MapSetting/Bridges/Bridge19")
	   ObjectDeactivate("MapSetting/Bridges/Bridge20")
	   ObjectDeactivate("MapSetting/Bridges/Bridge21")
	   ObjectDeactivate("MapSetting/Bridges/Bridge24")
	   ObjectDeactivate("MapSetting/Bridges/Bridge27")
	   ObjectDeactivate("MapSetting/Bridges/Bridge28")
	   ObjectDeactivate("MapSetting/Bridges/Bridge29")
	   ObjectDeactivate("MapSetting/Bridges/Bridge31")
	   ObjectDeactivate("MapSetting/Bridges/Bridge35")
	   ObjectDeactivate("MapSetting/Bridges/Bridge38")
	   ObjectDeactivate("MapSetting/Bridges/Bridge39")

	-- 地形属性の上書き
	TerrainSetBegin()
	 	TerrainSet(  9, 13, "TID_空" )
	 	TerrainSet( 10, 13, "TID_空" )
	 	TerrainSet( 11, 13, "TID_空" )
	 	TerrainSet(  8, 12, "TID_空" )
	 	TerrainSet(  9, 12, "TID_空" )
	 	TerrainSet( 10, 12, "TID_空" )
	 	TerrainSet( 11, 12, "TID_空" )
	 	TerrainSet( 12, 12, "TID_空" )
	 	TerrainSet(  7, 11, "TID_空" )
	 	TerrainSet(  8, 11, "TID_空" )
	 	TerrainSet(  9, 11, "TID_空" )
	 	TerrainSet( 10, 11, "TID_空" )
	 	TerrainSet( 11, 11, "TID_空" )
	 	TerrainSet( 12, 11, "TID_空" )
	 	TerrainSet( 13, 11, "TID_空" )
	 	TerrainSet(  7, 10, "TID_空" )
	 	TerrainSet(  8, 10, "TID_空" )
	 	TerrainSet(  9, 10, "TID_空" )
	 	TerrainSet( 10, 10, "TID_空" )
	 	TerrainSet( 11, 10, "TID_空" )
	 	TerrainSet( 12, 10, "TID_空" )
	 	TerrainSet( 13, 10, "TID_空" )
	 	TerrainSet(  7,  9, "TID_空" )
	 	TerrainSet(  8,  9, "TID_空" )
	 	TerrainSet(  9,  9, "TID_空" )
	 	TerrainSet( 10,  9, "TID_空" )
	 	TerrainSet( 11,  9, "TID_空" )
	 	TerrainSet( 12,  9, "TID_空" )
	 	TerrainSet( 13,  9, "TID_空" )
	 	TerrainSet(  8,  8, "TID_空" )
	 	TerrainSet(  9,  8, "TID_空" )
	 	TerrainSet( 10,  8, "TID_空" )
	 	TerrainSet( 11,  8, "TID_空" )
	 	TerrainSet( 12,  8, "TID_空" )
	 	TerrainSet(  9,  7, "TID_空" )
	 	TerrainSet( 10,  7, "TID_空" )
	 	TerrainSet( 11,  7, "TID_空" )

	 	TerrainSet(  7, 15, "TID_空" )
	 	TerrainSet(  7, 14, "TID_空" )
	 	TerrainSet(  7, 13, "TID_空" )
	 	TerrainSet(  7, 12, "TID_空" )

	 	TerrainSet(  9, 14, "TID_空" )

	 	TerrainSet( 12, 13, "TID_空" )
	 	TerrainSet( 12, 14, "TID_空" )
	 	TerrainSet( 14, 10, "TID_空" )

		TerrainSet( 13,  7, "TID_空" )
		TerrainSet( 13,  8, "TID_空" )
		TerrainSet( 12,  6, "TID_空" )
		TerrainSet( 12,  7, "TID_空" )

	 	TerrainSet(  7,  7, "TID_空" )
	 	TerrainSet(  7,  8, "TID_空" )

		TerrainSet(  6,  9, "TID_空" )

		TerrainSet(  5, 11, "TID_空" )
		TerrainSet(  6, 11, "TID_空" )

	 	TerrainSet( 10, 17, "TID_空" )
	 	TerrainSet( 15, 17, "TID_空" )
	 	TerrainSet( 15, 18, "TID_空" )
	 	TerrainSet( 16, 16, "TID_空" )
	 	TerrainSet( 12, 13, "TID_空" )
	 	TerrainSet( 12, 14, "TID_空" )
	 	TerrainSet( 17, 13, "TID_空" )
	 	TerrainSet( 17, 10, "TID_空" )

	 	TerrainSet( 18,  7, "TID_空" )
	 	TerrainSet( 17,  6, "TID_空" )
	 	TerrainSet( 17,  5, "TID_空" )

	 	TerrainSet( 13,  2, "TID_空" )
		TerrainSet( 13,  3, "TID_空" )

		TerrainSet(  7,  2, "TID_空" )
		TerrainSet(  7,  3, "TID_空" )

		TerrainSet(  4,  4, "TID_空" )
		TerrainSet(  5,  4, "TID_空" )

	 	TerrainSet(  2,  9, "TID_空" )

	TerrainSetEnd()
	
end