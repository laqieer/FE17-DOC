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

	PuppetDemo("M001", "MID_ED1")

	FadeInAndWait(FADE_FAST)
		Movie("S05")
		SkipEscape()
	FadeOutAndWait(FADE_FAST)

	PuppetDemo("M001", "MID_ED3")

end

function MapOpening()
	
	Log("MapOpening")
	
	Tutorial("TUTID_絆リザルト")

end

function MapEnding()
	
	Log("MapEnding")

	Talk("MID_ED4")
	FadeOutAndWait(0) -- メッセージ内にフェードタグが入っていて、スキップすると一瞬絆リザルトが映るため対処
end

function Ending()
	
	Log("Ending")

	FadeInAndWait(FADE_NORMAL)
		Movie("S06")
		SkipEscape()
	FadeOutAndWait(FADE_FAST)
end

