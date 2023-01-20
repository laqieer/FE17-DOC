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
	
	PuppetDemo("M005", "MID_ED1")
	PuppetDemo("M005", "MID_ED2")
	
	FadeInAndWait(FADE_FAST)
		GoldGain( 10000, "MID_TUT_NAVI_M005_FUNDS" )
	FadeOutAndWait(FADE_FAST)
	
end

function MapOpening()
	
	Log("MapOpening")
	
	WaitTime(1.0);

end

function MapEnding()
	
	Log("MapEnding")
	
end

function Ending()
	
	Log("Ending")
	
	--SceneLoad("Fld_M004");
	--main = CameraGetMain();
	--CameraSetMain("CastleView_Opening")

	PuppetDemo("M005", "MID_ED3")
	
	Movie("Scene09")
	SkipEscape()

	PuppetDemo("M005", "MID_ED4")

	--CameraSetMain(main);
	--SceneUnload();
	
end

