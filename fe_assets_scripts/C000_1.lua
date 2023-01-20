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
	
end


function イベント登録()

	EventEntryTurn(勝利条件, 1, 1, FORCE_PLAYER)

end

function Cleanup()
	
	Log("Cleanup");
	
end

function オブジェクト消去テスト()
	
	-- オブジェクトの消去
	   ObjectDeactivate("MapSetting/Islands/Island08")
	   ObjectDeactivate("MapSetting/Islands/Island10")
	   ObjectDeactivate("MapSetting/Islands/Island16")

	   ObjectDeactivate("MapSetting/Bridges/Bridge02")
	   ObjectDeactivate("MapSetting/Bridges/Bridge03")
	   ObjectDeactivate("MapSetting/Bridges/Bridge06")
	   ObjectDeactivate("MapSetting/Bridges/Bridge07")
	   ObjectDeactivate("MapSetting/Bridges/Bridge09")
	   ObjectDeactivate("MapSetting/Bridges/Bridge12")
	   ObjectDeactivate("MapSetting/Bridges/Bridge13")
	   ObjectDeactivate("MapSetting/Bridges/Bridge14")
	   ObjectDeactivate("MapSetting/Bridges/Bridge17")
	   ObjectDeactivate("MapSetting/Bridges/Bridge18")
	   ObjectDeactivate("MapSetting/Bridges/Bridge19")
	   ObjectDeactivate("MapSetting/Bridges/Bridge20")
	   ObjectDeactivate("MapSetting/Bridges/Bridge21")
	   ObjectDeactivate("MapSetting/Bridges/Bridge27")
	   ObjectDeactivate("MapSetting/Bridges/Bridge28")
	   ObjectDeactivate("MapSetting/Bridges/Bridge30")
	   ObjectDeactivate("MapSetting/Bridges/Bridge31")
	   ObjectDeactivate("MapSetting/Bridges/Bridge34")
	   ObjectDeactivate("MapSetting/Bridges/Bridge35")
	   ObjectDeactivate("MapSetting/Bridges/Bridge36")
	   ObjectDeactivate("MapSetting/Bridges/Bridge39")	


	-- 地形属性の上書き
	TerrainSetBegin()
	 	TerrainSet(  7, 15, "TID_空" )
	 	TerrainSet(  7, 14, "TID_空" )
	 	TerrainSet(  7, 13, "TID_空" )
	 	TerrainSet(  7, 12, "TID_空" )

	 	TerrainSet( 10, 17, "TID_空" )
	 	TerrainSet( 11, 16, "TID_空" )
	 	TerrainSet(  9, 14, "TID_空" )
	 	TerrainSet(  8, 16, "TID_空" )

	 	TerrainSet(  9, 16, "TID_空" )
	 	TerrainSet( 10, 16, "TID_空" )
	 	TerrainSet(  9, 15, "TID_空" )
	 	TerrainSet( 10, 15, "TID_空" )

	 	TerrainSet( 16, 16, "TID_空" )
	 	TerrainSet( 17, 13, "TID_空" )
	 	TerrainSet( 16, 12, "TID_空" )
	 	TerrainSet( 17, 10, "TID_空" )
	 	TerrainSet( 16,  8, "TID_空" )
	 	TerrainSet( 14, 10, "TID_空" )

	 	TerrainSet( 15, 11, "TID_空" )
	 	TerrainSet( 15, 10, "TID_空" )
	 	TerrainSet( 15,  9, "TID_空" )
	 	TerrainSet( 16, 11, "TID_空" )
	 	TerrainSet( 16, 10, "TID_空" )
	 	TerrainSet( 16,  9, "TID_空" )

	 	TerrainSet( 13,  8, "TID_空" )
	 	TerrainSet( 13,  7, "TID_空" )
	 	TerrainSet( 17,  6, "TID_空" )
	 	TerrainSet( 17,  5, "TID_空" )
	 	TerrainSet( 15,  4, "TID_空" )
	 	TerrainSet( 15,  3, "TID_空" )

	 	TerrainSet( 13,  3, "TID_空" )
	 	TerrainSet( 13,  2, "TID_空" )
	 	TerrainSet(  7,  3, "TID_空" )
	 	TerrainSet(  7,  2, "TID_空" )

	 	TerrainSet(  8,  5, "TID_空" )
	 	TerrainSet(  9,  5, "TID_空" )
	 	TerrainSet( 10,  5, "TID_空" )
	 	TerrainSet( 11,  5, "TID_空" )

	 	TerrainSet(  5,  7, "TID_空" )
	 	TerrainSet(  6,  9, "TID_空" )
	 	TerrainSet(  4, 10, "TID_空" )
	 	TerrainSet(  2,  9, "TID_空" )

	 	TerrainSet(  3,  9, "TID_空" )
	 	TerrainSet(  4,  9, "TID_空" )
	 	TerrainSet(  5,  9, "TID_空" )
	 	TerrainSet(  3,  8, "TID_空" )
	 	TerrainSet(  4,  8, "TID_空" )
	 	TerrainSet(  5,  8, "TID_空" )

	TerrainSetEnd()
	
end
