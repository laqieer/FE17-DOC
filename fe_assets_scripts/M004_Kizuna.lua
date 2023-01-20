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
	
	FadeInAndWait(FADE_SLOW)
		Movie("S10")
		SkipEscape()
	FadeOutAndWait(FADE_NORMAL)
	
	PuppetDemo("M004", "MID_ED1")
	
	PuppetDemo("M004", "MID_ED2")
	
end

function MapOpening()
	
	Log("MapOpening")
	
	-- 動物小屋
	if HubIsFacilityComplete("AID_動物小屋") and TryVariable("G_拠点_動物小屋通知") == false then
		VariableEntry("G_拠点_動物小屋通知", 1)
		Notice("MID_TUT_HUB_ANIMAL_OPEN")
	end

	Tutorial("TUTID_動物小屋")
end

function MapEnding()
	
	Log("MapEnding")
	
end

function Ending()
	
	Log("Ending")
	
	PuppetDemo("M004", "MID_ED3");
	
	FadeInAndWait(FADE_FAST)
		GoldGain( 10000, "MID_TUT_NAVI_VANDRE_FUNDS" )
	FadeOutAndWait(FADE_FAST)
	
end

