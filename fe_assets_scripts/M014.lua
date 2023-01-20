Include("Common")
Include("Common_E")

g_pid_lueur = "PID_リュール";
g_key_area = "ボス部屋アクティブ_済"
g_key_bosszou = "ボス部屋増援_済"

-- -----------------------------------

emblem_effect = {
--	{10,  5},
--	{20,  5},
--	{12,  3},
--	{18,  3},

	{10, 13},
	{12, 13},
	{18, 13},
	{20, 13},

	{10, 14},
	{12, 14},
	{18, 14},
	{20, 14}

}


-- -----------------------------------

function Startup()
	
	Log("Startup");
	
	-- 勝利条件設定：敵将撃破
	WinRuleSetDestroyBoss(true)
	WinRuleSetMID( "MID_RULE_M014_WIN" )

	フラグ登録()
	イベント登録()
	
	
end

function フラグ登録()
	
	VariableEntry(g_key_area, 0)
	VariableEntry(g_key_bosszou, 0)
	
	E_BattleTalk_VariableEntry()
	
end


function イベント登録()
	EventEntryTurn(勝利条件, 1, 1, FORCE_PLAYER)
	
	if DifficultyGet() == DIFFICULTY_NORMAL then
		EventEntryTurn(右盗賊登場, 3, 3, FORCE_PLAYER);
		EventEntryTurn(左盗賊登場, 4, 4, FORCE_PLAYER);
		EventEntryTurn(青７ターン直前_増援, 8, 8, FORCE_PLAYER);
		EventEntryTurn(青１２ターン直前_増援, 13, 13, FORCE_PLAYER);

	elseif DifficultyGet() == DIFFICULTY_LUNATIC then

		EventEntryTurn(右盗賊登場, 2, 2, FORCE_PLAYER);
		EventEntryTurn(左盗賊登場, 2, 2, FORCE_PLAYER);
		EventEntryTurn(青７ターン直前_増援, 7, 7, FORCE_PLAYER);
		EventEntryTurn(青１２ターン直前_増援, 12, 13, FORCE_PLAYER);

	else
		EventEntryTurn(右盗賊登場, 2, 2, FORCE_PLAYER);
		EventEntryTurn(左盗賊登場, 3, 3, FORCE_PLAYER);
		EventEntryTurn(青７ターン直前_増援, 7, 7, FORCE_PLAYER);
		EventEntryTurn(青１２ターン直前_増援, 12, 12, FORCE_PLAYER);
	end
	
	-- ボス部屋
	EventEntryArea(ボス部屋アクティブ化, 10, 18, 20, 23, FORCE_PLAYER, g_key_area)
	EventEntryTurn(ボス部屋増援, -1, -1, FORCE_PLAYER);


	-- 宝箱
	EventEntryTbox(宝箱入手,  3, 26, "IID_銀身の法")
	EventEntryTbox(宝箱入手,  6, 26, "IID_ドラゴンキラー")
	EventEntryTbox(宝箱入手, 24, 26, "IID_ブーツ")
	EventEntryTbox(宝箱入手, 27, 26, "IID_光の弓")
	
	-- オルテンシア
	EventEntryBattleTalk(Talk, "PID_アイビー", FORCE_PLAYER, "PID_M014_オルテンシア", FORCE_ENEMY, true, "戦闘前会話_オルテンシア_アイビー_済", "MID_BT2");
	EventEntryBattleTalk(Talk, "", FORCE_PLAYER, "PID_M014_オルテンシア", FORCE_ENEMY, true, "戦闘前会話_オルテンシア_済", "MID_BT1");
	EventEntryReviveAfter(	オルテンシア暴走後, "PID_M014_オルテンシア", FORCE_ENEMY, "オルテンシア暴走後_済" )
	
	EventEntryDie(Talk, "PID_M014_オルテンシア", FORCE_ENEMY, condition_true, "MID_BT3");
	
	-- セピア
	E_BattleTalkEntry_Sepia( "PID_M014_セピア" )
	EventEntryBattleTalk(Talk, g_pid_lueur, FORCE_PLAYER, "PID_M014_セピア", FORCE_ENEMY, true, "戦闘前会話_セピア_リュール_済", "MID_BT5");
	EventEntryBattleTalk(Talk, "", FORCE_PLAYER, "PID_M014_セピア", FORCE_ENEMY, true, "戦闘前会話_セピア_済", "MID_BT4");
	EventEntryDie(Talk, "PID_M014_セピア", FORCE_ENEMY, condition_true, "MID_BT6");
	
	-- マロン
	E_BattleTalkEntry_Marron( "PID_M014_マロン" )
	EventEntryBattleTalk(Talk, "", FORCE_PLAYER, "PID_M014_マロン", FORCE_ENEMY, true, "戦闘前会話_マロン_済", "MID_BT7");
	EventEntryDie(Talk, "PID_M014_マロン", FORCE_ENEMY, condition_true, "MID_BT8");
	
	-- モーヴ
	EventEntryBattleTalk(Talk, "", FORCE_PLAYER, "PID_M014_モーヴ", FORCE_ENEMY, true, "戦闘前会話_モーヴ_済", "MID_BT9");
	EventEntryDie(Talk, "PID_M014_モーヴ", FORCE_ENEMY, condition_true, "MID_BT10");
	
end

function Cleanup()
	
	Log("Cleanup");
	
end

-- -----------------------------------

function Opening()
	
	Log("Opening");

	PuppetDemo("M014", "MID_OP1")
	PuppetDemo("M014", "MID_OP2")
	PuppetDemo("M014", "MID_OP3")
	PuppetDemo("M014", "MID_OP4")

end

function MapOpening()
	
	Log("MapOpening");
	UnitSetItemEquip( "PID_M014_オルテンシア", "IID_ベレト_ルーン" )
	

--	紋章氣エフェクトの配置( emblem_effect )

--	リュール軍到着();
	
--	FadeWait();
--	WaitTime(1.0);
--	CursorSetPos_FromPid_DistanceModeNear("PID_M014_オルテンシア");
--	Dispos( "Enemy_OP1", DISPOS_FLAG_NONE )
--	Yield();
--	WaitTime(0.5)
--	CursorSetPos_FromPid( "PID_M014_オルテンシア" );
--	MapOpening_スフォリア連行()
--	Talk("MID_OP4");
--	Dispos("Enemy_OP11", DISPOS_FLAG_NONE)
--	Yield()
	--周回カメラ()


end

-- -----------------------------------

function MapOpening_イルシオン兵入場()
	
	-- 真ん中
	Dispos( "Enemy_OP2", DISPOS_FLAG_NONE )
	WaitTime(0.2)
	Dispos( "Enemy_OP3", DISPOS_FLAG_NONE )
	WaitTime(0.2)
	Dispos( "Enemy_OP4", DISPOS_FLAG_NONE )
	Yield();
	WaitTime(0.5)
	
	
	-- 左翼
	CursorSetPos( 5, 21 )
	MapCameraWait();
	
	
	Dispos( "Enemy_OP5", DISPOS_FLAG_NONE )
	WaitTime(0.2)
	Dispos( "Enemy_OP6", DISPOS_FLAG_NONE )
	Yield();
	WaitTime(0.5)
	
	
	-- 右翼
	CursorSetPos( 25, 21 )
	MapCameraWait();
	
	
	Dispos( "Enemy_OP7", DISPOS_FLAG_NONE )
	WaitTime(0.2)
	Dispos( "Enemy_OP8", DISPOS_FLAG_NONE )
	Yield();
	WaitTime(0.5)
	
	
	-- 下の方
	Dispos( "Enemy_OP9", DISPOS_FLAG_FOCUS )
	Yield();
	WaitTime(0.5)
	
	
	Dispos( "Enemy_OP10", DISPOS_FLAG_FOCUS )
	Yield();
	WaitTime(0.5)
	
end

function MapOpening_スフォリア連行()
	
	-- スフォリア連行
	UnitMovePos("PID_スフォリア",  14, 28, MOVE_FLAG_ESCAPE);
	UnitMovePos("PID_M014_マロン", 13, 28, MOVE_FLAG_ESCAPE);
	
	UnitMoveWait();
	if UnitExistOnMap("PID_スフォリア") then
		UnitDelete("PID_スフォリア");
	end
	if UnitExistOnMap("PID_M014_マロン") then
		UnitDelete("PID_M014_マロン");
	end
	
	WaitTime(0.5);
	
end

-- -----------------------------------

function 周回カメラ()
	
	FadeOutAndWait(FADE_NORMAL);
	
	-- 四狗を移動させる
		
	--	UnitMovePos("PID_M014_セピア", 15, 13, MOVE_FLAG_ESCAPE);
	--	UnitMovePos("PID_M014_モーヴ", 25, 20, MOVE_FLAG_ESCAPE);
	
	
	-- スタート地点にとぶ
	CursorSetPos(15, 7);
	CursorSetDistanceMode(CURSOR_DISTANCE_NEAR);
	MapCameraWait();
	
	
	-- スキップ強制解除
	SkipEscape();
	
	FadeInAndWait(FADE_NORMAL);
	
	AroundCameraSetPos(15, 13);
	AroundCameraSetPos( 5, 13);
	AroundCameraSetPos( 5, 25);
	AroundCameraSetPos(25, 25);
	AroundCameraSetPos(25,  7);
	AroundCameraSetPos(15,  7);
	
	FadeOutAndWait(FADE_NORMAL);
	CursorSetPos_FromPid(g_pid_lueur);
	FadeInAndWait(FADE_NORMAL);
	
end

-- -----------------------------------

function リュール軍到着()
	-- リュール達一旦退避
	UnitSetPosFromPos(17,4, 17,1);
	UnitSetPosFromPos(16,4, 16,1);
	UnitSetPosFromPos(14,4, 14,1);
	UnitSetPosFromPos(13,4, 13,1);
	UnitSetPosFromPos(17,5, 17,2);
	UnitSetPosFromPos(16,5, 16,2);
	UnitSetPosFromPos(14,5, 14,2);
	UnitSetPosFromPos(13,5, 13,2);
	UnitSetPosFromPos(16,6, 16,3);
	UnitSetPosFromPos(15,6, 15,3);
	UnitSetPosFromPos(14,6, 14,3);
	UnitSetPosFromPos(15,7, 15,4);
	
	
	CursorSetPos(15, 6);
	CursorSetDistanceMode(CURSOR_DISTANCE_NEAR);
	MapCameraWait();
	
	FadeIn(FADE_NORMAL);	-- このフェードいる？
	WaitTime(0.1);
	
	-- リュール達一旦退避
	UnitMovePosFromPos(15,4, 15,7);
	UnitMovePosFromPos(14,3, 14,6);
	UnitMovePosFromPos(15,3, 15,6);
	UnitMovePosFromPos(16,3, 16,6);
	UnitMovePosFromPos(13,2, 13,5);
	UnitMovePosFromPos(14,2, 14,5);
	UnitMovePosFromPos(16,2, 16,5);
	UnitMovePosFromPos(17,2, 17,5);
	UnitMovePosFromPos(13,1, 13,4);
	UnitMovePosFromPos(14,1, 14,4);
	UnitMovePosFromPos(16,1, 16,4);
	UnitMovePosFromPos(17,1, 17,4);
	UnitMoveWait();
end

-- -----------------------------------

function オルテンシア暴走後()
	CursorSetPos_FromPid( "PID_M014_オルテンシア" )
	Yield()
	WaitTime(0.5)

	--Dialog("ベレト暴走")
	Talk( "MID_EV1" )	--ベレト暴走
	UnitSetItemEquip( "PID_M014_オルテンシア", "IID_ベレト_天帝の覇剣" )
	
	Tutorial("TUTID_暴走")
	
	
	AiSetPriority("PID_M014_オルテンシア", 50)

	AiSetPriority("PID_M014_マロン", 100)
	AiSetPriority("PID_M014_モーヴ", 100)
	AiSetPriority("PID_M014_セピア", 100)
	AiSetPriority("PID_M014_イルシオン兵_ブレイブヒーロー", 100)
	AiSetPriority("PID_M014_イルシオン兵_ソードファイター", 100)
	AiSetPriority("PID_M014_イルシオン兵_ハイプリースト", 100)
	AiSetPriority("PID_M014_イルシオン兵_モンク", 100)
	AiSetPriority("PID_M014_イルシオン兵_ソードマスター", 100)

	AiSetSequence("PID_M014_オルテンシア", AI_ORDER_ATTACK, "AI_AT_EngageDance","1,1")

	AiSetSequence("PID_M014_イルシオン兵_ブレイブヒーロー", AI_ORDER_CAUSE, "AI_AC_Everytime")
	AiSetSequence("PID_M014_イルシオン兵_ソードファイター", AI_ORDER_CAUSE, "AI_AC_Everytime")
	AiSetSequence("PID_M014_イルシオン兵_ハイプリースト", AI_ORDER_CAUSE, "AI_AC_Everytime")
	AiSetSequence("PID_M014_イルシオン兵_モンク", AI_ORDER_CAUSE, "AI_AC_Everytime")
	AiSetSequence("PID_M014_イルシオン兵_ソードマスター", AI_ORDER_CAUSE, "AI_AC_Everytime")

	if	MapGetPhase() == FORCE_PLAYER then
		VariableSet( g_key_bosszou, 1 );
		Dispos( "Enemy_Reinforcement4", DISPOS_FLAG_FOCUS )
		Yield()
		WaitTime(0.5)
	end
end

function ボス部屋増援()

	if VariableGet( g_key_bosszou ) == 0 then
		if VariableGet( "オルテンシア暴走後_済" ) == 1 then
			VariableSet( g_key_bosszou, 1 );
			Dispos( "Enemy_Reinforcement4", DISPOS_FLAG_FOCUS )
			Yield()
			WaitTime(0.5)
		end
	end
end

function ボス部屋アクティブ化()

	--	ここで何某か会話イベントして、エンゲージ技の設定とかする。
	--AiSetSequence("PID_M014_オルテンシア", AI_ORDER_ATTACK, "AI_AT_EngageAttack")


	UnitClearStatus("PID_M014_オルテンシア", UNIT_STATUS_MOVE_NOT_ALLOW)

	AiSetSequence("PID_M014_オルテンシア", AI_ORDER_CAUSE, "AI_AC_Everytime")	--	AI_AC_InterferenceRange
	AiSetSequence("PID_M014_セピア", AI_ORDER_CAUSE, "AI_AC_Everytime")
	AiSetSequence("PID_M014_マロン", AI_ORDER_CAUSE, "AI_AC_Everytime")
	AiSetSequence("PID_M014_モーヴ", AI_ORDER_CAUSE, "AI_AC_Everytime")

	VariableSet(g_key_area, 1)


	--Dispos( "Enemy_Reinforcement4", DISPOS_FLAG_FOCUS )
	--Yield()
	--WaitTime(0.5)

end

function 左盗賊登場()
	Dispos("Enemy01", DISPOS_FLAG_FOCUS);
	Yield();
	WaitTime(0.5);
end

function 右盗賊登場()
	Dispos("Enemy02", DISPOS_FLAG_FOCUS);
	Yield();
	WaitTime(0.5);
end

function 青７ターン直前_増援()
	
	Dispos( "Enemy_Reinforcement1", DISPOS_FLAG_FOCUS )
	Yield()
	WaitTime(0.5)
	
	Dispos( "Enemy_Reinforcement2", DISPOS_FLAG_FOCUS )
	Yield()
	WaitTime(0.5)
	
end

function 青１２ターン直前_増援()
	
	Dispos( "Enemy_Reinforcement3", DISPOS_FLAG_FOCUS )
	Yield()
	WaitTime(0.5)
	
	
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
