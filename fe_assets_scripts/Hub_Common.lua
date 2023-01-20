--	汎用系
Include("Common")

g_key_mascot_first = "G_拠点_マスコット初回アクセス済"
g_key_mascot_point = "G_拠点_マスコットなつき度"

-- 次の章へ
function ToNextChapter()

    HubNextChapter();

end

-- ワールドマップへ
function ToGmap()

    HubNextGmap();

end

-- ソラネルへ
function ToStartSolanel()

    HubNextMap("Hub_Solanel", "Start");

end

-- テント(和風)が有効
function IsConditionTent1()

	return HubIsCondition(8);

end

-- テント(ゲル)が有効
function IsConditionTent2()

	return HubIsCondition(9);

end

-- テント(キャンプ)が有効
function IsConditionTent3()

	return HubIsCondition(10);

end

-- 円形遊泳を行える
function CanCircleSwim()

	return HubIsCondition(15);

end

-- 円形遊泳を行えない
function CannotCircleSwim()

	if HubIsCondition(15) then
		return false;
	else
		return true;
	end

end

-- 彫像が制作途中(=アイテムがドロップできる状態)
function IsEnabledStatueItemDrop()

	return HubIsCondition(14);

end

-- ドラゴンライド可能
function CanDragonRide()

	return HubIsFacilityComplete("AID_ドラゴンライド");

end

-- ドラゴンライド可能+配置されている
function CanDragonRideWithLocator()

	if CanDragonRide() then
		if HubIsEnabledLocator("LocatorDragon01") then
			return true;
		end
	end

	return false;
end

-- マスコットなつき度0
function MascotFriend0()

	if VariableGet(g_key_mascot_first) == 0 then
		return false;
	end

	return true;

end

-- マスコットなつき度60
function MascotFriend60()

	if VariableGet(g_key_mascot_first) == 0 then
		return false;
	end
	
	if VariableGet(g_key_mascot_point) < 60 then
		return false;
	end

	return true;

end

-- マスコットなつき度80
function MascotFriend80()

	if VariableGet(g_key_mascot_first) == 0 then
		return false;
	end
	
	if VariableGet(g_key_mascot_point) < 80 then
		return false;
	end

	return true;

end

-- マスコットなつき度100
function MascotFriend100()

	if VariableGet(g_key_mascot_first) == 0 then
		return false;
	end
	
	if VariableGet(g_key_mascot_point) < 100 then
		return false;
	end

	return true;

end

-- フラグ補助
function TryVariable(name)

	if VariableIsExist(name) then
		if VariableGet(name) != 0 then
			return true;
		end
	end

	return false;

end
