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
	
	PuppetDemo("M014", "MID_ED1")
	
	FadeInAndWait(FADE_NORMAL)
		Movie("Kengen09")
		SkipEscape()
	FadeOutAndWait(FADE_NORMAL)
	
	PuppetDemo("M014", "MID_ED2")
	PuppetDemo("M014", "MID_ED3")
	
	-- オルテンシア加入
	UnitJoin( "PID_オルテンシア" )
	
	-- ベレト加入
	GodUnitCreate("GID_ベレト")
	
	FadeInAndWait(FADE_FAST)
		GoldGain( 40000, "MID_TUT_NAVI_M014_FUNDS" )
	FadeOutAndWait(FADE_FAST)
	
end

function MapOpening()
	
	Log("MapOpening");

	Tutorial( "TUTID_紋章士ベレト" )
end

function MapEnding()
	
	Log("MapEnding");
	
end

function Ending()
	
	Log("Ending");

	PuppetDemo("M014", "MID_ED4")

end

function GameOver()
	
	Log("GameOver");
	
end