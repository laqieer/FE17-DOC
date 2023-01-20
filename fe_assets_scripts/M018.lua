Include("Common")

-- -----------------------------------

function Startup()
	
	Log("Startup");
	
	-- 勝利条件設定：敵将撃破
	WinRuleSetDestroyBoss(true)
	WinRuleSetMID( "MID_RULE_M018_WIN" )
	
	イベント登録();
	

end

function イベント登録()
	
	-- 宝箱
	EventEntryTbox(宝箱入手, 6, 20, "IID_はやての羽");
	EventEntryTbox(宝箱入手, 27, 11, "IID_チェンジプルフ");
	
	EventEntryTurn(火炎砲台チュートリアル, 1, 1, FORCE_PLAYER, "火炎砲台チュートリアル_済");
	EventEntryTurn(リンデンのひとこと, 1, 1, FORCE_PLAYER, "リンデンのひとこと_済");
	EventEntryTurn(勝利条件, 1, 1, FORCE_PLAYER)
	EventEntryTurn(宝を狙うシーフ, 2, 2, FORCE_PLAYER, "宝を狙うシーフ_済");
	
	-- 増援
	EventEntryTurn(増援６ターン目, 6, 6, FORCE_PLAYER);
	
	-- リュールと赤リンデン会話	
	EventEntryTalk(リンデン加入_リュール,"PID_リュール",FORCE_PLAYER, "PID_リンデン", FORCE_ENEMY, true, "リンデン会話_リュール_済")				
	-- アイビーと赤リンデン会話
	EventEntryTalk(リンデン加入_アイビー,"PID_アイビー",FORCE_PLAYER, "PID_リンデン", FORCE_ENEMY, true, "リンデン会話_アイビー_済")
	
	-- オルテンシアと赤リンデン会話	
	EventEntryTalk(リンデン加入_オルテンシア,"PID_オルテンシア",FORCE_PLAYER, "PID_リンデン", FORCE_ENEMY, true, "リンデン会話_オルテンシア_済")
	-- ボス会話
	EventEntryBattleTalk(Talk, "PID_リンデン",FORCE_PLAYER, "PID_M018_イルシオン兵_ボス", FORCE_ENEMY, true, "戦闘前会話_ボス_リンデン_済",		"MID_BT6");
	EventEntryBattleTalk(Talk, "",FORCE_PLAYER, "PID_M018_イルシオン兵_ボス", FORCE_ENEMY, true, "戦闘前会話_ボス_済","MID_BT3");
	EventEntryDie(Talk, "PID_M018_イルシオン兵_ボス", FORCE_ENEMY, "死亡セリフ_ボス_済", "MID_BT7");
	
	-- リンデン戦闘前会話
	EventEntryBattleTalk(Talk, "", FORCE_PLAYER, "PID_リンデン", FORCE_ENEMY, true, "戦闘前会話_リンデン_済", "MID_BT1");
	EventEntryDie(EmptyFunction, "PID_リンデン", FORCE_ALL, "S_リンデン_死亡_済")
	
end

function 宝を狙うシーフ()
	
	CursorSetPos_FromPid("PID_M018_シーフ")
	WaitTime(1.0)
	
	Talk("MID_EV4");
	
	CursorAnimeCreate(4, 1);
	CursorAnimeDelete()
	WaitTime(1.0)
	
end

function リンデンのひとこと()
	CursorSetPos(26, 14);
	MapCameraWait();
	Talk("MID_OP3");
end

function 火炎砲台チュートリアル()
	CursorAnimeCreate(15, 13);
	Talk("MID_OP4");
	CursorAnimeDelete()
	
	Tutorial( "TUTID_火炎砲台" );
end

function Cleanup()
	
	Log("Cleanup");
	
end

-- -----------------------------------

function Opening()
	Log("Opening");
	PuppetDemo("M018", "MID_OP1")
	PuppetDemo("M018", "MID_OP2")
end

function MapOpening()
	
	Log("MapOpening");
	
	-- リンデンに「SID_死亡会話存在敵」を付与
	スキル装備( "PID_リンデン", "SID_死亡会話存在敵" )
	
end

-- -----------------------------------

function リンデン加入_リュール()
	Talk("MID_TK1");
	リンデン加入();
end

function リンデン会話_リュール()
	Talk("MID_TK4");
end

function リンデン加入_アイビー()
	Talk("MID_TK2");
	リンデン加入();
end

function リンデン会話_アイビー()
	Talk("MID_TK5");
end

function リンデン加入_オルテンシア()
	Talk("MID_TK3");
	リンデン加入();
end

function リンデン会話_オルテンシア()
	Talk("MID_TK6");
end

function リンデン加入()
	pid = "PID_リンデン";
	if UnitExistOnMap( pid ) then
		UnitJoin( pid );
		
		-- リンデンから「SID_死亡会話存在敵」を削除
		スキル解除( "PID_リンデン", "SID_死亡会話存在敵" )
	end
end

function 増援６ターン目()
	
	if DifficultyGet() == DIFFICULTY_NORMAL then
		return false
	end
	
	Dispos("Enemy_Reinforcement0", DISPOS_FLAG_FOCUS);
	Yield();
	WaitTime(0.5);
end

-- -----------------------------------

function EmptyFunction()
end

-- -----------------------------------

function MapEnding()
	
	Log("MapEnding");
	
end

function Ending()
	
	Log("Ending");
	
end

function GameOver()
	
	Log("GameOver");
	
end