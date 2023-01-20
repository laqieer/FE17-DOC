Include("Common")
g_pid_lueur = "PID_リュール"

-- -----------------------------------

function Startup()
	
	Log("Startup")
	
	Startup_紋章士外伝_対象紋章士を一時的に無効化( "GID_セリカ" )
	
	-- 勝利条件の設定
	WinRuleSetDestroyBoss( true )	-- 敵将撃破
	WinRuleSetMID( "MID_RULE_S013_WIN" )
	
	変数登録()
	イベント登録()
	
end

function 変数登録()
	VariableEntry( "セリカ行動開始", 0 )

	VariableEntry( "召喚１", 0 )
	VariableEntry( "召喚２", 0 )
	VariableEntry( "召喚３", 0 )

	VariableEntry( "幻影竜ワープ１済", 0 )
	VariableEntry( "幻影竜ワープ２済", 0 )
	VariableEntry( "幻影竜ワープ３済", 0 )
end

function イベント登録()
	
	EventEntryBattleTalk(Talk, "PID_S013_セリカ", FORCE_ENEMY, g_pid_lueur,			FORCE_PLAYER, true, "戦闘前会話_セリカ_リュール_済",		"MID_BT1")
	EventEntryBattleTalk(Talk, "PID_S013_セリカ", FORCE_ENEMY, "PID_アルフレッド",	FORCE_PLAYER, true, "戦闘前会話_セリカ_アルフレッド_済",	"MID_BT2")
	EventEntryBattleTalk(Talk, "PID_S013_セリカ", FORCE_ENEMY, "PID_セリーヌ",		FORCE_PLAYER, true, "戦闘前会話_セリカ_セリーヌ_済",		"MID_BT3")
	
	EventEntryTurn(開始直後, 1, 1, FORCE_PLAYER)
	EventEntryTurn(勝利条件, 1, 1, FORCE_PLAYER)

	if DifficultyGet() == DIFFICULTY_NORMAL then
		EventEntryTurn(召喚師１, 4, -1, FORCE_PLAYER)
		EventEntryTurn(召喚師２, 4, -1, FORCE_PLAYER)
		EventEntryTurn(召喚師３, 4, -1, FORCE_PLAYER)

	elseif DifficultyGet() == DIFFICULTY_LUNATIC then
		EventEntryTurn(召喚師１, 2, -1, FORCE_PLAYER)
		EventEntryTurn(召喚師２, 2, -1, FORCE_PLAYER)
		EventEntryTurn(召喚師３, 2, -1, FORCE_PLAYER)

	else
		EventEntryTurn(召喚師１, 3, -1, FORCE_PLAYER)
		EventEntryTurn(召喚師２, 3, -1, FORCE_PLAYER)
		EventEntryTurn(召喚師３, 3, -1, FORCE_PLAYER)
	end


	EventEntryTurn(セリカ始動, -1, -1, FORCE_PLAYER)


	EventEntryFixed( 幻影竜ワープ１,	"PID_S013_幻影兵_ワープ１", FORCE_ENEMY, "幻影竜ワープ１済" )
	EventEntryFixed( 幻影竜ワープ２,	"PID_S013_幻影兵_ワープ２", FORCE_ENEMY, "幻影竜ワープ２済" )
	EventEntryFixed( 幻影竜ワープ３,	"PID_S013_幻影兵_ワープ３", FORCE_ENEMY, "幻影竜ワープ３済" )

end

function Cleanup()
	
	Log("Cleanup")
	
	Cleanup_紋章士外伝_対象紋章士の無効化解除( "GID_セリカ" )
	
end

-- -----------------------------------

function Opening()
	
	Log("Opening")
	
	PuppetDemo("S013", "MID_OP1")
	
end

-- -----------------------------------

function MapOpening()
	
	Log("MapOpening")
	
end

-- -----------------------------------

function 開始直後()
	CursorAnimeCreate_FromPid( "PID_S013_セリカ")
	Talk( "MID_EV1" )
	CursorAnimeDelete()
	
	Dispos( "Reinforcement1", DISPOS_FLAG_FOCUS + DISPOS_FLAG_WARP )
	Yield()
	WaitTime( 0.5 )
	
	Dispos( "Reinforcement2", DISPOS_FLAG_FOCUS + DISPOS_FLAG_WARP )
	Yield()
	WaitTime( 0.5 )
	
	Dispos( "Reinforcement3", DISPOS_FLAG_FOCUS + DISPOS_FLAG_WARP )
	Yield()
	WaitTime( 0.5 )
	
	CursorAnimeCreate_FromPid("PID_S013_幻影兵_召喚師３")
	Talk( "MID_EV2" )
	CursorAnimeDelete()
	
end


-- -----------------------------------

function 召喚師１()
	local turn = MapGetTurn() + 1

	if UnitExistOnMap("PID_S013_幻影兵_召喚師１") then
		if turn  % 2 == 1 then
			if VariableGet( "召喚１" )  == 1 then
				VariableSet( "召喚１", 0 )
				Dispos("Reinforcement1_2C", DISPOS_FLAG_FOCUS + DISPOS_FLAG_WARP)
				Yield()
				WaitTime(0.5)
			else
				VariableSet( "召喚１", 1 )
				Dispos("Reinforcement1C", DISPOS_FLAG_FOCUS + DISPOS_FLAG_WARP)
				Yield()
				WaitTime(0.5)
			end
		end
	end
end


function 召喚師２()
	local turn = MapGetTurn() + 1

	if UnitExistOnMap("PID_S013_幻影兵_召喚師２") then
		if turn  % 2 == 0 then
			if VariableGet( "召喚２" )  == 1 then
				VariableSet( "召喚２", 0 )
				Dispos("Reinforcement2C", DISPOS_FLAG_FOCUS + DISPOS_FLAG_WARP)
				Yield()
				WaitTime(0.5)
			else
				VariableSet( "召喚２", 1 )
				Dispos("Reinforcement2_2C", DISPOS_FLAG_FOCUS + DISPOS_FLAG_WARP)
				Yield()
				WaitTime(0.5)
			end
		end
	end
end

function 召喚師３()
	local turn = MapGetTurn() + 1

	if UnitExistOnMap("PID_S013_幻影兵_召喚師３") then
		if turn  % 2 == 1 then
			if VariableGet( "召喚３" )  == 1 then
				VariableSet( "召喚３", 0 )
				Dispos("Reinforcement3_2C", DISPOS_FLAG_FOCUS + DISPOS_FLAG_WARP)
				Yield()
				WaitTime(0.5)
			else
				VariableSet( "召喚３", 1 )
				Dispos("Reinforcement3C", DISPOS_FLAG_FOCUS + DISPOS_FLAG_WARP)
				Yield()
				WaitTime(0.5)
			end
		end
	end
end


-- -----------------------------------

function セリカ始動()
	local count = 0
	if VariableGet( "セリカ行動開始" )  == 0 then
		if not UnitExistOnMap("PID_S013_幻影兵_召喚師１") then
			count = count + 1
		end
		if not UnitExistOnMap("PID_S013_幻影兵_召喚師２") then
			count = count + 1
		end
		if not UnitExistOnMap("PID_S013_幻影兵_召喚師３") then
			count = count + 1
		end

		if count > 1 then
			Dispos( "Reinforcement4", DISPOS_FLAG_FOCUS )
			Yield()
			WaitTime( 0.5 )

			if DifficultyGet() != DIFFICULTY_NORMAL then
				AiSetSequence("PID_S013_セリカ", AI_ORDER_CAUSE, "AI_AC_Everytime")
			end

			AiSetSequence("S013_幻影竜１", AI_ORDER_CAUSE, "AI_AC_Everytime")
			AiSetSequence("S013_幻影竜２", AI_ORDER_CAUSE, "AI_AC_Everytime")
			AiSetSequence("S013_幻影竜３", AI_ORDER_CAUSE, "AI_AC_Everytime")

--			UnitClearStatus("PID_S013_セリカ", UNIT_STATUS_MOVE_NOT_ALLOW)
			VariableSet( "セリカ行動開始", 1 )
		end
	end
end

-- -----------------------------------
function 竜ワープ場所チェック(x,y)
	if ( UnitGetByPos(x, y) == nil ) and ( UnitGetByPos(x+1, y) == nil ) and ( UnitGetByPos(x, y+1) == nil ) and ( UnitGetByPos(x+1, y+1) == nil ) then
		return true
	end
	return false
end

--	どこにもワープできなかった場合どうしようかな。気にせず終了でいーか。
function 幻影竜ワープ１()
	posMax = 9
--	dpos = {0, 7,1 , 7,14 ,7,10 , 7,11 ,  8,12 , 8,14 ,8,10 , 8,11 ,  6,12 , 6,14 ,6,10 , 6,11}
--５マスワープ
	dpos = {0, 7,9 , 7,8 ,6,8 ,8,8 ,  5,7 ,6,7 ,7,7 ,8,7, 9,7 }


	if UnitGetByPos(7, 4) != nil then
		for i = 1, posMax do
			x = dpos[i*2]
			y = dpos[i*2+1]
			chk = 竜ワープ場所チェック(x,y)
			if chk == true then
				Log( tostring( x ) )
				Log( tostring( y ) )
				UnitWarpOut("PID_S013_幻影竜１")
				--UnitSetShow("PID_S013_幻影竜１", false)
				Yield()
				WaitTime(1.0)
				UnitSetPos("PID_S013_幻影竜１", x, y)
				CursorSetPos_FromPid("PID_S013_幻影竜１")
				MapCameraWait()
				UnitWarpIn("PID_S013_幻影竜１")
				--UnitSetShow("PID_S013_幻影竜１", true)
				Yield()
				WaitTime(1.0)
				break
			end
		end
	end
--	UnitSetShow(pid, enable)
	VariableSet( "幻影竜ワープ１済", 1 )
end


function 幻影竜ワープ２()
	posMax = 9
--	dpos = {0, 13,13 , 13,15 ,13,11 , 13,14 ,  14,13 , 14,15 ,14,11 , 14,14 ,  12,13 , 12,15 ,12,11 , 12,14}	--８マスワープ
	dpos = {0, 13,8 , 13,7 ,12,7 ,14,7 ,  11,6 ,12,6 ,13,6 ,14,6, 15,6 }

	if UnitGetByPos(13, 3) != nil then
		for i = 1, posMax do
			x = dpos[i*2]
			y = dpos[i*2+1]
			chk = 竜ワープ場所チェック(x,y)
			if chk == true then
				Log( tostring( x ) )
				Log( tostring( y ) )
				UnitWarpOut("PID_S013_幻影竜２")
				--UnitSetShow("PID_S013_幻影竜２", false)
				Yield()
				WaitTime(1.0)
				UnitSetPos("PID_S013_幻影竜２", x, y)
				CursorSetPos_FromPid("PID_S013_幻影竜２")
				MapCameraWait()
				UnitWarpIn("PID_S013_幻影竜２")
				--UnitSetShow("PID_S013_幻影竜２", true)
				Yield()
				WaitTime(1.0)
				break
			end
		end
	end
--	UnitSetShow(pid, enable)
	VariableSet( "幻影竜ワープ２済", 1 )
end


function 幻影竜ワープ３()
	posMax = 9
--	dpos = {0, 18,12 , 18,14 ,18,10 , 18,11 ,  19,12 , 19,14 ,19,10 , 19,11 ,  17,12 , 17,14 ,17,10 , 17,11}
	dpos = {0, 18,8 , 17,7 ,18,7 ,19,7 ,  16,6 ,17,6 ,18,6 ,19,6, 20,6 }

	if UnitGetByPos(18, 3) != nil then
		for i = 1, posMax do
			x = dpos[i*2]
			y = dpos[i*2+1]
			chk = 竜ワープ場所チェック(x,y)
			if chk == true then
				Log( tostring( x ) )
				Log( tostring( y ) )
				UnitWarpOut("PID_S013_幻影竜３")
				--UnitSetShow("PID_S013_幻影竜３", false)
				Yield()
				WaitTime(1.0)
				UnitSetPos("PID_S013_幻影竜３", x, y)
				CursorSetPos_FromPid("PID_S013_幻影竜３")
				MapCameraWait()
				UnitWarpIn("PID_S013_幻影竜３")
				--UnitSetShow("PID_S013_幻影竜３", true)
				Yield()
				WaitTime(1.0)
				break
			end
		end
	end
--	UnitSetShow(pid, enable)
	VariableSet( "幻影竜ワープ３済", 1 )
end

--	龍をワープさせる。
--	S013_幻影兵_ワープ１
--	S013_幻影兵_ワープ２


-- -----------------------------------

function MapEnding()
	
	Log("MapEnding")
	
end

-- -----------------------------------

function Ending()
	
	Log("Ending")
	
	PuppetDemo("S013", "MID_ED1")
	
	紋章士外伝_レベルキャップ開放( "セリカ", "S013" )
	
end

function GameOver()
	
	Log("GameOver")
	
end
