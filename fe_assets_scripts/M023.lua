Include("Common")
Include("Common_E")

g_pid_lueur = "PID_リュール"

g_key_reinforcement_counter	= "増援カウンター"

-- -----------------------------------

g_key_bomb_firstFall = "火山弾_初回落下_済"

g_key_bomb_turn = "火山弾ターン"

g_bomb_point_x1 = "火山弾落下地点X1"
g_bomb_point_z1 = "火山弾落下地点Z1"

g_bomb_point_x2 = "火山弾落下地点X2"
g_bomb_point_z2 = "火山弾落下地点Z2"

g_bomb_point_x3 = "火山弾落下地点X3"
g_bomb_point_z3 = "火山弾落下地点Z3"

g_map_width		= 32
g_map_height	= 27
g_rock_near		= 10
g_rock_max_num	= 3

-- 大岩の塊ポイントリスト
g_rockPoint = {
	{  3, 13 },
	{  6, 16 },
	{  8, 11 },
	{  9,  5 },
	{ 10, 14 },
	{ 11,  9 },
	{ 11, 18 },
	{ 13,  6 },
	{ 13, 23 },
	{ 16, 21 },
	{ 17, 23 },
	{ 20, 12 },
	{ 21, 16 },
	{ 23, 12 },
	{ 25, 18 },
	{ 28, 16 }
	}

-- -----------------------------------

function Startup()
	
	Log("Startup")
	
	-- 勝利条件設定：敵将撃破
	WinRuleSetDestroyBoss(true)
	WinRuleSetMID( "MID_RULE_M023_WIN" )
	
	フラグ登録()
	
	イベント登録()
	
end

function フラグ登録()
	VariableEntry( g_key_bomb_firstFall, 0 )
	
	VariableEntry( g_key_bomb_turn, 0 )
	
	VariableEntry( g_bomb_point_x1, -1 )
	VariableEntry( g_bomb_point_z1, -1 )
	VariableEntry( g_bomb_point_x2, -1 )
	VariableEntry( g_bomb_point_z2, -1 )
	VariableEntry( g_bomb_point_x3, -1 )
	VariableEntry( g_bomb_point_z3, -1 )
	
	VariableEntry( g_key_reinforcement_counter, -1 )
	
	E_BattleTalk_VariableEntry()
	
end

function イベント登録()
	
	EventEntryTurn(チュートリアル_火山弾, 1, 1, FORCE_PLAYER)
	EventEntryTurn(勝利条件, 1, 1, FORCE_PLAYER)
	
	EventEntryTurn(火山弾予告, 2, -1, FORCE_PLAYER,	condition_火山弾予告)
	EventEntryTurn(火山弾落下, 2, -1, FORCE_ENEMY,	condition_火山弾落下)
	
	-- 増援
	EventEntryTurn(増援１,  6,  6, FORCE_PLAYER)
	EventEntryTurn(増援２,  7,  7, FORCE_PLAYER)
	EventEntryTurn(増援３,  8,  8, FORCE_PLAYER)
	EventEntryTurn(増援４,  9,  9, FORCE_PLAYER)
	EventEntryTurn(増援５, 11, 11, FORCE_PLAYER)
	EventEntryTurn(増援６, 13, 18, FORCE_PLAYER, condition_ノーマル以上か)
	EventEntryTurn(増援７, 19, -1, FORCE_PLAYER, condition_ノーマル以上か)
	
	-- セピア
	E_BattleTalkEntry_Sepia( "PID_M023_セピア" )
	EventEntryBattleTalk(Talk, "PID_ヴェイル",	FORCE_PLAYER, "PID_M023_セピア",	FORCE_ENEMY, true, "戦闘前会話_セピア_ヴェイル_済",	"MID_BT2")
	EventEntryBattleTalk(Talk, g_pid_lueur,		FORCE_PLAYER, "PID_M023_セピア",	FORCE_ENEMY, true, "戦闘前会話_セピア_リュール_済",	"MID_BT3")
	EventEntryBattleTalk(Talk, "PID_モーヴ",	FORCE_PLAYER, "PID_M023_セピア",	FORCE_ENEMY, true, "戦闘前会話_セピア_モーヴ_済",	"MID_BT4")
	EventEntryBattleTalk(Talk, "",				FORCE_PLAYER, "PID_M023_セピア",	FORCE_ENEMY, true, "戦闘前会話_セピア_済",			"MID_BT1")
	EventEntryDie(セピア死亡, "PID_M023_セピア", FORCE_ENEMY, "撃破セリフ_セピア_済")
	
	-- グリ
	E_BattleTalkEntry_Gris( "PID_M023_グリ" )
	EventEntryBattleTalk(Talk, "PID_ヴェイル",	FORCE_PLAYER, "PID_M023_グリ",		FORCE_ENEMY, true, "戦闘前会話_グリ_ヴェイル_済",	"MID_BT7")
	EventEntryBattleTalk(Talk, g_pid_lueur,		FORCE_PLAYER, "PID_M023_グリ",		FORCE_ENEMY, true, "戦闘前会話_グリ_リュール_済",	"MID_BT8")
	EventEntryBattleTalk(Talk, "PID_モーヴ",	FORCE_PLAYER, "PID_M023_グリ",		FORCE_ENEMY, true, "戦闘前会話_グリ_モーヴ_済",		"MID_BT9")
	EventEntryBattleTalk(Talk, "",				FORCE_PLAYER, "PID_M023_グリ",		FORCE_ENEMY, true, "戦闘前会話_グリ_済",			"MID_BT6")
	EventEntryDie(グリ死亡, "PID_M023_グリ", FORCE_ENEMY, "撃破セリフ_グリ_済")
	
end

function Cleanup()
	
	Log("Cleanup")
	
end

-- -----------------------------------

function Opening()
	
	Log("Opening")
	
	PuppetDemo("M023", "MID_OP1")
	PuppetDemo("M023", "MID_OP2")
	
end

function MapOpening()
	
	Log("MapOpening")
	
	FadeOutAndWait( FADE_FAST )
	EffectCreate( "邪竜紋_準備", 10, 24 )
	FadeInAndWait( FADE_FAST )
	
end

-- -----------------------------------

function チュートリアル_火山弾()
	
	Talk( "MID_EV1" )
	
	CursorSetPos(10, 24)
	MapCameraWait()
	
	EffectPlay( "邪竜紋_発動", 10, 24 )
	EffectDelete( "邪竜紋_準備", 10, 24 )
	WaitTime( 1.5 )
	
	火山弾_落下(22, 7)
	
	Talk( "MID_EV2" )
	
	Tutorial( "TUTID_邪竜紋" )
	Tutorial( "TUTID_火山弾" )
	
	CursorSetPos_FromPid( g_pid_lueur )
	
end

-- -----------------------------------

function condition_火山弾予告()
	if VariableGet( g_key_bomb_turn ) == 0 then
		return true
	end
	
	return false
end

function 火山弾予告()
	
	CursorSetPos(10, 24)
	MapCameraWait()
	
	
	EffectCreate( "邪竜紋_準備", 10, 24 )
	WaitTime( 1.5 )
	
	
	if VariableGet( g_key_bomb_firstFall ) == 0 then
		
		local existS = UnitExistOnMap( "PID_M023_セピア" )
		local existG = UnitExistOnMap( "PID_M023_グリ" )
		
		
		if existS and existG then
			CursorSetPos_FromPid("PID_M023_セピア")
			Talk( "MID_EV3" )
			
		elseif existS then
			CursorSetPos_FromPid("PID_M023_セピア")
			Talk( "MID_EV3_2" )
			
		elseif existG then
			CursorSetPos_FromPid("PID_M023_グリ")
			Talk( "MID_EV3_3" )
			
		end
		
		
		VariableSet( g_key_bomb_firstFall, 1 )
		
	end
	
	
	火山弾_落下地点決定()
	
	local bomb_x = VariableGet( g_bomb_point_x1 )
	local bomb_z = VariableGet( g_bomb_point_z1 )
	火山弾_落下予告(bomb_x, bomb_z)
	
	bomb_x = VariableGet( g_bomb_point_x2 )
	bomb_z = VariableGet( g_bomb_point_z2 )
	火山弾_落下予告(bomb_x, bomb_z)
	
	bomb_x = VariableGet( g_bomb_point_x3 )
	bomb_z = VariableGet( g_bomb_point_z3 )
	火山弾_落下予告(bomb_x, bomb_z)
	
end

-- -----------------------------------

function condition_火山弾落下()
	local turn = VariableGet( g_key_bomb_turn )	
	local _t = ( turn + 1 ) % 2
	VariableSet( g_key_bomb_turn, _t )
	
	if turn == 0 then
		return true
	end
	
	return false
end

function 火山弾落下()
	
	
	CursorSetPos(10, 24)
	MapCameraWait()
	
	EffectPlay( "邪竜紋_発動", 10, 24 )
	EffectDelete( "邪竜紋_準備", 10, 24 )
	WaitTime( 1.5 )
	
	
	MapRangeClear()
	
	local bomb_x = VariableGet( g_bomb_point_x1 )
	local bomb_z = VariableGet( g_bomb_point_z1 )
	火山弾_落下(bomb_x, bomb_z)
	
	bomb_x = VariableGet( g_bomb_point_x2 )
	bomb_z = VariableGet( g_bomb_point_z2 )
	火山弾_落下(bomb_x, bomb_z)
	
	bomb_x = VariableGet( g_bomb_point_x3 )
	bomb_z = VariableGet( g_bomb_point_z3 )
	火山弾_落下(bomb_x, bomb_z)
	
end

-- -----------------------------------

function 火山弾_落下予告(bomb_x, bomb_z)
	
	if ( bomb_x == -1 ) or ( bomb_z == -1 ) then
		return
	end
	
	CursorSetPos( bomb_x, bomb_z )
	MapCameraWait()
	
	火山弾_落下予告_表示( bomb_x, bomb_z )
	
	CursorAnimeCreate( bomb_x-1, bomb_z-1, "W3H3" )
	CursorAnimeDelete()
	
	-- Dialog( "( " .. bomb_x .. ", " .. bomb_z .. " )を中心とした3×3のマスに\n火山弾が落ちます！" )
end

-- -----------------------------------

function 火山弾_落下予告_表示(bomb_x, bomb_z)
	
	MapRangeAddBegin()
		for z = bomb_z-1, bomb_z+1 do
			for x = bomb_x-1, bomb_x+1 do
				MapRangeAdd(x, z)
			end
		end
	MapRangeAddEnd()
	
end

-- -----------------------------------

function 火山弾_落下(bomb_x, bomb_z)
	
	if ( bomb_x == -1 ) or ( bomb_z == -1 ) then
		return
	end
	
	CursorSetPos( bomb_x, bomb_z )
	MapCameraWait()
	
	
	EffectPlay( "火山弾", bomb_x, bomb_z )
	EffectWait()
	
	
	MapDamageBegin();
	TerrainSetBegin()
	for z = bomb_z-1, bomb_z+1 do
		for x = bomb_x-1, bomb_x+1 do
			
			-- ユニット
			local unit = UnitGetByPos(x, z)
			if unit != nil then
				
				-- ダメージ
				local def = UnitGetCapability(unit, CAPABILITY_DEF, true)
				local damage = math.max(40 - def, 0);
				MapDamageAdd(unit, damage)
				
			end
			
			-- 地形
			if TerrainGet(x, z) == "TID_大岩" then
				TerrainSet(x, z, "TID_地面")
				EventBrokenObject(x, z)			-- 破壊イベント再生
			end
			
		end
	end
	TerrainSetEnd()
	MapDamageEnd();

	WaitTime(1)
	
end

-- -----------------------------------

function 増援１()
	
	Dispos("Reinforcement1_1", DISPOS_FLAG_FOCUS)
	Yield()
	WaitTime(0.5)
	
	Dispos("Reinforcement1_2", DISPOS_FLAG_FOCUS)
	Yield()
	WaitTime(0.5)
	
end

-- -----------------------------------

function 増援２()
	
	Dispos("Reinforcement2_1", DISPOS_FLAG_FOCUS)
	Yield()
	WaitTime(0.5)
	
	Dispos("Reinforcement2_2", DISPOS_FLAG_FOCUS)
	Yield()
	WaitTime(0.5)
	
end

-- -----------------------------------

function 増援３()
	
	Dispos("Reinforcement3_1", DISPOS_FLAG_FOCUS)
	Yield()
	WaitTime(0.5)
	
	Dispos("Reinforcement3_2", DISPOS_FLAG_FOCUS)
	Yield()
	WaitTime(0.5)
	
end

-- -----------------------------------

function 増援４()
	
	Dispos("Reinforcement4_1", DISPOS_FLAG_FOCUS)
	Yield()
	WaitTime(0.5)
	
end

-- -----------------------------------

function 増援５()
	
	Dispos("Reinforcement5_1", DISPOS_FLAG_FOCUS)
	Yield()
	WaitTime(0.5)
	
end

-- -----------------------------------

function 増援６()
	
	local counter = VariableGet( g_key_reinforcement_counter )
	counter = ( counter + 1 ) % 2
	VariableSet( g_key_reinforcement_counter, counter )
	
	if ( counter == 0 ) then
		
		Dispos("Reinforcement6_1", DISPOS_FLAG_FOCUS)
		Yield()
		WaitTime(0.5)
		
		Dispos("Reinforcement6_2", DISPOS_FLAG_FOCUS)
		Yield()
		WaitTime(0.5)
		
	elseif ( counter == 1 ) then
		
		Dispos("Reinforcement6_3", DISPOS_FLAG_FOCUS)
		Yield()
		WaitTime(0.5)
		
		Dispos("Reinforcement6_4", DISPOS_FLAG_FOCUS)
		Yield()
		WaitTime(0.5)
		
	end
	
end

-- -----------------------------------

function condition_ノーマル以上か()
	
	if DifficultyGet() > DIFFICULTY_NORMAL then
		return true
	end
	
	return false
end

function 増援７()
	
	local counter = VariableGet( g_key_reinforcement_counter )
	counter = ( counter + 1 ) % 2
	VariableSet( g_key_reinforcement_counter, counter )
	
	if ( counter == 0 ) then
		
		Dispos("Reinforcement7_1", DISPOS_FLAG_FOCUS)
		Yield()
		WaitTime(0.5)
		
		Dispos("Reinforcement7_2", DISPOS_FLAG_FOCUS)
		Yield()
		WaitTime(0.5)
		
	elseif ( counter == 1 ) then
		
		Dispos("Reinforcement7_3", DISPOS_FLAG_FOCUS)
		Yield()
		WaitTime(0.5)
		
		Dispos("Reinforcement7_4", DISPOS_FLAG_FOCUS)
		Yield()
		WaitTime(0.5)
		
	end
	
end

-- -----------------------------------

function セピア死亡()
	Talk( "MID_BT5" )
end

function グリ死亡()
	Talk( "MID_BT10" )
end

-- -----------------------------------

function MapEnding()
	
	Log("MapEnding")
	
	CursorSetPos( 10, 24 )
	MapCameraWait()
	
	--邪竜紋モデルの破壊
	EventBrokenObject( 10, 24 )
	WaitTime( 2.0 )
	
	Talk( "MID_EV4" )
	
end

function Ending()
	
	Log("Ending")
	
end

function GameOver()
	
	Log("GameOver")
	
end

-- -----------------------------------

function 火山弾_落下地点決定()		-- todo:セピアとグリには当たらないようにする
	
	
	-- 初期化
	VariableSet( g_bomb_point_x1, -1 )
	VariableSet( g_bomb_point_z1, -1 )
	VariableSet( g_bomb_point_x2, -1 )
	VariableSet( g_bomb_point_z2, -1 )
	VariableSet( g_bomb_point_x3, -1 )
	VariableSet( g_bomb_point_z3, -1 )
	
	
	-- -----------------------------------------------------------------------------
	
	
	-- 落下が確定した岩 { x, z }
	local rockPoint = {}
	
	
	-- -----------------------------------------------------------------------------
	
	
	local center_x, center_z = プレイヤー軍の中心点を算出()
	
	
	-- -----------------------------------------------------------------------------
	-- 固定ポイントで近いものがあれば破壊（最大２つ）
				
				local temp_list_near = {}
				local temp_list_far = {}
				for pointer = 1, #g_rockPoint do
					local x = g_rockPoint[pointer][1]
					local z = g_rockPoint[pointer][2]
					
					-- 既に壊しているかチェック
					if TerrainGet(x, z) == "TID_大岩" then
							
							local distance = 二点間距離( center_x, center_z, x, z )
							
							-- プレイヤー軍からの距離でリストを分ける
							if ( distance < g_rock_near ) then
								temp_list_near[ #temp_list_near + 1 ] = { X=x, Z=z, DIST=distance }
							else
								temp_list_far[ #temp_list_far + 1 ] = { X=x, Z=z }
							end
							
					end
				end
				
				
				-- 候補があるなら、近い順に２つまで
				if ( #temp_list_near > 0 ) then
					table.sort( temp_list_near,
								function( a, b )
									return ( a.DIST < b.DIST )
								end
								)
					
					for pointer = 1, #temp_list_near do
						local t = temp_list_near[pointer]
						
						if ( #rockPoint < 2 ) and 他の岩と近すぎない且ボスに当たらない( t, rockPoint ) then
							rockPoint[ #rockPoint + 1 ] = { X=t.X, Z=t.Z }
						end
					end
				end
				
				
	-- -----------------------------------------------------------------------------
	-- ハザードマップから作成
				
				
				local hazard_map = ハザードマップ作成( 1, g_map_width, g_map_height, { FORCE_PLAYER, FORCE_ENEMY } )	-- 危険順にソート済み
				
				while ( #rockPoint < g_rock_max_num ) and ( #hazard_map > 0 ) do
					
					-- 最大危険値のものが何個あるか
					local max_danger_num = 0
					for i = 1, #hazard_map do
						if ( hazard_map[i].VAL == hazard_map[1].VAL ) then
							max_danger_num = max_danger_num + 1
						end
					end
					
					-- 最大危険値のものをランダムで取得
					local index = RandomGet( max_danger_num ) + 1
					local t = hazard_map[ index ]
					
					if 他の岩と近すぎない且ボスに当たらない( t, rockPoint ) then
						-- 採用
						rockPoint[ #rockPoint + 1 ] = { X=t.X, Z=t.Z }
					end
					
					table.remove( hazard_map, index )
					
				end
				
				
	-- -----------------------------------------------------------------------------
	-- 近くない固定ポイントから、数合わせで算出
				
				while ( #rockPoint < g_rock_max_num ) and ( #temp_list_far > 0 ) do
					
					local index = RandomGet( #temp_list_far ) + 1
					local t = temp_list_far[ index ]
					
					if 他の岩と近すぎない且ボスに当たらない( t, rockPoint ) then
						-- 採用
						rockPoint[ #rockPoint + 1 ] = { X=t.X, Z=t.Z }
					end
					
					table.remove( temp_list_far, index )
					
				end
	
	-- -----------------------------------------------------------------------------
	-- 埋まらないならランダムで選ぶ
				
				local try_count = 10
				while ( #rockPoint < g_rock_max_num ) and ( try_count > 0 ) do
					
					local x = RandomGet( g_map_width-4 ) + 2
					local z = RandomGet( g_map_height-4 ) + 2
					local t = { X=x, Z=z }
					
					if 他の岩と近すぎない且ボスに当たらない( t, rockPoint ) then
						-- 採用
						rockPoint[ #rockPoint + 1 ] = { X=t.X, Z=t.Z }
					end
					
					try_count = try_count - 1
					
				end
				
	-- -----------------------------------------------------------------------------
	-- 変数にセットする
				
				
				if ( #rockPoint >= 1 ) then
					VariableSet( g_bomb_point_x1, rockPoint[1].X )
					VariableSet( g_bomb_point_z1, rockPoint[1].Z )
				end
				
				if ( #rockPoint >= 2 ) then
					VariableSet( g_bomb_point_x2, rockPoint[2].X )
					VariableSet( g_bomb_point_z2, rockPoint[2].Z )
				end
				
				if ( #rockPoint >= 3 ) then
					VariableSet( g_bomb_point_x3, rockPoint[3].X )
					VariableSet( g_bomb_point_z3, rockPoint[3].Z )
				end
				
				
end

-- -----------------------------------

function 他の岩と近すぎない且ボスに当たらない( rock, rockPoint )
	
	if ( #rockPoint > 0 ) then
		for i = 1, #rockPoint do
			if ( Ｘ距離とＺ距離の遠い方(rock.X, rock.Z, rockPoint[i].X, rockPoint[i].Z) < 3 ) then
				return false
			end
		end
	end
	
	local pid = "PID_M023_セピア"
	if UnitExistOnMap( pid ) then
		if ( Ｘ距離とＺ距離の遠い方(rock.X, rock.Z, UnitGetX( pid ), UnitGetZ( pid )) < 2 ) then
			return false
		end
	end
	
	
	pid = "PID_M023_グリ"
	if UnitExistOnMap( pid ) then
		if ( Ｘ距離とＺ距離の遠い方(rock.X, rock.Z, UnitGetX( pid ), UnitGetZ( pid )) < 2 ) then
			return false
		end
	end
	
	return true
	
end

-- -----------------------------------

function Ｘ距離とＺ距離の遠い方( x1, z1, x2, z2 )
	
	local distanceX = math.abs( x1 - x2 )
	local distanceZ = math.abs( z1 - z2 )
	return math.max( distanceX, distanceZ )
	
end


-- -----------------------------------

function ハザードマップ作成( range, map_width, map_height, force )
	local temp_map = {}
	
	for id in pairs( force ) do
		
		local index = ForceUnitGetFirst( force[id] )
		while index != nil do
			
			local x = UnitGetX(index)
			local z = UnitGetZ(index)
			
			for _x = x-range, x+range do
				for _z = z-range, z+range do
					
					-- マップ範囲内か判定
					if not ( (_x<2) or (_x>map_width-3) or (_z<2) or (_z>map_height-3) ) then
						
						local key = _x + _z * map_width
						if ( temp_map[ key ] == nil ) then
							if UnitHasPrivateSkill( index, "SID_移動不可" ) then
								temp_map[key] = 10
							else
								temp_map[key] = 1
							end
						else
							if UnitHasPrivateSkill( index, "SID_移動不可" ) then
								temp_map[key] = temp_map[key] + 10
							else
								temp_map[key] = temp_map[key] + 1
							end
						end
						
					end
					
				end
			end
			
			index = ForceUnitGetNext(index)
			
		end
		
	end
	
	
	local map = {}
	for key, val in pairs( temp_map ) do
		local _x = key % map_width
		local _z = math.floor( key / map_width )
		
		map[ #map + 1 ] = { X=_x, Z=_z, VAL=val }
	end
	
	
	table.sort( map,
				function( a, b )
					return ( a.VAL > b.VAL )
				end
				)
	
	
	if #map == 0 then
		return nil
	else
		return map
	end
	
end

