Include("Common")
g_map_width						= 30
g_map_height					= 30

-- -----------------------------------

function Startup()
	
	Log("Startup")

--	地形変更
--	レア敵いたら
--		索敵	M006,M010,M011,M013,M020,S008
--		逃げるCP
--				TID_篝火消、TID_篝火 → TID_篝火常　にスクリプトで地形属性を変更してください
--一度にまとめて地形を変更する場合はTerrainSetBegin,TerrainSet,TerrainSetEndの順で呼ぶ(予定。巻き戻し用のデータを小さくするため)
--地形を1つだけ変更する場合はTerrainSetOne呼ぶ(予定)
--void TerrainSetBegin()
--void TerrainSetEnd()
--void TerrainSet(int x, int z, string tid)
--void TerrainSetOne(int x, int z, string tid)
----------------------------------------------
--配置地形
--string MapOverlapGet(int x, int z)

--一度にまとめて配置地形を変更する場合はMapOverlapSetBegin,MapOverlapSet,MapOverlapSetEndの順で呼ぶ(予定。巻き戻し用のデータ小さくするため)
--配置地形を1つだけ変更する場合はMapOverlapSetOne呼ぶ(予定)


--void MapOverlapSetOne(int x, int z, string tid)



--	if ExistRareEnemy() then
--		Log("レア敵が発生しています");
--		if MapIsSight() !=true then
--			MapSetSight(boo enable)
--
--		end
--	end


end

function Cleanup()
	
	Log("Cleanup")
	
end

-- -----------------------------------

function Opening()
	
	Log("Opening")


end

function MapOpening()

	--	必要かどうかはわからんけどとりあえず実装。
	-- 炎地形を瘴気に変えるならここかな。
--	Log("M017 MapO0pening")
--	MapOverlapSetBegin()
--	for z = 1, g_map_height - 2 do
--		for x = 1, g_map_width  do
--			
--			MapOverlapSet(x, z, "TID_無し")
--			
--		end
--	end
--	MapOverlapSetEnd()

	if ExistRareEnemy() then
		Log("レア敵が発生しています");

		index = ForceUnitGetFirst(FORCE_ENEMY)
		while index != nil do
			if UnitGetPID(index) == "PID_遭遇戦_レア経験値"	then
				AiSetSequence(index, AI_ORDER_MIND, "AI_MI_Escape","pos(30,26)")
				AiSetSequence(index, AI_ORDER_ATTACK, "AI_AT_Null")
				AiSetSequence(index, AI_ORDER_MOVE, "AI_MV_Escape","pos(30,26)")
			end
			if UnitGetPID(index) == "PID_遭遇戦_レアお金"	then
				AiSetSequence(index, AI_ORDER_MIND, "AI_MI_Escape","pos(30,26)")
				AiSetSequence(index, AI_ORDER_ATTACK, "AI_AT_Null")
				AiSetSequence(index, AI_ORDER_MOVE, "AI_MV_Escape","pos(30,26)")
			end

			index = ForceUnitGetNext(index)
		end
	end



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