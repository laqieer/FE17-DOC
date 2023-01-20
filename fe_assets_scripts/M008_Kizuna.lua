Include("Common")
Include("Hub_Common")

-- -----------------------------------

function Startup()
	
	Log("Startup");
	
end

function Cleanup()
	
	Log("Cleanup");
	
end

-- -----------------------------------

function Opening()
	
	Log("Opening");
	
	PuppetDemo("M008", "MID_EV7")
	
	FadeInAndWait(FADE_NORMAL)
		Movie("Kengen05")
		SkipEscape()
	FadeOutAndWait(FADE_NORMAL)
	
	PuppetDemo("M008", "MID_ED1")
	PuppetDemo("M008", "MID_ED2")
	
	-- リーフを自軍に追加
	GodUnitCreate( "GID_リーフ" )
	
	FadeInAndWait(FADE_FAST)
		GoldGain( 30000, "MID_TUT_NAVI_M008_FUNDS" )
	FadeOutAndWait(FADE_FAST)
	
end

function MapOpening()
	
	Log("MapOpening");
	
end

function MapEnding()
	
	Log("MapEnding");
	
end

function Ending()

	PuppetDemo("M008", "MID_ED3")
	
	Log("Ending");
	
end

function GameOver()
	
	Log("GameOver");
	
end