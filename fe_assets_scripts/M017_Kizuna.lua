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
	
	-- 紋章士リーフの指輪が返ってきた
	GodUnitSetEscape("GID_リーフ",	false)
	
	PuppetDemo("M017", "MID_ED1")

	-- FadeInAndWait(FADE_NORMAL)
	-- 	Talk("MID_ED2")
	-- FadeOutAndWait(FADE_NORMAL)
	
	FadeInAndWait(FADE_NORMAL)
		Movie("S16")
		SkipEscape()
	FadeOutAndWait(FADE_NORMAL)

	-- 紋章士シグルドの指輪が返ってきた
	GodUnitSetEscape("GID_シグルド",	false)
	
	PuppetDemo("M017", "MID_ED3")
	PuppetDemo("M017", "MID_ED4")
	
end

function MapOpening()
	
	Log("MapOpening")
	
end

function MapEnding()
	
	Log("MapEnding")
	
end

function Ending()
	
	Log("Ending")
	
end

function GameOver()
	
	Log("GameOver")
	
end