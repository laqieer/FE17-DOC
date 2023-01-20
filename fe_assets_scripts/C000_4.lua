Include("Common")

-- -----------------------------------

function Startup()
	
	Log("Startup")

	-- 勝利条件の設定
	WinRuleSetDestroyBoss( true )	-- 敵将撃破

	イベント登録()
	
end

function MapDispos()

	Log("MapDispos")

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
	   ObjectDeactivate("MapSetting/Islands/Island03")
	   ObjectDeactivate("MapSetting/Islands/Island13")

	   ObjectDeactivate("MapSetting/Bridges/Bridge02")
	   ObjectDeactivate("MapSetting/Bridges/Bridge04")
	   ObjectDeactivate("MapSetting/Bridges/Bridge06")
	   ObjectDeactivate("MapSetting/Bridges/Bridge07")
	   ObjectDeactivate("MapSetting/Bridges/Bridge08")
	   ObjectDeactivate("MapSetting/Bridges/Bridge09")
	   ObjectDeactivate("MapSetting/Bridges/Bridge11")
	   ObjectDeactivate("MapSetting/Bridges/Bridge12")
	   ObjectDeactivate("MapSetting/Bridges/Bridge14")
	   ObjectDeactivate("MapSetting/Bridges/Bridge16")
	   ObjectDeactivate("MapSetting/Bridges/Bridge18")
	   ObjectDeactivate("MapSetting/Bridges/Bridge21")
	   ObjectDeactivate("MapSetting/Bridges/Bridge24")
	   ObjectDeactivate("MapSetting/Bridges/Bridge26")
	   ObjectDeactivate("MapSetting/Bridges/Bridge27")
	   ObjectDeactivate("MapSetting/Bridges/Bridge29")
	   ObjectDeactivate("MapSetting/Bridges/Bridge31")
	   ObjectDeactivate("MapSetting/Bridges/Bridge34")
	   ObjectDeactivate("MapSetting/Bridges/Bridge38")
	   ObjectDeactivate("MapSetting/Bridges/Bridge39")

	
	-- 地形属性の上書き
	TerrainSetBegin()
	 	TerrainSet(  4, 13, "TID_空" )
	 	TerrainSet(  5, 13, "TID_空" )
	 	TerrainSet(  6, 13, "TID_空" )
	 	TerrainSet(  4, 12, "TID_空" )
	 	TerrainSet(  5, 12, "TID_空" )
	 	TerrainSet(  4, 11, "TID_空" )

	 	TerrainSet(  5, 14, "TID_空" )
	 	TerrainSet(  5, 11, "TID_空" )
	 	TerrainSet(  6, 11, "TID_空" )
	 	TerrainSet(  4, 10, "TID_空" )

	 	TerrainSet(  7, 15, "TID_空" )
	 	TerrainSet(  7, 14, "TID_空" )
	 	TerrainSet(  7, 13, "TID_空" )
	 	TerrainSet(  7, 12, "TID_空" )

		TerrainSet(  5,  7, "TID_空" )
		TerrainSet(  1,  7, "TID_空" )

		TerrainSet(  8,  5, "TID_空" )
		TerrainSet(  9,  5, "TID_空" )
		TerrainSet( 10,  5, "TID_空" )
		TerrainSet( 11,  5, "TID_空" )

	 	TerrainSet(  7,  3, "TID_空" )
	 	TerrainSet(  7,  2, "TID_空" )

	 	TerrainSet( 14,  1, "TID_空" )

	 	TerrainSet( 16,  0, "TID_空" )
	 	TerrainSet( 17,  0, "TID_空" )
	 	TerrainSet( 18,  0, "TID_空" )
	 	TerrainSet( 19,  0, "TID_空" )
	 	TerrainSet( 20,  0, "TID_空" )
	 	TerrainSet( 15,  1, "TID_空" )
	 	TerrainSet( 16,  1, "TID_空" )
	 	TerrainSet( 17,  1, "TID_空" )
	 	TerrainSet( 18,  1, "TID_空" )
	 	TerrainSet( 19,  1, "TID_空" )
	 	TerrainSet( 20,  1, "TID_空" )
	 	TerrainSet( 15,  2, "TID_空" )
	 	TerrainSet( 16,  2, "TID_空" )
	 	TerrainSet( 17,  2, "TID_空" )
	 	TerrainSet( 18,  2, "TID_空" )
	 	TerrainSet( 19,  2, "TID_空" )
	 	TerrainSet( 20,  2, "TID_空" )
	 	TerrainSet( 16,  3, "TID_空" )
	 	TerrainSet( 17,  3, "TID_空" )
	 	TerrainSet( 18,  3, "TID_空" )
	 	TerrainSet( 19,  3, "TID_空" )
	 	TerrainSet( 20,  3, "TID_空" )
	 	TerrainSet( 17,  4, "TID_空" )
	 	TerrainSet( 18,  4, "TID_空" )
	 	TerrainSet( 19,  4, "TID_空" )
	 	TerrainSet( 20,  4, "TID_空" )
	 	TerrainSet( 18,  5, "TID_空" )
	 	TerrainSet( 19,  5, "TID_空" )
	 	TerrainSet( 20,  5, "TID_空" )

	 	TerrainSet( 17,  6, "TID_空" )
	 	TerrainSet( 17,  5, "TID_空" )
	 	TerrainSet( 15,  3, "TID_空" )
	 	TerrainSet( 15,  4, "TID_空" )
	 	TerrainSet( 19,  6, "TID_空" )
	 	TerrainSet( 17, 10, "TID_空" )

	 	TerrainSet( 17, 13, "TID_空" )
	 	TerrainSet( 16, 16, "TID_空" )
	 	TerrainSet( 15, 17, "TID_空" )
	 	TerrainSet( 15, 18, "TID_空" )
	 	TerrainSet( 12, 14, "TID_空" )
	 	TerrainSet( 12, 13, "TID_空" )

	 	TerrainSet(  8, 16, "TID_空" )

	 	TerrainSet( 12,  6, "TID_空" )
	 	TerrainSet( 12,  7, "TID_空" )
	 	TerrainSet( 13,  8, "TID_空" )
	 	TerrainSet( 13,  7, "TID_空" )

	TerrainSetEnd()
	
end