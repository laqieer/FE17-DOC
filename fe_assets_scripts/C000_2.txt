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
	   ObjectDeactivate("MapSetting/Islands/Island02")
	   ObjectDeactivate("MapSetting/Islands/Island07")
	   ObjectDeactivate("MapSetting/Islands/Island14")

	   ObjectDeactivate("MapSetting/Bridges/Bridge01")
	   ObjectDeactivate("MapSetting/Bridges/Bridge02")
	   ObjectDeactivate("MapSetting/Bridges/Bridge03")
	   ObjectDeactivate("MapSetting/Bridges/Bridge04")
	   ObjectDeactivate("MapSetting/Bridges/Bridge08")
	   ObjectDeactivate("MapSetting/Bridges/Bridge10")
	   ObjectDeactivate("MapSetting/Bridges/Bridge11")
	   ObjectDeactivate("MapSetting/Bridges/Bridge13")
	   ObjectDeactivate("MapSetting/Bridges/Bridge14")
	   ObjectDeactivate("MapSetting/Bridges/Bridge15")
	   ObjectDeactivate("MapSetting/Bridges/Bridge17")
	   ObjectDeactivate("MapSetting/Bridges/Bridge23")
	   ObjectDeactivate("MapSetting/Bridges/Bridge24")
	   ObjectDeactivate("MapSetting/Bridges/Bridge27")
	   ObjectDeactivate("MapSetting/Bridges/Bridge29")
	   ObjectDeactivate("MapSetting/Bridges/Bridge30")
	   ObjectDeactivate("MapSetting/Bridges/Bridge31")
	   ObjectDeactivate("MapSetting/Bridges/Bridge34")
	   ObjectDeactivate("MapSetting/Bridges/Bridge36")
	   ObjectDeactivate("MapSetting/Bridges/Bridge38")
	   ObjectDeactivate("MapSetting/Bridges/Bridge39")
	
	-- 地形属性の上書き
	TerrainSetBegin()
	 	TerrainSet( 13, 17, "TID_空" )
	 	TerrainSet( 14, 17, "TID_空" )
	 	TerrainSet( 12, 16, "TID_空" )
	 	TerrainSet( 13, 16, "TID_空" )
	 	TerrainSet( 14, 16, "TID_空" )
	 	TerrainSet( 15, 16, "TID_空" )
	 	TerrainSet( 14, 16, "TID_空" )
	 	TerrainSet( 12, 15, "TID_空" )
	 	TerrainSet( 13, 15, "TID_空" )
	 	TerrainSet( 14, 15, "TID_空" )
	 	TerrainSet( 15, 15, "TID_空" )
	 	TerrainSet( 13, 14, "TID_空" )
	 	TerrainSet( 14, 14, "TID_空" )
	 	TerrainSet( 15, 14, "TID_空" )
	 	TerrainSet( 16, 14, "TID_空" )
	 	TerrainSet( 14, 13, "TID_空" )
	 	TerrainSet( 15, 13, "TID_空" )
	 	TerrainSet( 16, 13, "TID_空" )

	 	TerrainSet( 15, 17, "TID_空" )
	 	TerrainSet( 15, 18, "TID_空" )
	 	TerrainSet( 11, 16, "TID_空" )
	 	TerrainSet( 16, 16, "TID_空" )
	 	TerrainSet( 12, 13, "TID_空" )
	 	TerrainSet( 12, 14, "TID_空" )
	 	TerrainSet( 17, 13, "TID_空" )
	 	TerrainSet( 16, 12, "TID_空" )

	 	TerrainSet( 16,  8, "TID_空" )
	 	TerrainSet( 12,  7, "TID_空" )
	 	TerrainSet( 12,  6, "TID_空" )
	 	TerrainSet( 18,  7, "TID_空" )
	 	TerrainSet( 17,  6, "TID_空" )
	 	TerrainSet( 17,  5, "TID_空" )

	 	TerrainSet( 14,  1, "TID_空" )
	 	TerrainSet( 13,  2, "TID_空" )
		TerrainSet( 13,  3, "TID_空" )
		TerrainSet(  7,  2, "TID_空" )
		TerrainSet(  7,  3, "TID_空" )
		TerrainSet(  6,  1, "TID_空" )
		TerrainSet(  9,  3, "TID_空" )
		TerrainSet( 10,  3, "TID_空" )
		TerrainSet( 11,  3, "TID_空" )
		TerrainSet(  8,  2, "TID_空" )
		TerrainSet(  9,  2, "TID_空" )
		TerrainSet( 10,  2, "TID_空" )
		TerrainSet( 11,  2, "TID_空" )
		TerrainSet( 12,  2, "TID_空" )
		TerrainSet(  7,  1, "TID_空" )
		TerrainSet(  8,  1, "TID_空" )
		TerrainSet(  9,  1, "TID_空" )
		TerrainSet( 10,  1, "TID_空" )
		TerrainSet( 11,  1, "TID_空" )
		TerrainSet( 12,  1, "TID_空" )
		TerrainSet( 13,  1, "TID_空" )
		TerrainSet(  8,  0, "TID_空" )
		TerrainSet(  9,  0, "TID_空" )
		TerrainSet( 10,  0, "TID_空" )
		TerrainSet( 11,  0, "TID_空" )
		TerrainSet( 12,  0, "TID_空" )

		TerrainSet(  1, 10, "TID_空" )
		TerrainSet(  1,  9, "TID_空" )
		TerrainSet(  1,  8, "TID_空" )
		TerrainSet(  0, 10, "TID_空" )
		TerrainSet(  0,  9, "TID_空" )
		TerrainSet(  0,  8, "TID_空" )
		TerrainSet(  1, 11, "TID_空" )
		TerrainSet(  2,  9, "TID_空" )
		TerrainSet(  1,  7, "TID_空" )
		TerrainSet( 13,  1, "TID_空" )

		TerrainSet(  7,  7, "TID_空" )
		TerrainSet(  7,  8, "TID_空" )

		TerrainSet(  5, 11, "TID_空" )
		TerrainSet(  6, 11, "TID_空" )

	 	TerrainSet(  7, 15, "TID_空" )
	 	TerrainSet(  7, 14, "TID_空" )
	 	TerrainSet(  7, 13, "TID_空" )
	 	TerrainSet(  7, 12, "TID_空" )

	 	TerrainSet(  8, 16, "TID_空" )

	TerrainSetEnd()
	
end