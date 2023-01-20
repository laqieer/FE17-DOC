Include("Common")

g_pid_lueur = "PID_リュール"

g_avalanche_distance = 10
g_key_avalanche_turn = "雪崩ターン"
g_key_avalanche_index = "雪崩リストインデックス"

-- どの順番で雪崩がくるか
g_avalanche_lanelist = { 2, 1, 3 }

g_avalanche_area = {
	{ Z0=3,		Z1=7 },
	{ Z0=11,	Z1=15 },
	{ Z0=19,	Z1=23 }
	}
	
g_map_width = 32

-- -----------------------------------

function Startup()
	
	Log("Startup")
	
	
	-- 勝利条件設定：敵将撃破
	WinRuleSetEnemyNumberLessThanOrEqualTo( -1 )	-- ○人以下になったらゲームクリア。0で敵全滅。-1を設定したら判定無効化
	
	
	if ( DifficultyGet() == DIFFICULTY_NORMAL ) then
		WinRuleSetLimitTurn(-20)
		WinRuleSetMID( "MID_RULE_M024_WIN", 20 )
		LoseRuleSetMID( "MID_RULE_M024_LOSE", 20 )
		
	else
		WinRuleSetLimitTurn(-15)
		WinRuleSetMID( "MID_RULE_M024_WIN", 15 )
		LoseRuleSetMID( "MID_RULE_M024_LOSE", 15 )
		
	end
	
	
	フラグ登録()
	イベント登録()
	
end

function フラグ登録()
	VariableEntry( g_key_avalanche_turn, 0 )
	VariableEntry( g_key_avalanche_index, 0 )
end

function イベント登録()
	
	EventEntryTurn(青１ターン直前, 1, 1, FORCE_PLAYER)
	EventEntryTurn(勝利条件_M024, 1, 1, FORCE_PLAYER)
	
	EventEntryTurn( 青ターン開始直前_雪崩, 2, -1, FORCE_PLAYER )
	
	EventEntryTurn(青ターン直前_増援１,  2,  2, FORCE_PLAYER)
	EventEntryTurn(青ターン直前_増援２,  4,  4, FORCE_PLAYER)
	EventEntryTurn(青ターン直前_増援３,  6,  6, FORCE_PLAYER)
	EventEntryTurn(青ターン直前_増援４,  8,  8, FORCE_PLAYER)
	EventEntryTurn(青ターン直前_増援５, 10, 10, FORCE_PLAYER, condition_ノーマル以上か)
	EventEntryTurn(青ターン直前_増援６, 12, 12, FORCE_PLAYER)
	
	-- リュール
	EventEntryBattleTalk(Talk, g_pid_lueur,		FORCE_PLAYER, "PID_M024_リュール", FORCE_ENEMY, true, "戦闘前会話_黒リュール_ヴェイル_済",	"MID_BT2")
	EventEntryBattleTalk(Talk, "PID_ヴェイル",	FORCE_PLAYER, "PID_M024_リュール", FORCE_ENEMY, true, "戦闘前会話_黒リュール_リュール_済",	"MID_BT3")
	EventEntryBattleTalk(Talk, "",				FORCE_PLAYER, "PID_M024_リュール", FORCE_ENEMY, true, "戦闘前会話_黒リュール_済",			"MID_BT1")
	EventEntryDie(Talk, "PID_M024_リュール", FORCE_ENEMY, "撃破セリフ_黒リュール_済", "MID_BT4")
	
	EventEntryBattleAfter(黒リュール撃破後, "", FORCE_PLAYER, "PID_M024_リュール", FORCE_ENEMY, true, condition_黒リュール撃破後)
	
end

function Cleanup()
	
	Log("Cleanup")
	
end

-- -----------------------------------

function Opening()
	
	Log("Opening")
	
	PuppetDemo("M024", "MID_OP1")
	PuppetDemo("M024", "MID_OP2")
	PuppetDemo("M024", "MID_OP3")
	
end

function MapOpening()
	
	Log("MapOpening")
	
	FadeOutAndWait( FADE_FAST )
	EffectCreate( "邪竜紋_準備", 30, 13 )
	FadeInAndWait( FADE_FAST )
	
end

-- -----------------------------------

function 勝利条件_M024()
	CursorAnimeCreate_FromPid( "PID_M024_リュール" )
	WinRule()
	CursorAnimeDelete()
	
	Tutorial( "TUTID_ターン制限" )
end

-- -----------------------------------

function 青ターン開始直前_雪崩()
	
	local turn = VariableGet( g_key_avalanche_turn )
	turn = ( turn + 1 ) % 2
	
	if turn == 0 then
		
		CursorSetPos(30, 13)
		MapCameraWait()
		
		EffectPlay( "邪竜紋_発動", 30, 13 )
		EffectDelete( "邪竜紋_準備", 30, 13 )
		WaitTime( 1.5 )
		
		雪崩発生()
		
		
		雪崩警告()
		
		
	else
		
		CursorSetPos(30, 13)
		MapCameraWait()
		
		EffectCreate( "邪竜紋_準備", 30, 13 )
		WaitTime( 1.5 )
		
		
	end
	
	VariableSet( g_key_avalanche_turn, turn )
	
end

-- -----------------------------------

function 青１ターン直前()
	
	CursorSetPos_FromPid( "PID_M024_リュール" )
	PlayFieldBgm(FORCE_PLAYER)
	Talk("MID_EV1")
	
	EffectPlay( "邪竜紋_発動", 30, 13 )
	EffectDelete( "邪竜紋_準備", 30, 13 )
	WaitTime( 1.5 )
	
	雪崩発生()
	
	CursorSetPos_FromPid( g_pid_lueur )
	Talk("MID_EV2")
	
	雪崩警告()
	
	CursorSetPos_FromPid( g_pid_lueur )
	Talk("MID_EV3")
	
	Tutorial( "TUTID_雪崩" )
	
end

function 青ターン直前_増援１()
	Dispos( "Reinforcement1_1", DISPOS_FLAG_FOCUS )
	Yield()
	WaitTime(0.5)
	
	Dispos( "Reinforcement1_2", DISPOS_FLAG_FOCUS )
	Yield()
	WaitTime(0.5)
	
	Dispos( "Reinforcement1_3", DISPOS_FLAG_FOCUS )
	Yield()
	WaitTime(0.5)
end

function 青ターン直前_増援２()
	Dispos( "Reinforcement2_1", DISPOS_FLAG_FOCUS )
	Yield()
	
	Dispos( "Reinforcement2_2", DISPOS_FLAG_FOCUS )
	Yield()
	
	Dispos( "Reinforcement2_3", DISPOS_FLAG_FOCUS )
	Yield()
end

function 青ターン直前_増援３()
	Dispos( "Reinforcement3_1", DISPOS_FLAG_FOCUS )
	Yield()
	
	Dispos( "Reinforcement3_2", DISPOS_FLAG_FOCUS )
	Yield()
	
	Dispos( "Reinforcement3_3", DISPOS_FLAG_FOCUS )
	Yield()
end

function 青ターン直前_増援４()
	Dispos( "Reinforcement4_1", DISPOS_FLAG_FOCUS )
	Yield()
	
	Dispos( "Reinforcement4_2", DISPOS_FLAG_FOCUS )
	Yield()
	
	Dispos( "Reinforcement4_3", DISPOS_FLAG_FOCUS )
	Yield()
end

function condition_ノーマル以上か()
	
	if DifficultyGet() > DIFFICULTY_NORMAL then
		return true
	end
	
	return false
end

function 青ターン直前_増援５()
	Dispos( "Reinforcement5_1", DISPOS_FLAG_FOCUS )
	Yield()
	
	Dispos( "Reinforcement5_2", DISPOS_FLAG_FOCUS )
	Yield()
end

function 青ターン直前_増援６()
	Dispos( "Reinforcement6_1", DISPOS_FLAG_FOCUS )
	Yield()
	
	Dispos( "Reinforcement6_2", DISPOS_FLAG_FOCUS )
	Yield()
end

-- -----------------------------------

function condition_黒リュール撃破後()
	
	if VariableGet( "撃破セリフ_黒リュール_済" ) == 1 then
		return true
	end
	
	return false
end

function 黒リュール撃破後()
	
	VariableSet( "勝利", 1 )
	
end

-- -----------------------------------

function MapEnding()
	
	Log("MapEnding")
	
	CursorSetPos( 30, 13 )
	MapCameraWait()
	
	-- 邪竜紋の破壊
	EventBrokenObject( 30, 13 )
	WaitTime( 2.0 )
	
end

function Ending()
	
	Log("Ending")
	
end

function GameOver()
	
	Log("GameOver")
	
end


-- -----------------------------------
-- 細かい計算処理
-- -----------------------------------

function 中心点を算出( table_unit )
	
	local x = 0
	local z = 0
	local count = 0
	local center_x = nil
	local center_z = nil
	
	if ( #table_unit > 0 ) then
			for i=1, #table_unit do
					local t = table_unit[i]
					x = ( x + t.X )
					z = ( z + t.Z )
					count = count + 1
			end
			
			center_x = math.floor(x/count + 0.5)
			center_z = math.floor(z/count + 0.5)
	end
	
	return center_x, center_z
	
end

-- -----------------------------------

function ユニットテーブルの作成()
	
	local lane = 雪崩レーン取得()
	local area = g_avalanche_area[lane]
	
	local table_unit = {}
	
	local index = ForceUnitGetFirst(FORCE_PLAYER)
	while index != nil do
		
		local _z = UnitGetZ(index)
		
		if ( area.Z0 <= _z ) and ( _z <= area.Z1 ) then
			table_unit[ #table_unit + 1 ] = { UNIT=index, X=UnitGetX(index), Z=_z }
		end
		
		index = ForceUnitGetNext(index)
		
	end
	
	return table_unit
end

-- -----------------------------------

function 飛行ユニットか(pid)
	if ( UnitGetMoveCost( pid ) == "COST_飛行" ) then
		return true
	else
		return false
	end
end

-- -----------------------------------

function 雪崩警告()
	
	警告仮演出()
	雪崩警告_メッセージ()
	
end

-- -----------------------------------

function 雪崩発生()
	
	-- 雪崩発生_メッセージ()
	
	
	雪崩演出()
	
	
	-- プレイヤー軍全取得
	local table_unit = ユニットテーブルの作成()
	
	-- 道の上にいるユニットは１０マス後ろへ流される
	-- 他のユニット、進入不可地形で止まる
	if ( #table_unit > 0 ) then
		
		
		-- カメラ
		local center_x, center_z = 中心点を算出( table_unit )
		CursorSetPos( center_x, center_z )
		MapCameraWait()
		
		
		-- X座標が小さい順にソートする
		if ( #table_unit > 1 ) then
			table.sort( table_unit,
						function( a, b )
							return ( a.X < b.X )
						end
						)
		end
		
		
		for i=1, #table_unit do
				
				local t = table_unit[i]
				local xOffset = 0
				
				for j=1, g_avalanche_distance do
					
					-- 現在の地形属性
					if ( TerrainGetMoveCost( t.X + xOffset, t.Z ) == "COST_空" ) then
						break
					end
					
					local _xOffset = xOffset - 1
					
					-- 移動先がマップ外
					if ( t.X + _xOffset < 1 ) then
						break
					end
					
					
					-- 他のユニット
					local unit = UnitGetByPos( t.X + _xOffset, t.Z )
					if ( unit != nil ) then
						break
					end
					
					
					-- 移動先の地形属性
					if ( not 飛行ユニットか( t.UNIT ) ) and ( TerrainGetMoveCost( t.X + _xOffset, t.Z ) == "COST_空" ) then
						break
					end
					
					if ( MapOverlapGet( t.X + _xOffset, t.Z ) == "TID_ブロック" ) then
						break
					end
					
					-- 更新
					xOffset = _xOffset
					
				end
				
				-- 移動
				if ( xOffset != 0 ) then
					UnitMovePos( t.UNIT, t.X + xOffset, t.Z, MOVE_FLAG_NONE )
				end
				
		end
		
		
		-- みんなの移動を待つ
		UnitMoveWait()
		
		-- 向きを右向きにしてあげる
		for i=1, #table_unit do
			UnitRotation( table_unit[i].UNIT, ROTATE_RIGHT )
		end
		UnitMoveWait()
		
		MapCameraWait()
		
		
	end
	
	
	-- Dialog( "邪竜脈が元に戻る" )
	
	セトリ番号更新()
	
end

-- -----------------------------------

function 雪崩警告_メッセージ()
	local lane = 雪崩レーン取得()
	
	if		lane == 1 then
		Dialog( "MID_TUT_NAVI_M024_WARNING1" )
		
	elseif	lane == 2 then
		Dialog( "MID_TUT_NAVI_M024_WARNING2" )
		
	elseif	lane == 3 then
		Dialog( "MID_TUT_NAVI_M024_WARNING3" )
		
	end
	
end

-- -----------------------------------

function 雪崩発生_メッセージ()
	local lane = 雪崩レーン取得()
	
	--[[
	local message = "邪竜脈のパワーを放出する演出"
	
	local _message = "\n"
	if		lane == 1 then
		_message = _message .. "「一番下の道」 "
	elseif	lane == 2 then
		_message = _message .. "「真ん中の道」 "
	elseif	lane == 3 then
		_message = _message .. "「一番上の道」 "
	end
	
	_message = _message .. "で雪崩が発生"
	
	message = message .. _message
	message = message .. "\n１０マス後ろに流されます"
	Dialog( message )
	]]
end

-- -----------------------------------

function 雪崩レーン取得()
	
	local laneIndex = VariableGet( g_key_avalanche_index )
	local lane = g_avalanche_lanelist[ laneIndex + 1 ]
	
	return lane
	
end

function セトリ番号更新()
	local laneIndex = VariableGet( g_key_avalanche_index )
	laneIndex = ( laneIndex + 1 ) % #g_avalanche_lanelist
	VariableSet( g_key_avalanche_index, laneIndex )
end

-- -----------------------------------

function 警告仮演出()
	
	local lane = 雪崩レーン取得()
	local area = g_avalanche_area[lane]
	
	CursorSetPos( 25, ( area.Z0 + area.Z1 ) / 2 )
	MapCameraWait()
	
	
	MapRangeAddBegin()
		for _z = area.Z0, area.Z1 do
			for _x=0, g_map_width-1 do
				if TerrainGet( _x, _z ) != "TID_岩" then
					MapRangeAdd( _x, _z )
				end
			end
		end
	MapRangeAddEnd()
	
	
	--[[
	TerrainSetBegin()
	for _x=0, g_map_width-1 do
		if _x%2 == 0 then
			
			local _z = area.Z0
			if TerrainGet( _x, _z ) == "TID_道" then
				TerrainSet( _x, _z, "TID_砂漠" )
			end
			
			_z = area.Z1
			if TerrainGet( _x, _z ) == "TID_道" then
				TerrainSet( _x, _z, "TID_砂漠" )
			end
			
		end
	end
	TerrainSetEnd()
	]]
	
	
	WaitTime( 1.0 )
	
end

-- -----------------------------------

function 雪崩演出()
	
	local lane = 雪崩レーン取得()
	local area = g_avalanche_area[lane]
	
	CursorSetPos( g_map_width - 1, ( area.Z0 + area.Z1 ) / 2 )
	CursorSetDistanceMode( CURSOR_DISTANCE_NEAR )
	MapCameraWait()
	CursorSetPos( 1, ( area.Z0 + area.Z1 ) / 2, 13 )
	
	MapRangeClear()
	
	EffectPlay( "雪崩", g_map_width - 1, ( area.Z0 + area.Z1 ) / 2  )
	
	--[[
	local x = g_map_width - 1
	while x >= -4 do
			
			TerrainSetBegin()
			for _x=x, x+4 do
				if ( 0 <= _x ) and ( _x <= g_map_width - 1 ) then
					
					for _z=area.Z0, area.Z1 do
						
						if ( _x == x+4 ) then
							if TerrainGet( _x, _z ) == "TID_砂漠" then
								TerrainSet( _x, _z, "TID_道" )
							end
						else
							if TerrainGet( _x, _z ) == "TID_道" then
								TerrainSet( _x, _z, "TID_砂漠" )
							end
						end
						
					end
					
				end
			end
			TerrainSetEnd()
			
			WaitTime( 0.03 )
			
			x = x - 1
	end
	]]
	
	EffectWait()
	MapCameraWait()
	
end

-- -----------------------------------

