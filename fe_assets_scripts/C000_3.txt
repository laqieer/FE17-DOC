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
	   ObjectDeactivate("MapSetting/Islands/Island01")
	   ObjectDeactivate("MapSetting/Islands/Island10")
	   ObjectDeactivate("MapSetting/Islands/Island16")

	   ObjectDeactivate("MapSetting/Bridges/Bridge01")
	   ObjectDeactivate("MapSetting/Bridges/Bridge04")
	   ObjectDeactivate("MapSetting/Bridges/Bridge05")
	   ObjectDeactivate("MapSetting/Bridges/Bridge06")
	   ObjectDeactivate("MapSetting/Bridges/Bridge07")
	   ObjectDeactivate("MapSetting/Bridges/Bridge08")
	   ObjectDeactivate("MapSetting/Bridges/Bridge10")
	   ObjectDeactivate("MapSetting/Bridges/Bridge11")
	   ObjectDeactivate("MapSetting/Bridges/Bridge13")
	   ObjectDeactivate("MapSetting/Bridges/Bridge15")
	   ObjectDeactivate("MapSetting/Bridges/Bridge19")
	   ObjectDeactivate("MapSetting/Bridges/Bridge20")
	   ObjectDeactivate("MapSetting/Bridges/Bridge21")
	   ObjectDeactivate("MapSetting/Bridges/Bridge24")
	   ObjectDeactivate("MapSetting/Bridges/Bridge28")
	   ObjectDeactivate("MapSetting/Bridges/Bridge29")
	   ObjectDeactivate("MapSetting/Bridges/Bridge30")
	   ObjectDeactivate("MapSetting/Bridges/Bridge32")
	   ObjectDeactivate("MapSetting/Bridges/Bridge34")
	   ObjectDeactivate("MapSetting/Bridges/Bridge35")
	   ObjectDeactivate("MapSetting/Bridges/Bridge36")
	   ObjectDeactivate("MapSetting/Bridges/Bridge38")

	-- 地形属性の上書き
	TerrainSetBegin()
	 	TerrainSet(  9, 16, "TID_空" )
	 	TerrainSet( 10, 16, "TID_空" )
	 	TerrainSet(  9, 15, "TID_空" )
	 	TerrainSet( 10, 15, "TID_空" )

	 	TerrainSet( 10, 17, "TID_空" )
	 	TerrainSet( 11, 16, "TID_空" )
	 	TerrainSet(  9, 14, "TID_空" )
	 	TerrainSet(  8, 16, "TID_空" )

	 	TerrainSet( 12, 13, "TID_空" )
	 	TerrainSet( 12, 14, "TID_空" )
	 	TerrainSet( 15, 17, "TID_空" )
	 	TerrainSet( 15, 18, "TID_空" )

	 	TerrainSet( 16, 12, "TID_空" )
	 	TerrainSet( 18, 14, "TID_空" )

	 	TerrainSet( 15, 11, "TID_空" )
	 	TerrainSet( 15, 10, "TID_空" )
	 	TerrainSet( 15,  9, "TID_空" )
	 	TerrainSet( 16, 11, "TID_空" )
	 	TerrainSet( 16, 10, "TID_空" )
	 	TerrainSet( 16,  9, "TID_空" )

	 	TerrainSet( 17, 10, "TID_空" )
	 	TerrainSet( 16,  8, "TID_空" )
	 	TerrainSet( 14, 10, "TID_空" )

	 	TerrainSet( 12,  7, "TID_空" )
	 	TerrainSet( 12,  6, "TID_空" )
	 	TerrainSet( 18,  7, "TID_空" )
	 	TerrainSet( 15,  3, "TID_空" )
		TerrainSet( 15,  4, "TID_空" )

	 	TerrainSet( 14,  1, "TID_空" )
	 	TerrainSet(  6,  1, "TID_空" )

	 	TerrainSet(  8,  5, "TID_空" )
	 	TerrainSet(  9,  5, "TID_空" )
	 	TerrainSet( 10,  5, "TID_空" )
	 	TerrainSet( 11,  5, "TID_空" )

		TerrainSet(  0,  0, "TID_空" )
		TerrainSet(  1,  0, "TID_空" )
		TerrainSet(  2,  0, "TID_空" )
		TerrainSet(  3,  0, "TID_空" )
		TerrainSet(  4,  0, "TID_空" )
		TerrainSet(  0,  1, "TID_空" )
		TerrainSet(  1,  1, "TID_空" )
		TerrainSet(  2,  1, "TID_空" )
		TerrainSet(  3,  1, "TID_空" )
		TerrainSet(  4,  1, "TID_空" )
		TerrainSet(  5,  1, "TID_空" )
		TerrainSet(  0,  1, "TID_空" )
		TerrainSet(  0,  2, "TID_空" )
		TerrainSet(  1,  2, "TID_空" )
		TerrainSet(  2,  2, "TID_空" )
		TerrainSet(  3,  2, "TID_空" )
		TerrainSet(  4,  2, "TID_空" )
		TerrainSet(  5,  2, "TID_空" )
		TerrainSet(  0,  3, "TID_空" )
		TerrainSet(  1,  3, "TID_空" )
		TerrainSet(  2,  3, "TID_空" )
		TerrainSet(  3,  3, "TID_空" )
		TerrainSet(  4,  3, "TID_空" )
		TerrainSet(  0,  3, "TID_空" )
		TerrainSet(  0,  3, "TID_空" )
		TerrainSet(  0,  3, "TID_空" )
		TerrainSet(  0,  3, "TID_空" )
		TerrainSet(  0,  3, "TID_空" )
		TerrainSet(  0,  4, "TID_空" )
		TerrainSet(  1,  4, "TID_空" )
		TerrainSet(  2,  4, "TID_空" )
		TerrainSet(  3,  4, "TID_空" )
		TerrainSet(  0,  5, "TID_空" )
		TerrainSet(  1,  5, "TID_空" )
		TerrainSet(  2,  5, "TID_空" )
		TerrainSet(  0,  6, "TID_空" )
		TerrainSet(  1,  6, "TID_空" )

		TerrainSet(  1,  7, "TID_空" )
		TerrainSet(  4,  4, "TID_空" )
		TerrainSet(  5,  4, "TID_空" )

		TerrainSet(  7,  8, "TID_空" )
		TerrainSet(  7,  7, "TID_空" )
		TerrainSet(  6,  9, "TID_空" )

	 	TerrainSet(  5, 11, "TID_空" )
	 	TerrainSet(  6, 11, "TID_空" )

	TerrainSetEnd()
	
end