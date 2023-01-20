Include("Common")
Include("Hub_Common")

g_key_person_a = "G_アイテム入手済み_村人Ａ";
g_key_person_b = "G_アイテム入手済み_村人Ｂ";
g_key_person_c = "G_アイテム入手済み_村人Ｃ";

-- -----------------------------------

function Startup()
	
	Log("Startup");
	
	VariableEntry( g_key_person_a );
	VariableEntry( g_key_person_b );
	VariableEntry( g_key_person_c );
end

function Cleanup()
	
	Log("Cleanup");
	
end

-- -----------------------------------

function Opening()
	
	Log("Opening");
	
end

function MapOpening()
	
	Log("MapOpening");
	
end

function MapEnding()
	
	Log("MapEnding");
end

function Ending()

	-- 遭遇戦時は処理しない
	if HubIsEncountMap() == false then
		if VariableGet("S_M012_村人Ａ_死亡") == 0 and VariableGet( g_key_person_a ) == 0 then
			ItemGain(nil, "IID_アイスロック");
		end
	
		if VariableGet("S_M012_村人Ｂ_死亡") == 0 and VariableGet( g_key_person_b ) == 0 then
			ItemGain(nil, "IID_特効薬");
		end
	
		if VariableGet("S_M012_村人Ｃ_死亡") == 0 and VariableGet( g_key_person_c ) == 0 then
			ItemGain(nil, "IID_マスタープルフ");
		end
	end

	Log("Ending");
	
	--SceneLoad("Fld_M004");
	--main = CameraGetMain();
	--CameraSetMain("CastleView_Opening")

		PuppetDemo("M012", "MID_ED1")
		PuppetDemo("M012", "MID_ED2")
		PuppetDemo("M012", "MID_ED3")
	
	--CameraSetMain(main);
	--SceneUnload();
	
	-- フォガート隊のヘルプ内容を変更
	VariableSet( "G_置換_MPID_H_Fogato",	1 )
	VariableSet( "G_置換_MPID_H_Pandoro",	1 )
	VariableSet( "G_置換_MPID_H_Bonet",		1 )
	
end

-- セーブからロードされたときの状況再現関数
function Prepare()

	-- アイテム入手済みならセリフを変えておく
	if VariableGet( g_key_person_a ) != 0 then
		HubChangeTalk("PID_M012_村人Ａ", "MID_KR_NPC1_M012");
	end
		
	if VariableGet( g_key_person_b ) != 0 then
		HubChangeTalk("PID_M012_村人Ｂ", "MID_KR_NPC2_M012");
	end
		
	if VariableGet( g_key_person_c ) != 0 then
		HubChangeTalk("PID_M012_村人Ｃ", "MID_KR_NPC3_M012");
	end

end

function NPC1Talk()

	Log("Npc1");

	if VariableGet( g_key_person_a ) != 0 then
		return;
	end

	ItemGain(nil, "IID_アイスロック");

	HubChangeTalk("PID_M012_村人Ａ", "MID_KR_NPC1_M012");
	VariableSet( g_key_person_a, 1);
end

function NPC2Talk()

	Log("Npc1");

	if VariableGet( g_key_person_b ) != 0 then
		return;
	end

	ItemGain(nil, "IID_特効薬");

	HubChangeTalk("PID_M012_村人Ｂ", "MID_KR_NPC2_M012");
	VariableSet( g_key_person_b, 1);

end

function NPC3Talk()

	Log("Npc3");

	if VariableGet( g_key_person_c ) != 0 then
		return;
	end

	ItemGain(nil, "IID_マスタープルフ");

	HubChangeTalk("PID_M012_村人Ｃ", "MID_KR_NPC3_M012");
	VariableSet( g_key_person_c, 1);

end

function GameOver()
	
	Log("GameOver");
	
end