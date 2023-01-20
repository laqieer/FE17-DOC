Include("Common")
Include("Hub_Common")

-- -----------------------------------

function Startup()
	
	Log("Startup")
	
end

function Cleanup()
	
	Log("Cleanup")
	
end

-- -----------------------------------

function Opening()
	
	Log("Opening")
	
	-- 紋章士セリカの指輪が返ってきた
	GodUnitSetEscape("GID_セリカ",	false)
	
	PuppetDemo("M020", "MID_ED1")

	Movie("Scene21")
	SkipEscape()

	PuppetDemo("M020", "MID_ED2")
	PuppetDemo("M020", "MID_ED3")
	
	FadeInAndWait(FADE_FAST)
		GoldGain( 50000, "MID_TUT_NAVI_M020_FUNDS" )
	FadeOutAndWait(FADE_FAST)

end

function MapOpening()

	Log("MapOpening")

end

function MapEnding()

	Log("MapEnding")
		
end

function Ending()
	
	Log("Ending")
	
	PuppetDemo("M020", "MID_ED4")
end

function GameOver()
	
	Log("GameOver")
	
end