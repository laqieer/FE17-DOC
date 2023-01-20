-- 参照ファイル
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


function Main()

	Log("Main")

end

--デバッグスキップ(Mainと排他)
function DebugSkip()

	Log("拠点スキップ")

end

-- 紋章士の間からでてソラネルへ
function ToSolanel()

	HubNextMap("Hub_Solanel", "From_GodRoom");

end
