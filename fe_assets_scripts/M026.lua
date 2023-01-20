Include("Common")

g_pid_lueur						= "PID_リュール"
g_pid_sombre1					= "PID_M026_ソンブル_人型"
g_pid_sombre2					= "PID_M026_ソンブル_竜型"

g_map_width						= 31
g_map_height					= 31

temp_x_start					= 9
temp_x_end						= 21
temp_z_start					= 19
temp_z_end						= 21

g_key_sombre1_defeat			= "撃破セリフ_ソンブル人型_済"
g_key_end_battle1				= "前半戦終了"
g_key_start_battle2				= "後半戦開始"

g_battle2_counter				= "後半戦カウンター"
g_reinforcement_counter			= "後半戦増援カウンター"

g_reinforcement_start_normal	= 7
g_reinforcement_start_hard		= 5

g_reinforcement_span_normal		= 4
g_reinforcement_span_hard		= 2

-- -----------------

g_key_break_barrier				= "バリア破壊"
g_key_re_barrier				= "バリア復活"
g_key_re_barrier_counter		= "バリア復活回数"
g_actUnit_border				= 5

g_key_barrier_broken			= "バリア破壊初回_済"

-- -----------------

g_key_戦闘前メディウス			= "戦闘前会話メディウス×マルス_済"
g_key_戦闘前ロプトウス			= "戦闘前会話ロプトウス×シグルド_済"
g_key_戦闘前ドーマ				= "戦闘前会話ドーマ×セリカ_済"
g_key_戦闘前アスタルテ			= "戦闘前会話アスタルテ×ミカヤ_済"
g_key_戦闘前イドゥン			= "戦闘前会話イドゥン×ロイ_済"
g_key_戦闘前ベルド				= "戦闘前会話ベルド×リーフ_済"
g_key_戦闘前ギムレー			= "戦闘前会話ギムレー×ルキナ_済"
g_key_戦闘前ネルガル			= "戦闘前会話ネルガル×リン_済"
g_key_戦闘前アシュナード		= "戦闘前会話アシュナード×アイク_済"
g_key_戦闘前ネメシス			= "戦闘前会話ネメシス×ベレト_済"
g_key_戦闘前ハイドラ			= "戦闘前会話ハイドラ×カムイ_済"
g_key_戦闘前フォデス			= "戦闘前会話フォデス×エイリーク_済"

-- -----------------

g_key_EngageBreak				= "ソンブル攻撃_エンゲージブレイク"
g_key_Beam						= "ソンブル攻撃_ビーム"
g_key_SpinAttack				= "ソンブル攻撃_スピンアタック"

g_EngageBreak_span				= 4
g_Beam_span						= 4
g_SpinAttack_span				= 0

g_EngageBreak_unitBorder		= 2
g_Beam_unitBorder				= 3
g_SpinAttack_unitBorder			= 3

g_Beam_Dirty_Rate				= 30

g_key_EngageBreak_startup		= "ソンブル攻撃_エンゲージブレイク_準備中"
g_key_Beam_startup				= "ソンブル攻撃_ビーム_準備中"

g_key_EngageBreak_tutorial		= "ソンブル攻撃_エンゲージブレイク_説明"
g_key_Beam_Direction			= "ソンブル攻撃_ビーム_方向"

-- -----------------------------------

g_key_M026_gameover				= "G_M026_ゲームオーバー済"

-- -----------------------------------


g_magic_circle_position = {
	{X=15,	Z=7},
	{X=9,	Z=9},
	{X=7,	Z=15},
	{X=9,	Z=21},
	{X=15,	Z=23},
	{X=21,	Z=21},
	{X=23,	Z=15},
	{X=21,	Z=9}
}

-- -----------------------------------

g_SpinAttack_Area_OffsetX		= -4
g_SpinAttack_Area_OffsetZ		= -4
g_SpinAttack_Area_Size			= 11

G_DIR_NONE						= 0
G_DIR_RIGHT						= 1
G_DIR_DOWN						= 2
G_DIR_LEFT						= 3
G_DIR_UP						= 4
G_DIR_DIAGONAL					= 5

local g_SpinAttack_Area = {
	{ 0, 0, 0, 2, 2, 2, 2, 2, 0, 0, 0 },
	{ 0, 0, 5, 2, 2, 2, 2, 2, 5, 0, 0 },
	{ 0, 5, 5, 2, 2, 2, 2, 2, 5, 5, 0 },
	{ 3, 3, 3, 0, 0, 0, 0, 0, 1, 1, 1 },
	{ 3, 3, 3, 0, 0, 0, 0, 0, 1, 1, 1 },
	{ 3, 3, 3, 0, 0, 0, 0, 0, 1, 1, 1 },
	{ 3, 3, 3, 0, 0, 0, 0, 0, 1, 1, 1 },
	{ 3, 3, 3, 0, 0, 0, 0, 0, 1, 1, 1 },
	{ 0, 5, 5, 4, 4, 4, 4, 4, 5, 5, 0 },
	{ 0, 0, 5, 4, 4, 4, 4, 4, 5, 0, 0 },
	{ 0, 0, 0, 4, 4, 4, 4, 4, 0, 0, 0 }
}

local g_SpinAttack_Route = {
	{ 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 4 },
	{ 1, 1, 1, 1, 1, 1, 1, 1, 1, 4, 4 },
	{ 2, 1, 1, 1, 1, 1, 1, 1, 4, 4, 4 },
	{ 2, 2, 1, 0, 0, 0, 0, 0, 4, 4, 4 },
	{ 2, 2, 2, 0, 0, 0, 0, 0, 4, 4, 4 },
	{ 2, 2, 2, 0, 0, 0, 0, 0, 4, 4, 4 },
	{ 2, 2, 2, 0, 0, 0, 0, 0, 4, 4, 4 },
	{ 2, 2, 2, 0, 0, 0, 0, 0, 4, 4, 4 },
	{ 2, 2, 2, 3, 3, 3, 3, 3, 3, 4, 4 },
	{ 2, 2, 3, 3, 3, 3, 3, 3, 3, 3, 4 },
	{ 2, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3 }
}

-- -----------------------------------

-- ※実際は上下反転になっているので注意

local g_BeamArea_1_4_7_10 = {
	{10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,  0,0,0,0,0,  0,1,1,1,1,1,1,1,1,1,1,1},
	{10,10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,  0,0,0,0,0,  1,1,1,1,1,1,1,1,1,1,1,0},
	{10,10,10, 0, 0, 0, 0, 0, 0, 0, 0, 0,  0,0,0,0,0,  1,1,1,1,1,1,1,1,1,1,0,0},
	{10,10,10,10, 0, 0, 0, 0, 0, 0, 0, 0,  0,0,0,0,0,  1,1,1,1,1,1,1,1,1,0,0,0},
	{10,10,10,10,10, 0, 0, 0, 0, 0, 0, 0,  0,0,0,0,0,  1,1,1,1,1,1,1,1,0,0,0,0},
	{10,10,10,10,10,10, 0, 0, 0, 0, 0, 0,  0,0,0,0,0,  1,1,1,1,1,1,1,0,0,0,0,0},
	{10,10,10,10,10,10,10, 0, 0, 0, 0, 0,  0,0,0,0,0,  1,1,1,1,1,1,0,0,0,0,0,0},
	{10,10,10,10,10,10,10,10, 0, 0, 0, 0,  0,0,0,0,1,  1,1,1,1,1,0,0,0,0,0,0,0},
	{10,10,10,10,10,10,10,10,10, 0, 0, 0,  0,0,0,0,1,  1,1,1,1,0,0,0,0,0,0,0,0},
	{10,10,10,10,10,10,10,10,10,10, 0, 0,  0,0,0,0,1,  1,1,1,0,0,0,0,0,0,0,0,0},
	{10,10,10,10,10,10,10,10,10,10,10, 0,  0,0,0,0,1,  1,1,0,0,0,0,0,0,0,0,0,0},
	{ 0,10,10,10,10,10,10,10,10,10,10,10,  0,0,0,0,1,  1,0,0,0,0,0,0,0,0,0,0,0},
	
	{ 0, 0, 0, 0, 0, 0, 0,10,10,10,10,10,  0,0,0,0,0,  0,0,0,0,0,0,0,0,0,0,0,0},
	{ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,  0,0,0,0,0,  0,0,0,0,0,0,0,0,0,0,0,0},
	{ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,  0,0,0,0,0,  0,0,0,0,0,0,0,0,0,0,0,0},
	{ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,  0,0,0,0,0,  0,0,0,0,0,0,0,0,0,0,0,0},
	{ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,  0,0,0,0,0,  4,4,4,4,4,0,0,0,0,0,0,0},
	
	{ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7,  7,0,0,0,0,  4,4,4,4,4,4,4,4,4,4,4,0},
	{ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 7,  7,0,0,0,0,  0,4,4,4,4,4,4,4,4,4,4,4},
	{ 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 7, 7,  7,0,0,0,0,  0,0,4,4,4,4,4,4,4,4,4,4},
	{ 0, 0, 0, 0, 0, 0, 0, 0, 7, 7, 7, 7,  7,0,0,0,0,  0,0,0,4,4,4,4,4,4,4,4,4},
	{ 0, 0, 0, 0, 0, 0, 0, 7, 7, 7, 7, 7,  7,0,0,0,0,  0,0,0,0,4,4,4,4,4,4,4,4},
	{ 0, 0, 0, 0, 0, 0, 7, 7, 7, 7, 7, 7,  0,0,0,0,0,  0,0,0,0,0,4,4,4,4,4,4,4},
	{ 0, 0, 0, 0, 0, 7, 7, 7, 7, 7, 7, 7,  0,0,0,0,0,  0,0,0,0,0,0,4,4,4,4,4,4},
	{ 0, 0, 0, 0, 7, 7, 7, 7, 7, 7, 7, 7,  0,0,0,0,0,  0,0,0,0,0,0,0,4,4,4,4,4},
	{ 0, 0, 0, 7, 7, 7, 7, 7, 7, 7, 7, 7,  0,0,0,0,0,  0,0,0,0,0,0,0,0,4,4,4,4},
	{ 0, 0, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7,  0,0,0,0,0,  0,0,0,0,0,0,0,0,0,4,4,4},
	{ 0, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7,  0,0,0,0,0,  0,0,0,0,0,0,0,0,0,0,4,4},
	{ 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 0,  0,0,0,0,0,  0,0,0,0,0,0,0,0,0,0,0,4}
}

local g_BeamArea_2_5_8_11 = {
	{11,11,11,11,11,11,11,11,11,11,11, 0,   0,0,0,0,0,  0,0,0,0,0,0,0,0,0,0,0,2},
	{ 0,11,11,11,11,11,11,11,11,11,11,11,   0,0,0,0,0,  0,0,0,0,0,0,0,0,0,0,2,2},
	{ 0, 0,11,11,11,11,11,11,11,11,11,11,   0,0,0,0,0,  0,0,0,0,0,0,0,0,0,2,2,2},
	{ 0, 0, 0,11,11,11,11,11,11,11,11,11,   0,0,0,0,0,  0,0,0,0,0,0,0,0,2,2,2,2},
	{ 0, 0, 0, 0,11,11,11,11,11,11,11,11,   0,0,0,0,0,  0,0,0,0,0,0,0,2,2,2,2,2},
	{ 0, 0, 0, 0, 0,11,11,11,11,11,11,11,   0,0,0,0,0,  0,0,0,0,0,0,2,2,2,2,2,2},
	{ 0, 0, 0, 0, 0, 0,11,11,11,11,11,11,   0,0,0,0,0,  0,0,0,0,0,2,2,2,2,2,2,2},
	{ 0, 0, 0, 0, 0, 0, 0,11,11,11,11,11,  11,0,0,0,0,  0,0,0,0,2,2,2,2,2,2,2,2},
	{ 0, 0, 0, 0, 0, 0, 0, 0,11,11,11,11,  11,0,0,0,0,  0,0,0,2,2,2,2,2,2,2,2,2},
	{ 0, 0, 0, 0, 0, 0, 0, 0, 0,11,11,11,  11,0,0,0,0,  0,0,2,2,2,2,2,2,2,2,2,2},
	{ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,11,11,  11,0,0,0,0,  0,2,2,2,2,2,2,2,2,2,2,2},
	{ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,11,  11,0,0,0,0,  2,2,2,2,2,2,2,2,2,2,2,0},
	
	{ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,   0,0,0,0,0,  2,2,2,2,2,0,0,0,0,0,0,0},
	{ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,   0,0,0,0,0,  0,0,0,0,0,0,0,0,0,0,0,0},
	{ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,   0,0,0,0,0,  0,0,0,0,0,0,0,0,0,0,0,0},
	{ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,   0,0,0,0,0,  0,0,0,0,0,0,0,0,0,0,0,0},
	{ 0, 0, 0, 0, 0, 0, 0, 8, 8, 8, 8, 8,   0,0,0,0,0,  0,0,0,0,0,0,0,0,0,0,0,0},
	
	{ 0, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8,   0,0,0,0,5,  5,0,0,0,0,0,0,0,0,0,0,0},
	{ 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 0,   0,0,0,0,5,  5,5,0,0,0,0,0,0,0,0,0,0},
	{ 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 0, 0,   0,0,0,0,5,  5,5,5,0,0,0,0,0,0,0,0,0},
	{ 8, 8, 8, 8, 8, 8, 8, 8, 8, 0, 0, 0,   0,0,0,0,5,  5,5,5,5,0,0,0,0,0,0,0,0},
	{ 8, 8, 8, 8, 8, 8, 8, 8, 0, 0, 0, 0,   0,0,0,0,5,  5,5,5,5,5,0,0,0,0,0,0,0},
	{ 8, 8, 8, 8, 8, 8, 8, 0, 0, 0, 0, 0,   0,0,0,0,0,  5,5,5,5,5,5,0,0,0,0,0,0},
	{ 8, 8, 8, 8, 8, 8, 0, 0, 0, 0, 0, 0,   0,0,0,0,0,  5,5,5,5,5,5,5,0,0,0,0,0},
	{ 8, 8, 8, 8, 8, 0, 0, 0, 0, 0, 0, 0,   0,0,0,0,0,  5,5,5,5,5,5,5,5,0,0,0,0},
	{ 8, 8, 8, 8, 0, 0, 0, 0, 0, 0, 0, 0,   0,0,0,0,0,  5,5,5,5,5,5,5,5,5,0,0,0},
	{ 8, 8, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0,   0,0,0,0,0,  5,5,5,5,5,5,5,5,5,5,0,0},
	{ 8, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,   0,0,0,0,0,  5,5,5,5,5,5,5,5,5,5,5,0},
	{ 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,   0,0,0,0,0,  0,5,5,5,5,5,5,5,5,5,5,5}
}

local g_BeamArea_3_6_9_12 = {
	{ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,12,12,  12,12,12,12,12,  12,12,0,0,0,0,0,0,0,0,0,0},
	{ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,12,12,  12,12,12,12,12,  12,12,0,0,0,0,0,0,0,0,0,0},
	{ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,12,12,  12,12,12,12,12,  12,12,0,0,0,0,0,0,0,0,0,0},
	{ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,12,  12,12,12,12,12,  12, 0,0,0,0,0,0,0,0,0,0,0},
	{ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,12,  12,12,12,12,12,  12, 0,0,0,0,0,0,0,0,0,0,0},
	{ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,12,  12,12,12,12,12,  12, 0,0,0,0,0,0,0,0,0,0,0},
	{ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,  12,12,12,12,12,   0, 0,0,0,0,0,0,0,0,0,0,0},
	{ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,  12,12,12,12,12,   0, 0,0,0,0,0,0,0,0,0,0,0},
	{ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,  12,12,12,12,12,   0, 0,0,0,0,0,0,0,0,0,0,0},
	{ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,   0,12,12,12, 0,   0, 0,0,0,0,0,0,0,0,0,0,0},
	{ 9, 9, 9, 0, 0, 0, 0, 0, 0, 0, 0, 0,   0,12,12,12, 0,   0, 0,0,0,0,0,0,0,0,3,3,3},
	{ 9, 9, 9, 9, 9, 9, 0, 0, 0, 0, 0, 0,   0,12,12,12, 0,   0, 0,0,0,0,0,3,3,3,3,3,3},
	
	{ 9, 9, 9, 9, 9, 9, 9, 9, 9, 0, 0, 0,   0, 0, 0, 0, 0,   0, 0,0,3,3,3,3,3,3,3,3,3},
	{ 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9,   0, 0, 0, 0, 0,   3, 3,3,3,3,3,3,3,3,3,3,3},
	{ 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9,   0, 0, 0, 0, 0,   3, 3,3,3,3,3,3,3,3,3,3,3},
	{ 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9,   0, 0, 0, 0, 0,   3, 3,3,3,3,3,3,3,3,3,3,3},
	{ 9, 9, 9, 9, 9, 9, 9, 9, 9, 0, 0, 0,   0, 0, 0, 0, 0,   0, 0,0,3,3,3,3,3,3,3,3,3},
	
	{ 9, 9, 9, 9, 9, 9, 0, 0, 0, 0, 0, 0,   0, 6, 6, 6, 0,   0, 0,0,0,0,0,3,3,3,3,3,3},
	{ 9, 9, 9, 0, 0, 0, 0, 0, 0, 0, 0, 0,   0, 6, 6, 6, 0,   0, 0,0,0,0,0,0,0,0,3,3,3},
	{ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,   0, 6, 6, 6, 0,   0, 0,0,0,0,0,0,0,0,0,0,0},
	{ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,   6, 6, 6, 6, 6,   0, 0,0,0,0,0,0,0,0,0,0,0},
	{ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,   6, 6, 6, 6, 6,   0, 0,0,0,0,0,0,0,0,0,0,0},
	{ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,   6, 6, 6, 6, 6,   0, 0,0,0,0,0,0,0,0,0,0,0},
	{ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6,   6, 6, 6, 6, 6,   6, 0,0,0,0,0,0,0,0,0,0,0},
	{ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6,   6, 6, 6, 6, 6,   6, 0,0,0,0,0,0,0,0,0,0,0},
	{ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6,   6, 6, 6, 6, 6,   6, 0,0,0,0,0,0,0,0,0,0,0},
	{ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6, 6,   6, 6, 6, 6, 6,   6, 6,0,0,0,0,0,0,0,0,0,0},
	{ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6, 6,   6, 6, 6, 6, 6,   6, 6,0,0,0,0,0,0,0,0,0,0},
	{ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6, 6,   6, 6, 6, 6, 6,   6, 6,0,0,0,0,0,0,0,0,0,0}
}

-- -----------------------------------

POS_UP			= 8
POS_DOWN		= 4
POS_LEFT		= 2
POS_RIGHT		= 1
POS_ALL			= 15

POS_UP_LEFT		= 10
POS_UP_RIGHT	= 9
POS_DOWN_LEFT	= 6
POS_DOWN_RIGHT	= 5

POS_PREFIX	= "紋章士位置_"

-- -----------------------------------

function Startup()
	
	Log("Startup")
	
	-- 勝利条件設定：勝利フラグを立てる
	WinRuleSetEnemyNumberLessThanOrEqualTo(-1)
	WinRuleSetMID( "MID_RULE_M026_WIN" )
	
	フラグ登録()
	イベント登録()
	
end

function フラグ登録()
	
	VariableEntry( g_key_sombre1_defeat, 0 )
	VariableEntry( g_key_end_battle1, 0 )
	VariableEntry( g_key_start_battle2, 0 )
	
	VariableEntry( g_battle2_counter, 1 )
	
	VariableEntry( g_reinforcement_counter, 1 )
	
	VariableEntry( "後半戦ターン２", 0 )
	VariableEntry( "後半戦ターン３", 0 )
	VariableEntry( "後半戦ターン５", 0 )
	
	VariableEntry( g_key_break_barrier, 0 )
	VariableEntry( g_key_re_barrier, 0 )
	VariableEntry( g_key_re_barrier_counter, 0 )
	
	VariableEntry( g_key_barrier_broken, 0 )
	
	VariableEntry( g_key_戦闘前メディウス,		0 )
	VariableEntry( g_key_戦闘前ドーマ,			0 )
	VariableEntry( g_key_戦闘前ロプトウス,		0 )
	VariableEntry( g_key_戦闘前ベルド,			0 )
	VariableEntry( g_key_戦闘前イドゥン,		0 )
	VariableEntry( g_key_戦闘前ネルガル,		0 )
	VariableEntry( g_key_戦闘前フォデス,		0 )
	VariableEntry( g_key_戦闘前アシュナード,	0 )
	VariableEntry( g_key_戦闘前アスタルテ,		0 )
	VariableEntry( g_key_戦闘前ギムレー,		0 )
	VariableEntry( g_key_戦闘前ハイドラ,		0 )
	VariableEntry( g_key_戦闘前ネメシス,		0 )
	
	VariableEntry( g_key_EngageBreak,			g_EngageBreak_span )
	VariableEntry( g_key_Beam,					g_Beam_span )
	VariableEntry( g_key_SpinAttack,			g_SpinAttack_span )
	VariableEntry( g_key_EngageBreak_startup,	0 )
	VariableEntry( g_key_Beam_startup,			0 )
	VariableEntry( g_key_EngageBreak_tutorial,	0 )
	VariableEntry( g_key_Beam_Direction,		0 )
	
	VariableEntry( POS_PREFIX .. "GID_M026_敵メディウス",		POS_DOWN_LEFT )
	VariableEntry( POS_PREFIX .. "GID_M026_敵ドーマ",			POS_UP_LEFT )
	VariableEntry( POS_PREFIX .. "GID_M026_敵ロプトウス",		POS_DOWN_RIGHT )
	VariableEntry( POS_PREFIX .. "GID_M026_敵ベルド",			POS_UP_RIGHT )
	VariableEntry( POS_PREFIX .. "GID_M026_敵イドゥン",			POS_UP )
	VariableEntry( POS_PREFIX .. "GID_M026_敵ネルガル",			POS_LEFT )
	VariableEntry( POS_PREFIX .. "GID_M026_敵フォデス",			POS_RIGHT )
	VariableEntry( POS_PREFIX .. "GID_M026_敵アシュナード",		POS_DOWN )
	VariableEntry( POS_PREFIX .. "GID_M026_敵アスタルテ",		POS_DOWN_LEFT )
	VariableEntry( POS_PREFIX .. "GID_M026_敵ギムレー",			POS_UP_LEFT )
	VariableEntry( POS_PREFIX .. "GID_M026_敵ハイドラ",			POS_DOWN_RIGHT )
	VariableEntry( POS_PREFIX .. "GID_M026_敵ネメシス",			POS_UP_RIGHT )
	
	VariableEntry( g_key_M026_gameover, 0 )
	
end

function イベント登録()
	
	EventEntryTurn(後半戦カウンター,		-1, -1, FORCE_PLAYER, condition_後半戦カウンター)
	EventEntryTurn(後半戦増援_ノーマル,		-1, -1, FORCE_PLAYER, condition_後半戦増援_ノーマル)
	EventEntryTurn(後半戦増援_ハード以上,	-1, -1, FORCE_PLAYER, condition_後半戦増援_ハード以上)
	
	EventEntryTurn(開始直後イベント, 1, 1, FORCE_PLAYER, "開始直後イベント_済")
	
	EventEntryTurn(勝利条件, 1, 1, FORCE_PLAYER)
	
	-- ソンブル（人型）
	EventEntryBattleTalk(Talk, g_pid_lueur,		FORCE_PLAYER, g_pid_sombre1, FORCE_ENEMY, true, "戦闘前会話_ソンブル人型_リュール_済",	"MID_BT2")
	EventEntryBattleTalk(Talk, "PID_ヴェイル",	FORCE_PLAYER, g_pid_sombre1, FORCE_ENEMY, true, "戦闘前会話_ソンブル人型_ヴェイル_済",	"MID_BT3")
	EventEntryBattleTalk(Talk, "",				FORCE_PLAYER, g_pid_sombre1, FORCE_ENEMY, true, "戦闘前会話_ソンブル人型_済",			"MID_BT1")
	
	-- ソンブル死亡
	EventEntryDie(Talk, g_pid_sombre1, FORCE_ENEMY, g_key_sombre1_defeat, "MID_BT4")
	
	-- ===================================
	-- ソンブルから攻撃してきて死亡した場合
	EventEntryBattleAfter(VariableSet, g_pid_sombre1, FORCE_ENEMY, "", FORCE_PLAYER, false, condition_強制敵フェイズ終了, "行動後フェイズ終了", 1)
	EventEntryTurnEnd(前半戦終了から後半戦開始, -1, -1, FORCE_ENEMY, condition_前半戦終了)
	
	-- -----------------------------------
	-- プレイヤー軍から攻撃して死亡した場合
	EventEntryBattleAfter(VariableSet, "", FORCE_PLAYER, g_pid_sombre1, FORCE_ENEMY, false, condition_強制敵フェイズ終了, "行動後フェイズ終了", 1)
	EventEntryFixed(前半戦終了, "", FORCE_PLAYER, condition_前半戦終了)
	EventEntryTurn(後半戦開始, -1, -1, FORCE_PLAYER, condition_後半戦開始)
	
	-- -----------------------------------
	-- アイクの覇克・天空で死亡した場合
	EventEntryTurnAfter(前半戦終了, -1, -1, FORCE_PLAYER, condition_前半戦終了)
	
	-- ===================================
	
	EventEntryBattleAfter(バリア破壊, "", FORCE_ENEMY, "", FORCE_PLAYER, true, condition_バリア破壊)
	EventEntryTurnEnd(バリア復活, -1, -1, FORCE_ENEMY, condition_バリア復活)
	
	-- ソンブル（竜型）
	EventEntryTurnAfter(邪竜ソンブルの攻撃,		-1, -1, FORCE_ENEMY,	condition_邪竜ソンブルの攻撃)
	EventEntryTurnEnd(	邪竜ソンブルの攻撃予告,	-1, -1, FORCE_ENEMY,	condition_邪竜ソンブルの攻撃予告)
	
	-- 闇紋章士　戦闘前会話
	EventEntryBattleTalk(闇紋章士戦闘前会話, "", FORCE_PLAYER, "PID_M026_異形兵_マスター_メディウス",	FORCE_ENEMY, true, condition_戦闘前会話メディウス,	"MID_BT9",	g_key_戦闘前メディウス		)
	EventEntryBattleTalk(闇紋章士戦闘前会話, "", FORCE_PLAYER, "PID_M026_異形兵_マスター_ロプトウス",	FORCE_ENEMY, true, condition_戦闘前会話ロプトウス,	"MID_BT10",	g_key_戦闘前ロプトウス		)
	EventEntryBattleTalk(闇紋章士戦闘前会話, "", FORCE_PLAYER, "PID_M026_異形兵_マスター_ドーマ",		FORCE_ENEMY, true, condition_戦闘前会話ドーマ,		"MID_BT11",	g_key_戦闘前ドーマ			)
	EventEntryBattleTalk(闇紋章士戦闘前会話, "", FORCE_PLAYER, "PID_M026_異形兵_マスター_アスタルテ",	FORCE_ENEMY, true, condition_戦闘前会話アスタルテ,	"MID_BT12",	g_key_戦闘前アスタルテ		)
	EventEntryBattleTalk(闇紋章士戦闘前会話, "", FORCE_PLAYER, "PID_M026_異形兵_マスター_イドゥン",		FORCE_ENEMY, true, condition_戦闘前会話イドゥン,	"MID_BT13",	g_key_戦闘前イドゥン		)
	EventEntryBattleTalk(闇紋章士戦闘前会話, "", FORCE_PLAYER, "PID_M026_異形兵_マスター_ベルド",		FORCE_ENEMY, true, condition_戦闘前会話ベルド,		"MID_BT14",	g_key_戦闘前ベルド			)
	EventEntryBattleTalk(闇紋章士戦闘前会話, "", FORCE_PLAYER, "PID_M026_異形兵_マスター_ギムレー",		FORCE_ENEMY, true, condition_戦闘前会話ギムレー,	"MID_BT15",	g_key_戦闘前ギムレー		)
	EventEntryBattleTalk(闇紋章士戦闘前会話, "", FORCE_PLAYER, "PID_M026_異形兵_マスター_ネルガル",		FORCE_ENEMY, true, condition_戦闘前会話ネルガル,	"MID_BT16",	g_key_戦闘前ネルガル		)
	EventEntryBattleTalk(闇紋章士戦闘前会話, "", FORCE_PLAYER, "PID_M026_異形兵_マスター_アシュナード",	FORCE_ENEMY, true, condition_戦闘前会話アシュナード,"MID_BT17",	g_key_戦闘前アシュナード	)
	EventEntryBattleTalk(闇紋章士戦闘前会話, "", FORCE_PLAYER, "PID_M026_異形兵_マスター_ネメシス",		FORCE_ENEMY, true, condition_戦闘前会話ネメシス,	"MID_BT18",	g_key_戦闘前ネメシス		)
	EventEntryBattleTalk(闇紋章士戦闘前会話, "", FORCE_PLAYER, "PID_M026_異形兵_マスター_ハイドラ",		FORCE_ENEMY, true, condition_戦闘前会話ハイドラ,	"MID_BT19",	g_key_戦闘前ハイドラ		)
	EventEntryBattleTalk(闇紋章士戦闘前会話, "", FORCE_PLAYER, "PID_M026_異形兵_マスター_フォデス",		FORCE_ENEMY, true, condition_戦闘前会話フォデス,	"MID_BT20",	g_key_戦闘前フォデス		)
	
	-- 闇紋章士　撃破時話
	EventEntryDie(闇紋章士死亡会話, "PID_M026_異形兵_マスター_メディウス",		FORCE_ENEMY, "撃破時会話メディウス_済",		"MID_BT21")
	EventEntryDie(闇紋章士死亡会話, "PID_M026_異形兵_マスター_ロプトウス",		FORCE_ENEMY, "撃破時会話ロプトウス_済",		"MID_BT22")
	EventEntryDie(闇紋章士死亡会話, "PID_M026_異形兵_マスター_ドーマ",			FORCE_ENEMY, "撃破時会話ドーマ_済",			"MID_BT23")
	EventEntryDie(闇紋章士死亡会話, "PID_M026_異形兵_マスター_アスタルテ",		FORCE_ENEMY, "撃破時会話アスタルテ_済",		"MID_BT24")
	EventEntryDie(闇紋章士死亡会話, "PID_M026_異形兵_マスター_イドゥン",		FORCE_ENEMY, "撃破時会話イドゥン_済",		"MID_BT25")
	EventEntryDie(闇紋章士死亡会話, "PID_M026_異形兵_マスター_ベルド",			FORCE_ENEMY, "撃破時会話ベルド_済",			"MID_BT26")
	EventEntryDie(闇紋章士死亡会話, "PID_M026_異形兵_マスター_ギムレー",		FORCE_ENEMY, "撃破時会話ギムレー_済",		"MID_BT27")
	EventEntryDie(闇紋章士死亡会話, "PID_M026_異形兵_マスター_ネルガル",		FORCE_ENEMY, "撃破時会話ネルガル_済",		"MID_BT28")
	EventEntryDie(闇紋章士死亡会話, "PID_M026_異形兵_マスター_アシュナード",	FORCE_ENEMY, "撃破時会話アシュナード_済",	"MID_BT29")
	EventEntryDie(闇紋章士死亡会話, "PID_M026_異形兵_マスター_ネメシス",		FORCE_ENEMY, "撃破時会話ネメシス_済",		"MID_BT30")
	EventEntryDie(闇紋章士死亡会話, "PID_M026_異形兵_マスター_ハイドラ",		FORCE_ENEMY, "撃破時会話ハイドラ_済",		"MID_BT31")
	EventEntryDie(闇紋章士死亡会話, "PID_M026_異形兵_マスター_フォデス",		FORCE_ENEMY, "撃破時会話フォデス_済",		"MID_BT32")
	
end

function Cleanup()
	
	Log("Cleanup")
	
end

-- -----------------------------------

function Opening()
	
	Log("Opening")
	
	PuppetDemo("M026", "MID_OP2")
	PuppetDemo("M026", "MID_OP3")

end

function MapOpening()
	
	Log("MapOpening")
	
	FadeOutAndWait(FADE_FAST)
	
	-- 魔法陣地形を一旦平地に変更しておく
	TerrainSetBegin()
	if ( #g_magic_circle_position > 0 ) then
		for index = 1, #g_magic_circle_position do
			
			TerrainSet( g_magic_circle_position[index].X, g_magic_circle_position[index].Z, "TID_平地" )
			
		end
	end
	TerrainSetEnd()
	
	FadeInAndWait(FADE_FAST)
	
end

-- -----------------------------------

function 開始直後イベント()
	
	FadeOutAndWait( FADE_NORMAL )
		Movie("Scene28")
		local list = 紋章士を外す()
		CursorSetPos( 15, 10 )
		CursorSetDistanceMode(CURSOR_DISTANCE_NEAR)
		MapCameraWait()
		SkipEscape()
	FadeInAndWait( FADE_NORMAL )
	
	-- 出撃メンバーの皆から一言
	local unit = ForceUnitGetFirst(FORCE_PLAYER)
	while unit != nil do
		
		local pid = UnitGetPID( unit )
		if not ( pid == g_pid_lueur ) then
			
			local name = SubPrefix( UnitGetMPID( unit ) )
			local mid = "MID_OP5_" .. name .. "1"
			Talk( mid )
			
		end
		
		unit = ForceUnitGetNext(unit)	
	end
	
	FadeOutAndWait( FADE_NORMAL )
		Movie("Scene29")
		SkipEscape()
		
		紋章士を付けなおす( list )
	FadeInAndWait( FADE_NORMAL )
	
end

-- -----------------------------------

function 紋章士を外す()
	local list = {}
	
	local unit = ForceUnitGetFirst(FORCE_PLAYER)
	while unit != nil do
		
		local godUnit = UnitGetGodUnit( unit )
		if godUnit != nil then
			list[ #list + 1 ] = { UNIT=unit, GOD=godUnit }
			UnitSetGodUnit(unit, nil)
		end
		
		unit = ForceUnitGetNext( unit )
	end
	
	return list
end

function 紋章士を付けなおす( list )
	if #list > 0 then
		for pointer = 1, #list do
			UnitSetGodUnit( list[pointer].UNIT, list[pointer].GOD )
		end
	end
end

-- -----------------------------------

function condition_強制敵フェイズ終了()
	
	if VariableGet( g_key_sombre1_defeat ) == 1 then 
		return true
	end
	
end

-- -----------------------------------

function 前半戦終了から後半戦開始()
	前半戦終了()
	後半戦開始()
end

-- ---------------------------------------------------------

function condition_前半戦終了()
	if VariableGet( g_key_end_battle1 ) == 1 then
		return false
	end
	
	if VariableGet( g_key_sombre1_defeat ) == 1 then
		return true
	end
	
	return false
end

function 前半戦終了()
	
	VariableSet( "自軍フェイズスキップ", 1 )
	VariableSet( "敵軍フェイズスキップ", 1 )
	VariableSet( "行動後フェイズ終了", 1 )
	
	
	FadeOutAndWait(FADE_FAST)
		
		CursorSetPos(15, 12)
		CursorSetDistanceMode(CURSOR_DISTANCE_MIDDLE)
		
		指定PID以外の敵が消える( g_pid_sombre1 )
		エンゲージ状態や状態異常などを初期化()
		UnitUpdate()	-- 残像の削除
		
		全ユニットを一旦退避()
		
		-- リュールとソンブルの配置
		UnitSetPos( g_pid_sombre1,	15, 15 )
		UnitSetPos( g_pid_lueur,	15, 11 )
		Yield()
		
		-- ソンブルの向き調整
		UnitRotation( g_pid_sombre1, ROTATE_DOWN )
		UnitMoveWait()
		
		味方キャラを再配置()
		
		魔法陣追加()
		
		MapCameraWait()
		
	FadeInAndWait(FADE_FAST)
	
	
	Talk("MID_EV1")
	
	FadeOutAndWait(FADE_FAST)
		SkipEscape()
		Movie("Scene31")
		ソンブルが竜型に変化()
	FadeInAndWait(FADE_FAST)
	
	SkipEscape()
	Dispos( "DarkEmblem", DISPOS_FLAG_FORCED + DISPOS_FLAG_WARP )
	Yield()
	
	-- Dialog( "闇紋章士がソンブルにバリアのようなものを張る" )
	EffectCreate("ソンブルバリア_Lv4", 15, 15)
	WaitTime( 2.0 )
	
	if DifficultyGet() == DIFFICULTY_NORMAL then
		スキル装備( g_pid_sombre2, "SID_バリア４_ノーマル用" )
	else
		スキル装備( g_pid_sombre2, "SID_バリア４" )
	end
	
	SkipEscape()
	Talk("MID_EV2")
	
	Tutorial( "TUTID_闇の結界" )
	Tutorial( "TUTID_闇の紋章士" )
	
	FadeOutAndWait(FADE_FAST)
		
		指定PID以外の敵が消える( g_pid_sombre2 )
		Dispos( "DarkEmblem1", DISPOS_FLAG_FORCED )
		Dispos( "Enemy2", DISPOS_FLAG_NONE )
		Yield()
		
		紋章氣マスの配置()
		
	FadeInAndWait(FADE_FAST)
	
	
	VariableSet( g_key_end_battle1, 1 )
	
end

-- ---------------------------------------------------------

function 紋章氣マスの配置()
	
	MapOverlapSetOne(21, 16, "TID_紋章氣")
	MapOverlapSetOne( 7, 17, "TID_紋章氣")
	MapOverlapSetOne(23, 20, "TID_紋章氣")
	MapOverlapSetOne(11, 23, "TID_紋章氣")
	MapOverlapSetOne(10,  7, "TID_紋章氣")
	MapOverlapSetOne(13,  5, "TID_紋章氣")
	MapOverlapSetOne(23,  8, "TID_紋章氣")
	MapOverlapSetOne( 5, 13, "TID_紋章氣")
	MapOverlapSetOne(25, 13, "TID_紋章氣")
	
end

-- ---------------------------------------------------------

function 全ユニットを一旦退避()
	
	for fromZ = 1, g_map_height - 2 do
		for fromX = 1, g_map_width - 2 do
			
			-- 退避範囲外なら
			if ( fromX < temp_x_start ) or ( temp_x_end < fromX ) 
				or ( fromZ < temp_z_start ) or ( temp_z_end < fromZ ) then
				
				
				-- 誰か人がいるなら
				local unit = UnitGetByPos(fromX, fromZ)
				if not ( unit == nil ) then
					
					
					local dicede = false
					
					-- 退避範囲内の空きを検索
					for toZ = temp_z_start, temp_z_end do
						
						for toX = temp_x_start, temp_x_end do
							
							if ( UnitGetByPos(toX, toZ) == nil ) and ( TerrainGetMoveCost(toX, toZ) == "COST_平地" ) then
								
								-- 移動
								UnitSetPos(unit, toX, toZ)
								
								dicede = true
								break
								
							end
							
						end
						
						if dicede then
							break
						end
						
					end
					
					
				end
				
				
			end
			
		end
	end
	
end

-- ---------------------------------------------------------

function 指定PID以外の敵が消える( pid )
	
	local list = {}
	local index = ForceUnitGetFirst(FORCE_ENEMY)
	while index != nil do
		if not ( UnitGetPID( index ) == pid ) then
			list[ #list + 1 ] = index
		end
		index = ForceUnitGetNext(index)
	end
	
	if ( #list > 0 ) then
		for index = 1, #list do
			UnitDelete( list[index] )
		end
	end
	
end

-- ---------------------------------------------------------

function 味方キャラを再配置()
	
	local posList = {
		{ 11, 12 },
		{ 19, 12 },
		{ 12, 11 },
		{ 18, 11 },
		{ 11, 10 },
		{ 12, 10 },
		{ 14, 10 },
		{ 16, 10 },
		{ 18, 10 },
		{ 19, 10 },
		{ 13, 9  },
		{ 15, 9  },
		{ 17, 9  }
	}
	
	local index = 1
	
	for z = temp_z_start, temp_z_end do
		for x = temp_x_start, temp_x_end do
			
			local unit = UnitGetByPos( x, z )
			if not ( unit == nil ) then
				
				UnitSetPos( unit, posList[index][1], posList[index][2] )
				index = index + 1
				
			end
			
		end
	end
	
end

-- ---------------------------------------------------------

function 魔法陣追加()
	
	TerrainSetBegin()
	if ( #g_magic_circle_position > 0 ) then
		for index = 1, #g_magic_circle_position do
			
			TerrainSet( g_magic_circle_position[index].X, g_magic_circle_position[index].Z, "TID_魔法陣" )
			EffectCreate( "魔法陣", g_magic_circle_position[index].X, g_magic_circle_position[index].Z )
			
		end
	end
	TerrainSetEnd()
	
end

-- ---------------------------------------------------------

function エンゲージ状態や状態異常などを初期化()
	
	-- 配置属性の消去
	
	MapOverlapSetBegin()
	for z = 1, g_map_width - 2 do
		for x = 1, g_map_width - 2 do
			
			MapOverlapSet(x, z, "TID_無し")
			
		end
	end
	MapOverlapSetEnd()
	
	
	-- 再配置、HP回復、エンゲージカウントの初期化、待機状態の解除
	
	local index = ForceUnitGetFirst(FORCE_PLAYER)
	while index != nil do
		
		UnitResetParam(index)
		UnitRotation(index, ROTATE_UP)
		
		index = ForceUnitGetNext( index )
		
	end
	
end

-- ---------------------------------------------------------

function ソンブルが竜型に変化()
	
	-- エフェクトを焚いて
	
	-- 人型ソンブルを消して
	if UnitExistOnMap( g_pid_sombre1 ) then
		UnitDelete( g_pid_sombre1 )
	end
	
	-- 竜型ソンブルを配置
	Dispos( "Sombre2", DISPOS_FLAG_NONE )
	Yield()
	
	-- ソンブルの下の地形を変える
	local sombreX = UnitGetX( g_pid_sombre2 )
	local sombreZ = UnitGetZ( g_pid_sombre2 )
	TerrainSetBegin()
	for z = sombreZ, sombreZ + 4 do
		for x = sombreX, sombreX + 4 do
			TerrainSet( x, z, "TID_進入不可_M026" )
		end
	end
	TerrainSetEnd()
	
end

-- ---------------------------------------------------------

function condition_後半戦開始()
	if VariableGet( g_key_start_battle2 ) == 1 then
		return false
	end
	
	if VariableGet( g_key_end_battle1 ) == 1 then
		return true
	end
	
	return false
end

function 後半戦開始()
		
	VariableSet( "自軍フェイズスキップ", 0 )
	VariableSet( "敵軍フェイズスキップ", 0 )
	VariableSet( "行動後フェイズ終了", 0 )
	
	VariableSet( g_key_start_battle2, 1 )
	
	-- 巻き戻しの情報削除(前半戦には戻せない)
	MapHistoryRewindReset()
	
end

-- -----------------------------------

function condition_後半戦カウンター()
	if VariableGet( g_key_start_battle2 ) == 0 then
		return false
	end
	
	-- ひとまず１０ターンぐらいまではカウントするようにする
	if ( VariableGet( g_battle2_counter ) > 10 ) then
		return false
	end
	
	return true	
end

function 後半戦カウンター()
	local counter = VariableGet( g_battle2_counter )
	counter = counter + 1
	
	VariableSet( g_battle2_counter, counter )
	
	-- -------------------------------
	
	if		counter == 2 then
		VariableSet( "後半戦ターン２", 1 )
		
	elseif	counter == 3 then
		VariableSet( "後半戦ターン３", 1 )
		
	elseif	counter == 5 then
		VariableSet( "後半戦ターン５", 1 )
		
	end
	
end

-- -----------------------------------

function condition_後半戦増援_ノーマル()
	if VariableGet( g_key_start_battle2 ) == 0 then
		return false
	end
	
	if ( DifficultyGet() > DIFFICULTY_NORMAL ) then
		return false
	end
	
	if ( VariableGet( g_battle2_counter ) < g_reinforcement_start_normal ) then
		return false
	end
	
	return condition_後半戦増援_敵数チェック()
end

function 後半戦増援_ノーマル()
	
	local counter = VariableGet( g_reinforcement_counter )
	counter = counter - 1
	VariableSet( g_reinforcement_counter, counter )
	
	if ( counter == 0 ) then
		
		VariableSet( g_reinforcement_counter, g_reinforcement_span_normal )
		闇紋章士増援()
		
	elseif ( counter == g_reinforcement_span_normal -  2 ) then
		
		空きスペースに増援()
		
	end
	
end

-- -----------------------------------

function condition_後半戦増援_ハード以上()
	if VariableGet( g_key_start_battle2 ) == 0 then
		return false
	end
	
	if ( DifficultyGet() < DIFFICULTY_HARD ) then
		return false
	end
	
	if VariableGet( g_battle2_counter ) < g_reinforcement_start_hard then
		return false
	end
	
	return condition_後半戦増援_敵数チェック()
end

function 後半戦増援_ハード以上()
	
	local counter = VariableGet( g_reinforcement_counter )
	counter = counter - 1
	VariableSet( g_reinforcement_counter, counter )
	
	
	-- ２ターンに１回の想定で組んでいる
	
	if ( counter == 0 ) then
		
		VariableSet( g_reinforcement_counter, g_reinforcement_span_hard )
		闇紋章士増援()
		
	else
		
		空きスペースに増援()
		
	end
	
end

-- -----------------------------------

function condition_後半戦増援_敵数チェック()
	
	-- 配置上限数は64人
	-- 闇紋章士は4人ずつ配置
	-- 一度に登場する増援は最大8人
	local max = 64 - 4 - 8
	
	local count = 0
	local index = ForceUnitGetFirst( FORCE_ENEMY )
	while index != nil do
		count = count + 1
		index = ForceUnitGetNext(index)
	end
	
	if ( count <= max ) then
		return true
	else
		return false
	end
	
end

-- -----------------------------------

function 闇紋章士増援()
	
	-- 生きてたらそれぞれ対応するマスから出現
	
	if UnitExistOnMap( "PID_M026_異形兵_マスター_メディウス"	) then
		増援配置_FOCUSandWARP( "Reinforcement_Mediuth" )
	end
		
	if UnitExistOnMap( "PID_M026_異形兵_マスター_ロプトウス"	) then
		増援配置_FOCUSandWARP( "Reinforcement_Loptous" )
	end
		
	if UnitExistOnMap( "PID_M026_異形兵_マスター_ドーマ"		) then
		増援配置_FOCUSandWARP( "Reinforcement_Duma" )
	end
		
	if UnitExistOnMap( "PID_M026_異形兵_マスター_アスタルテ"	) then
		増援配置_FOCUSandWARP( "Reinforcement_Astarte" )
	end
		
	if UnitExistOnMap( "PID_M026_異形兵_マスター_イドゥン"		) then
		増援配置_FOCUSandWARP( "Reinforcement_Idenn" )
	end
		
	if UnitExistOnMap( "PID_M026_異形兵_マスター_ベルド"		) then
		増援配置_FOCUSandWARP( "Reinforcement_Veld" )
	end
		
	if UnitExistOnMap( "PID_M026_異形兵_マスター_ギムレー"		) then
		増援配置_FOCUSandWARP( "Reinforcement_Gimle" )
	end
		
	if UnitExistOnMap( "PID_M026_異形兵_マスター_ネルガル"		) then
		増援配置_FOCUSandWARP( "Reinforcement_Nergal" )
	end
		
	if UnitExistOnMap( "PID_M026_異形兵_マスター_アシュナード"	) then
		増援配置_FOCUSandWARP( "Reinforcement_Ashnard" )
	end
		
	if UnitExistOnMap( "PID_M026_異形兵_マスター_ネメシス"		) then
		増援配置_FOCUSandWARP( "Reinforcement_Nemesis" )
	end
		
	if UnitExistOnMap( "PID_M026_異形兵_マスター_ハイドラ"		) then
		増援配置_FOCUSandWARP( "Reinforcement_Hydra" )
	end
		
	if UnitExistOnMap( "PID_M026_異形兵_マスター_フォデス"		) then
		増援配置_FOCUSandWARP( "Reinforcement_Fodeth" )
	end
	
end

function 空きスペースに増援()
	
	local table = 生きている闇紋章士のリスト取得()
	
	if ( #table <= 0 ) or ( 4 <= #table ) then
		return
	end
	
	
	-- ２のべき乗なら上下左右配置
	-- そうじゃないなら斜め配置
    
    local pos_smty = 対称のポイントを取得( table[1] )
    
    if bit32.band( table[1], ( table[1] - 1 ) ) == 0 then
    	
    	if		#table == 1 then
    		飛行の増援( table[1] )
    		飛行の増援( pos_smty )
    		
    		
    	elseif	#table == 2 then
    		local pos_not = bit32.band( POS_ALL, bit32.bnot( bit32.bor( table[1], table[2] ) ) )
    		
    		if ( table[2] == pos_smty ) then
    			飛行の増援( pos_not )
    			
    		else
    		 	地上の増援( bit32.band( POS_UP,		pos_not ) )
    		 	地上の増援( bit32.band( POS_LEFT,	pos_not ) )
    		 	地上の増援( bit32.band( POS_RIGHT,	pos_not ) )
    		 	地上の増援( bit32.band( POS_DOWN,	pos_not ) )
    		 	
    		end
    		
    		
    	elseif	#table == 3 then
    		local pos_not = bit32.band( POS_ALL, bit32.bnot( bit32.bor( table[1], table[2], table[3] ) ) )
    		飛行の増援( pos_not )
    		
    		
    	end
    	
    	
    else
    	
    	if		#table == 1 then
    		地上の増援( 対称のポイントを取得( table[1] ) )
    		飛行の増援( table[1] )
    		
    		
    	elseif	#table == 2 then
    		
    		if ( table[2] == pos_smty ) then
    			
    			if ( table[1] != POS_UP_LEFT ) and ( table[2] != POS_UP_LEFT ) then
    		 		地上の増援( POS_UP_LEFT )
    		 	end
    		 	
    			if ( table[1] != POS_UP_RIGHT ) and ( table[2] != POS_UP_RIGHT ) then
    		 		地上の増援( POS_UP_RIGHT )
    		 	end
    		 	
    			if ( table[1] != POS_DOWN_LEFT ) and ( table[2] != POS_DOWN_LEFT ) then
    		 		地上の増援( POS_DOWN_LEFT )
    		 	end
    		 	
    			if ( table[1] != POS_DOWN_RIGHT ) and ( table[2] != POS_DOWN_RIGHT ) then
    		 		地上の増援( POS_DOWN_RIGHT )
    		 	end
    			
    			
    		else
    			local pos_and = bit32.band( table[1], table[2] )
    			地上の増援( 対称のポイントを取得( pos_and ) )
    			飛行の増援( pos_and )
    			
    			
    		end
    		
    		
    	elseif	#table == 3 then
    		local pos_not = 30 - table[1] - table[2] - table[3]
    		地上の増援( pos_not )
    		
    		
    	end
    	
    end
	
end

function 生きている闇紋章士のリスト取得()
	
	local table = {}
	
	local index = ForceUnitGetFirst( FORCE_ENEMY )
	while index != nil do
		
		local gid = UnitGetGodUnit( index )
		if gid != nil then
			local pos = VariableGet( POS_PREFIX .. gid )
			table[ #table + 1 ] = pos
		end
		
		index = ForceUnitGetNext(index)
	end
	
	return table
	
end

function 対称のポイントを取得( pos )
	
	local pos_smty = bit32.bnot( pos )
	
    if bit32.band( pos, ( pos - 1 ) ) == 0 then
		
		if pos >= 4 then
			pos_smty = bit32.band( pos_smty, 12 )
		else
			pos_smty = bit32.band( pos_smty, 3 )
		end
		
		return pos_smty
		
	else
		
		pos_smty = bit32.band( pos_smty, 15 )
		return pos_smty
		
	end
	
end

function 地上の増援( pos )
	
	if		( pos == POS_UP ) then
		増援配置_FOCUSandWARP( "Reinforcement_Up" )
		
	elseif	( pos == POS_DOWN ) then
		増援配置_FOCUSandWARP( "Reinforcement_Down" )
		
	elseif	( pos == POS_LEFT ) then
		増援配置_FOCUSandWARP( "Reinforcement_Left" )
		
	elseif	( pos == POS_RIGHT ) then
		増援配置_FOCUSandWARP( "Reinforcement_Right" )
		
	elseif	( pos == POS_UP_LEFT ) then
		増援配置_FOCUSandWARP( "Reinforcement_UpLeft" )
		
	elseif	( pos == POS_UP_RIGHT ) then
		増援配置_FOCUSandWARP( "Reinforcement_UpRight" )
		
	elseif	( pos == POS_DOWN_LEFT ) then
		増援配置_FOCUSandWARP( "Reinforcement_DownLeft" )
		
	elseif	( pos == POS_DOWN_RIGHT ) then
		増援配置_FOCUSandWARP( "Reinforcement_DownRight" )
		
	end
	
end

function 飛行の増援( pos )
	
	if	( bit32.band( POS_UP,		pos ) != 0 ) then
		増援配置_FOCUS( "Reinforcement_Fly_Up" )
	end
		
	if	( bit32.band( POS_LEFT,		pos ) != 0 ) then
		増援配置_FOCUS( "Reinforcement_Fly_Left" )
	end
		
	if	( bit32.band( POS_RIGHT,	pos ) != 0 ) then
		増援配置_FOCUS( "Reinforcement_Fly_Right" )
	end
		
	if	( bit32.band( POS_DOWN,		pos ) != 0 ) then
		増援配置_FOCUS( "Reinforcement_Fly_Down" )
	end
	
end

function 増援配置_FOCUS( group )
	Dispos( group, DISPOS_FLAG_FOCUS )
	Yield()
	WaitTime( 0.5 )
end

function 増援配置_FOCUSandWARP( group )
	Dispos( group, DISPOS_FLAG_FOCUS + DISPOS_FLAG_WARP )
	Yield()
	WaitTime( 0.5 )
end

-- -----------------------------------

function condition_バリア破壊()
	
	if VariableGet( g_key_break_barrier ) == 1 then
		return true
	end
	
	return false
	
end

function バリア破壊()
	
	local _x = CursorGetX()
	local _z = CursorGetZ()

	if		UnitHasPrivateSkill( g_pid_sombre2, "SID_バリア４" ) or UnitHasPrivateSkill( g_pid_sombre2, "SID_バリア４_ノーマル用" )  then
		
		
		if DifficultyGet() == DIFFICULTY_NORMAL then
			スキル解除( g_pid_sombre2, "SID_バリア４_ノーマル用" )
			スキル装備( g_pid_sombre2, "SID_バリア３_ノーマル用" )
		else
			スキル解除( g_pid_sombre2, "SID_バリア４" )
			スキル装備( g_pid_sombre2, "SID_バリア３" )
		end
		
		CursorSetPos( g_pid_sombre2 )
		MapCameraWait()
		
		-- Dialog( "闇紋章撃破により\nソンブルのバリア破壊！\nLv.4→Lv.3" )
		EffectPlay("ソンブルバリア_破壊", 15, 15)
		EffectDelete("ソンブルバリア_Lv4", 15, 15)
		EffectCreate("ソンブルバリア_Lv3", 15, 15)
		WaitTime( 2.0 )
		
		
		
	elseif	UnitHasPrivateSkill( g_pid_sombre2, "SID_バリア３" ) or UnitHasPrivateSkill( g_pid_sombre2, "SID_バリア３_ノーマル用" ) then
		
		
		if DifficultyGet() == DIFFICULTY_NORMAL then
			スキル解除( g_pid_sombre2, "SID_バリア３_ノーマル用" )
			スキル装備( g_pid_sombre2, "SID_バリア２_ノーマル用" )
		else
			スキル解除( g_pid_sombre2, "SID_バリア３" )
			スキル装備( g_pid_sombre2, "SID_バリア２" )
		end
		
		CursorSetPos( g_pid_sombre2 )
		MapCameraWait()
		
		-- Dialog( "闇紋章撃破により\nソンブルのバリア破壊！\nLv.3→Lv.2" )
		EffectPlay("ソンブルバリア_破壊", 15, 15)
		EffectDelete("ソンブルバリア_Lv3", 15, 15)
		EffectCreate("ソンブルバリア_Lv2", 15, 15)
		WaitTime( 2.0 )
		
		
		
	elseif	UnitHasPrivateSkill( g_pid_sombre2, "SID_バリア２" ) or UnitHasPrivateSkill( g_pid_sombre2, "SID_バリア２_ノーマル用" ) then
		
		
		if DifficultyGet() == DIFFICULTY_NORMAL then
			スキル解除( g_pid_sombre2, "SID_バリア２_ノーマル用" )
			スキル装備( g_pid_sombre2, "SID_バリア１_ノーマル用" )
		else
			スキル解除( g_pid_sombre2, "SID_バリア２" )
			スキル装備( g_pid_sombre2, "SID_バリア１" )
		end
		
		CursorSetPos( g_pid_sombre2 )
		MapCameraWait()
		
		-- Dialog( "闇紋章撃破により\nソンブルのバリア破壊！\nLv.2→Lv.1" )
		EffectPlay("ソンブルバリア_破壊", 15, 15)
		EffectDelete("ソンブルバリア_Lv2", 15, 15)
		EffectCreate("ソンブルバリア_Lv1", 15, 15)
		WaitTime( 2.0 )
		
		
		
	elseif	UnitHasPrivateSkill( g_pid_sombre2, "SID_バリア１" ) or UnitHasPrivateSkill( g_pid_sombre2, "SID_バリア１_ノーマル用" ) then
		
		
		if DifficultyGet() == DIFFICULTY_NORMAL then
			スキル解除( g_pid_sombre2, "SID_バリア１_ノーマル用" )
		else
			スキル解除( g_pid_sombre2, "SID_バリア１" )
		end
		
		CursorSetPos( g_pid_sombre2 )
		MapCameraWait()
		
		-- Dialog( "闇紋章撃破により\nソンブルのバリア破壊！\nLv.1→none" )
		EffectPlay("ソンブルバリア_破壊", 15, 15)
		EffectDelete("ソンブルバリア_Lv1", 15, 15)
		WaitTime( 2.0 )
		
		if VariableGet( g_key_barrier_broken ) == 0 then
			Talk( "MID_EV3" )
			VariableSet( g_key_barrier_broken, 1 )
		end
		
		-- 復活段階の更新
		local counter = VariableGet( g_key_re_barrier_counter )
		counter = counter + 1
		VariableSet( g_key_re_barrier_counter, counter )
		
		-- バリア復活フラグ
		if ( DifficultyGet() == DIFFICULTY_NORMAL ) then
			
			if ( MindGetForce() == FORCE_PLAYER ) and ( 未行動ユニット数() >= g_actUnit_border ) then
				VariableSet( g_key_re_barrier, 2 )
			else
				VariableSet( g_key_re_barrier, 3 )
			end
			
		else
			
			if ( MindGetForce() == FORCE_PLAYER ) and ( 未行動ユニット数() >= g_actUnit_border ) then
				VariableSet( g_key_re_barrier, 1 )
			else
				VariableSet( g_key_re_barrier, 2 )
			end
			
		end
		
		
	end
	
	
	CursorSetPos( _x, _z )
	MapCameraWait()
	
	
	VariableSet( g_key_break_barrier, 0 )
	
end

function 未行動ユニット数()
	
	local noAct = -1	-- 戦闘中のユニットがまだ待機していないため
	
	local index = ForceUnitGetFirst( FORCE_PLAYER )
	while index != nil do
		
		if not UnitIsStatus( index, UNIT_STATUS_FIXED ) then
			noAct = noAct + 1
		end
		
		index = ForceUnitGetNext(index)
	end
	
	return noAct
	
end

-- -----------------------------------

function condition_バリア復活()
	
	local counter = VariableGet( g_key_re_barrier )
	if counter == 0 then
		return false
	end
	
	
	-- もう闇紋章士残っていない
	local stage = VariableGet( g_key_re_barrier_counter )
	if not ( ( stage == 1 ) or ( stage == 2 ) ) then
		return false
	end
	
	
	-- カウンター更新
	counter = counter - 1
	VariableSet( g_key_re_barrier, counter )
	
	
	return ( counter == 0 )
	
end

function バリア復活()
	
	local stage = VariableGet( g_key_re_barrier_counter )
	
	local x = UnitGetX( g_pid_sombre2 )
	local z = UnitGetZ( g_pid_sombre2 )
	CursorSetPos( x + 2, z )
	CursorSetDistanceMode( CURSOR_DISTANCE_FAR )
	MapCameraWait()
	
	
	if 		( stage == 1 ) then
		
		Talk( "MID_EV4" )
		-- Dialog( "ソンブルが次の闇紋章士を配置" )
		
		Dispos( "DarkEmblem2", DISPOS_FLAG_FORCED + DISPOS_FLAG_WARP )
		Yield()
		
	elseif 	( stage == 2 ) then
		
		-- Dialog( "ソンブルが次の闇紋章士を配置" )
		
		Dispos( "DarkEmblem3", DISPOS_FLAG_FORCED + DISPOS_FLAG_WARP )
		Yield()
		
	end
	
	
	-- Dialog( "闇紋章士がソンブルにバリアをはる" )
	EffectCreate("ソンブルバリア_Lv4", 15, 15)
	WaitTime( 2.0 )
	
	if DifficultyGet() == DIFFICULTY_NORMAL then
		スキル装備( g_pid_sombre2, "SID_バリア４_ノーマル用" )
	else
		スキル装備( g_pid_sombre2, "SID_バリア４" )
	end
	
	-- すぐ闇紋章士増援が出てほしいので、フラグを操作する
	VariableSet( g_reinforcement_counter, 1 )
	
	VariableSet( g_key_re_barrier, 0 )
	
end

-- -----------------------------------

function 闇紋章士戦闘前会話_味方紋章士取得()
	
	local god = nil
	if MindGetForce() == FORCE_PLAYER then
		god = UnitGetGodUnit( MindGetUnit() )
	else
		god = UnitGetGodUnit( MindGetTargetUnit() )
	end
	return god
	
end

function 闇紋章士戦闘前会話( mid, flag )
	Talk( mid )
	VariableSet( flag, 1 )
end

-- -----------------------------------

function condition_戦闘前会話メディウス()
	
	if VariableGet( g_key_戦闘前メディウス ) == 1 then
		return false
	end
	
	local god = 闇紋章士戦闘前会話_味方紋章士取得()
	if god == "GID_マルス" then
		return true
	end
	
	return false
	
end

function condition_戦闘前会話ロプトウス()
	
	if VariableGet( g_key_戦闘前ロプトウス ) == 1 then
		return false
	end
	
	local god = 闇紋章士戦闘前会話_味方紋章士取得()
	if god == "GID_シグルド" then
		return true
	end
	
	return false
	
end

function condition_戦闘前会話ドーマ()
	
	if VariableGet( g_key_戦闘前ドーマ ) == 1 then
		return false
	end
	
	local god = 闇紋章士戦闘前会話_味方紋章士取得()
	if god == "GID_セリカ" then
		return true
	end
	
	return false
	
end

function condition_戦闘前会話アスタルテ()
	
	if VariableGet( g_key_戦闘前アスタルテ ) == 1 then
		return false
	end
	
	local god = 闇紋章士戦闘前会話_味方紋章士取得()
	if god == "GID_ミカヤ" then
		return true
	end
	
	return false
	
end

function condition_戦闘前会話イドゥン()
	
	if VariableGet( g_key_戦闘前イドゥン ) == 1 then
		return false
	end
	
	local god = 闇紋章士戦闘前会話_味方紋章士取得()
	if god == "GID_ロイ" then
		return true
	end
	
	return false
	
end

function condition_戦闘前会話ベルド()
	
	if VariableGet( g_key_戦闘前ベルド ) == 1 then
		return false
	end
	
	local god = 闇紋章士戦闘前会話_味方紋章士取得()
	if god == "GID_リーフ" then
		return true
	end
	
	return false
	
end

function condition_戦闘前会話ギムレー()
	
	if VariableGet( g_key_戦闘前ギムレー ) == 1 then
		return false
	end
	
	local god = 闇紋章士戦闘前会話_味方紋章士取得()
	if god == "GID_ルキナ" then
		return true
	end
	
	return false
	
end

function condition_戦闘前会話ネルガル()
	
	if VariableGet( g_key_戦闘前ネルガル ) == 1 then
		return false
	end
	
	local god = 闇紋章士戦闘前会話_味方紋章士取得()
	if god == "GID_リン" then
		return true
	end
	
	return false
	
end

function condition_戦闘前会話アシュナード()
	
	if VariableGet( g_key_戦闘前アシュナード ) == 1 then
		return false
	end
	
	local god = 闇紋章士戦闘前会話_味方紋章士取得()
	if god == "GID_アイク" then
		return true
	end
	
	return false
	
end

function condition_戦闘前会話ネメシス()
	
	if VariableGet( g_key_戦闘前ネメシス ) == 1 then
		return false
	end
	
	local god = 闇紋章士戦闘前会話_味方紋章士取得()
	if god == "GID_ベレト" then
		return true
	end
	
	return false
	
end

function condition_戦闘前会話ハイドラ()
	
	if VariableGet( g_key_戦闘前ハイドラ ) == 1 then
		return false
	end
	
	local god = 闇紋章士戦闘前会話_味方紋章士取得()
	if god == "GID_カムイ" then
		return true
	end
	
	return false
	
end

function condition_戦闘前会話フォデス()
	
	if VariableGet( g_key_戦闘前フォデス ) == 1 then
		return false
	end
	
	local god = 闇紋章士戦闘前会話_味方紋章士取得()
	if god == "GID_エイリーク" then
		return true
	end
	
	return false
	
end

-- -----------------------------------

function 闇紋章士死亡会話( mid )
	Talk( mid )
	VariableSet( g_key_break_barrier, 1 )
end

-- -----------------------------------

function condition_邪竜ソンブルの攻撃()
	
	if VariableGet( g_key_start_battle2 ) == 0 then
		return false
	end
	
	return true
	
end

function 邪竜ソンブルの攻撃()
	
	-- カウンター更新
	VariableSet( g_key_EngageBreak,		math.max( 0, VariableGet( g_key_EngageBreak ) - 1 ) )
	VariableSet( g_key_SpinAttack,		math.max( 0, VariableGet( g_key_SpinAttack ) - 1 ) )
	VariableSet( g_key_Beam,			math.max( 0, VariableGet( g_key_Beam ) - 1 ) )
	
	
	if		VariableGet( g_key_EngageBreak_startup ) == 1 then
		エンゲージブレイク()
		
	elseif	VariableGet( g_key_Beam_startup ) == 1 then
		ビーム()
		
	elseif	condition_回転アタック可能() then
		回転アタック()
		
	else
		return
		
	end
	
	-- ソンブルは待機済みにする
	UnitSetStatus( g_pid_sombre2, UNIT_STATUS_FIXED )
	
	-- 巻き戻しなどのための履歴
	MapHistoryMindDone()
end

-- -----------------------------------

function condition_邪竜ソンブルの攻撃予告()
	
	if VariableGet( g_key_start_battle2 ) == 0 then
		return false
	end
	
	return true
	
end

function 邪竜ソンブルの攻撃予告()
	
	if	condition_エンゲージブレイク可能() then
		エンゲージブレイク予告()
		
	elseif	condition_ビーム発射可能() then
		ビーム予告()
		
	end
	
end


-- -----------------------------------

function MapEnding()
	
	Log("MapEnding")
	
end

function Ending()
	
	Log("Ending")
	
	Movie("Scene32")

	FadeInAndWait(0)
	Talk("MID_BT8")
	FadeOutAndWait(0)

	PuppetDemo("M026", "MID_ED1")
	PuppetDemo("M026", "MID_ED2")
	PuppetDemo("M026", "MID_ED3")
	PuppetDemo("M026", "MID_ED4")

	--[[
	FadeInAndWait(FADE_SLOW)
		Movie("S22")
		SkipEscape()
	FadeOutAndWait(FADE_NORMAL)
	]]

end

function GameOver()
	
	Log("GameOver")
	
	Movie("S21")
	SkipEscape()
	
	VariableSet(g_key_M026_gameover, 1)
	
end

-- -----------------------------------

function condition_エンゲージブレイク可能()
	if VariableGet( g_key_EngageBreak ) > 0 then
		return false
	end
	
	
	-- マップ中のエンゲージ中のユニット数をカウント
	local count_all = 0
	local count_engage = 0
	local index = ForceUnitGetFirst( FORCE_PLAYER )
	while index != nil do
		
		count_all = count_all + 1
		
		if UnitGetEngaging( index ) then
			count_engage = count_engage + 1
		end
		
		index = ForceUnitGetNext(index)
	end
	
	
	if ( count_all <= g_EngageBreak_unitBorder * 2 ) then
		return ( count_engage >= 1 )
		
	else
		return ( count_engage >= g_EngageBreak_unitBorder )
		
	end
end

function エンゲージブレイク予告()
	CursorSetPos( g_pid_sombre2 )
	MapCameraWait()
	
	if VariableGet( g_key_EngageBreak_tutorial ) == 0 then
		Dialog( "MID_TUT_NAVI_M026_ENGAGEBREAKE" )
		
		VariableSet( g_key_EngageBreak_tutorial, 1 )
	end
	
	VariableSet( g_key_EngageBreak_startup, 1 )
end

function エンゲージブレイク()
	
	CursorSetDistanceMode( CURSOR_DISTANCE_FAR )
	CursorSetPos( 15, 16 )
	MapCameraWait()
	
	-- Dialog( "エンゲージブレイク" )
	
	-- 巻き戻しなどのための履歴
	MapHistoryEngageBreak( g_pid_sombre2 )
	
	UnitRotation( g_pid_sombre2, ROTATE_DOWN )
	UnitMoveWait()
	
	-- 戦闘演出
	BattleSetAttack( g_pid_sombre2, "IID_ソンブル_エンゲージブレイク" )
	
	local list = {}
	local breakX = 0
	local breakZ = 0
	
	local index = ForceUnitGetFirst( FORCE_PLAYER )
	while index != nil do
		
		if UnitGetEngaging( index ) then
			list[ #list + 1 ] = index
			breakX = breakX + UnitGetX( index )
			breakZ = breakZ + UnitGetZ( index )
		end
		
		index = ForceUnitGetNext(index)
	end
	
	if #list > 0 then
		BattleStart( breakX/#list, breakZ/#list )
	else
		local centerX, centerZ = プレイヤー軍の中心点を算出()
		BattleStart( centerX, centerZ )
	end
	
	if #list > 0 then
		for id in pairs( list ) do
			EffectPlay( "エンゲージブレイク_ヒット", UnitGetX( list[id] ), UnitGetZ( list[id] ) )
			UnitSetEngaging( list[id], false )
			UnitSetEngageCount( list[id], 0 )
		end
	end
	
	
	UnitUpdate() -- 残像の削除
	
	WaitTime( 2.0 )
	
	VariableSet( g_key_EngageBreak_startup, 0 )
	VariableSet( g_key_EngageBreak, g_EngageBreak_span )
end

-- -----------------------------------

function condition_ビーム発射可能()
	if VariableGet( g_key_Beam ) > 0 then
		return false
	end
	
	
	-- １２方向それぞれの範囲内のユニット数をカウント
	local count = { 
		{ DIR= 1, POINT=0 },
		{ DIR= 2, POINT=0 },
		{ DIR= 3, POINT=0 },
		{ DIR= 4, POINT=0 },
		{ DIR= 5, POINT=0 },
		{ DIR= 6, POINT=0 },
		{ DIR= 7, POINT=0 },
		{ DIR= 8, POINT=0 },
		{ DIR= 9, POINT=0 },
		{ DIR=10, POINT=0 },
		{ DIR=11, POINT=0 },
		{ DIR=12, POINT=0 }
	}
	
	for z = 1, g_map_height-2 do
		for x = 1, g_map_width-2 do
			
			local unit = UnitGetByPos( x, z )
			if ( not ( unit == nil ) ) and ( UnitGetForce( unit ) == FORCE_PLAYER ) then
				
				local num = g_BeamArea_1_4_7_10[z][x]
				if num > 0 then
					count[num].POINT = count[num].POINT + 1
				end
				
				num = g_BeamArea_2_5_8_11[z][x]
				if num > 0 then
					count[num].POINT = count[num].POINT + 1
				end
				
				num = g_BeamArea_3_6_9_12[z][x]
				if num > 0 then
					count[num].POINT = count[num].POINT + 1
				end
				
			end
			
		end
	end
	
	
	-- 降順にソート
	table.sort( count,
				function( a, b )
					return ( a.POINT > b.POINT )
				end
				)
	
	
	-- 人数が満たなければ発動しない
	if ( count[1].POINT < g_Beam_unitBorder ) then
		return false
	end
	
	
	local max_danger_num = 0
	for i = 1, #count do
		if ( count[i].POINT == count[1].POINT ) then
			max_danger_num = max_danger_num + 1
		end
	end
	
	
	local beamDir = count[RandomGet( max_danger_num ) + 1].DIR
	VariableSet( g_key_Beam_Direction, beamDir )
	
	
	return true
end

function ビーム予告()
	
	local dir = VariableGet( g_key_Beam_Direction )
	local group = ( dir - 1 ) % 3
	
	ビーム_カメラ制御( dir )
	-- Dialog( "ビーム予告" )
	
	MapRangeAddBegin()
	for z = 1, g_map_height-2 do
		for x = 1, g_map_width-2 do
			
			if		group == 0 then
				if g_BeamArea_1_4_7_10[z][x] == dir then
					MapRangeAdd( x, z )
				end
				
			elseif	group == 1 then
				if g_BeamArea_2_5_8_11[z][x] == dir then
					MapRangeAdd( x, z )
				end
				
			elseif	group == 2 then
				if g_BeamArea_3_6_9_12[z][x] == dir then
					MapRangeAdd( x, z )
				end
				
			end
			
		end
	end
	MapRangeAddEnd()
	
	Dialog( "MID_TUT_NAVI_M026_BEAM_WARNING" )
	
	VariableSet( g_key_Beam_startup, 1 )
end

function ビーム()
	
	-- Dialog( "ビーム" )
	
	local dir = VariableGet( g_key_Beam_Direction )
	local group = ( dir - 1 ) % 3
	local unitCount = 0
	
	
	MapRangeClear()
	
	CursorSetDistanceMode( CURSOR_DISTANCE_MIDDLE )
	ソンブル向き制御( dir )
	BattleSetAttack( g_pid_sombre2, "IID_ソンブル_ビーム" )
		
		-- 攻撃対象ユニットの算出
		for z = 1, g_map_height-2 do
			for x = 1, g_map_width-2 do
				
				local num = 0
				
				if		group == 0 then
					num = g_BeamArea_1_4_7_10[z][x]
					
				elseif	group == 1 then
					num = g_BeamArea_2_5_8_11[z][x]
					
				elseif	group == 2 then
					num = g_BeamArea_3_6_9_12[z][x]
					
				end
				
				
				if num == dir then
					
					local unit = UnitGetByPos( x, z )
					if ( not ( unit == nil ) ) and ( UnitGetForce( unit ) == FORCE_PLAYER ) then
						
						BattleAddTarget( unit )
						unitCount = unitCount + 1
						
					end
					
				end
				
			end
		end
	
	local targetX, targetZ = ビーム_カメラ制御_座標計算( dir )
	BattleStart( targetX, targetZ )
	
	ビーム_瘴気マス設置( dir, group )
	
	WaitTime( 1.5 )
	
	VariableSet( g_key_Beam_startup, 0 )
	VariableSet( g_key_Beam, g_Beam_span )
end

-- -----------------------------------

function ビーム_瘴気マス設置( dir, group )
	
	MapOverlapSetBegin()
	for z = 1, g_map_height-2 do
		for x = 1, g_map_width-2 do
			
			local num = 0
			
			if		group == 0 then
				num = g_BeamArea_1_4_7_10[z][x]
				
			elseif	group == 1 then
				num = g_BeamArea_2_5_8_11[z][x]
				
			elseif	group == 2 then
				num = g_BeamArea_3_6_9_12[z][x]
				
			end
			
			
			if num == dir then
				
				-- 瘴気マスにする
				local cost = TerrainGetMoveCost( x, z )
				if ( ( cost == "COST_平地" )
					or ( cost == "COST_林" )
					or ( cost == "COST_浅瀬" ) )
					and ( RandomGet( 100 ) < g_Beam_Dirty_Rate ) then
						MapOverlapSet( x, z, "TID_瘴気" )
				else
						MapOverlapSet( x, z, "TID_無し" )
				end
				
			end
			
		end
	end
	MapOverlapSetEnd()
	
end

-- -----------------------------------

function ビーム_カメラ制御( dir )
	local x, z = ビーム_カメラ制御_座標計算( dir )
	
	CursorSetDistanceMode( CURSOR_DISTANCE_MIDDLE )
	CursorSetPos( x, z )
	MapCameraWait()
end

function ビーム_カメラ制御_座標計算( dir )
	
	if UnitExistOnMap( g_pid_sombre2 ) then
		
		local x = UnitGetX( g_pid_sombre2 ) + 2
		local z = UnitGetZ( g_pid_sombre2 ) + 2
		
		
		if		( dir == 1 ) or ( dir == 2 ) then				-- DOWN_RIGHT
			x = x + 3
			z = z - 3
			
		elseif	( dir == 3 ) then								-- RIGHT
			x = x + 4
			
		elseif	( dir == 4 ) or ( dir == 5 ) then				-- UP_RIGHT
			x = x + 3
			z = z + 3
			
		elseif	( dir == 6 ) then								-- UP
			z = z + 4
			
		elseif	( dir == 7 ) or ( dir == 8 ) then				-- UP_LEFT
			x = x - 3
			z = z + 3
			
		elseif	( dir == 9 ) then								-- LEFT
			x = x - 4
			
		elseif	( dir == 10 ) or ( dir == 11 ) then				-- DOWN_LEFT
			x = x - 3
			z = z - 3
			
		elseif	( dir == 12 ) then								-- DOWN
			z = z - 4
			
		end
		
		return x, z
		
	end
	
	return 15, 15
	
end

function ソンブル向き制御( dir )
	
	if UnitExistOnMap( g_pid_sombre2 ) then
		
		if		( dir == 1 ) or ( dir == 2 ) then				-- DOWN_RIGHT
			UnitRotation( g_pid_sombre2, ROTATE_DOWN_RIGHT )
			
		elseif	( dir == 3 ) then								-- RIGHT
			UnitRotation( g_pid_sombre2, ROTATE_RIGHT )
			
		elseif	( dir == 4 ) or ( dir == 5 ) then				-- UP_RIGHT
			UnitRotation( g_pid_sombre2, ROTATE_UP_RIGHT )
			
		elseif	( dir == 6 ) then								-- UP
			UnitRotation( g_pid_sombre2, ROTATE_UP )
			
		elseif	( dir == 7 ) or ( dir == 8 ) then				-- UP_LEFT
			UnitRotation( g_pid_sombre2, ROTATE_UP_LEFT )
			
		elseif	( dir == 9 ) then								-- LEFT
			UnitRotation( g_pid_sombre2, ROTATE_LEFT )
			
		elseif	( dir == 10 ) or ( dir == 11 ) then				-- DOWN_LEFT
			UnitRotation( g_pid_sombre2, ROTATE_DOWN_LEFT )
			
		elseif	( dir == 12 ) then								-- DOWN
			UnitRotation( g_pid_sombre2, ROTATE_DOWN )
			
		end
		
		UnitMoveWait()
		
	end
	
end

-- -----------------------------------

function condition_回転アタック可能()
	if VariableGet( g_key_SpinAttack ) > 0 then
		return false
	end
	
	
	-- 攻撃範囲内のユニット数をカウント
	local count = 0
	local sombreX = UnitGetX( g_pid_sombre2 )
	local sombreZ = UnitGetZ( g_pid_sombre2 )
	
	for z = 1, g_SpinAttack_Area_Size do
		for x = 1, g_SpinAttack_Area_Size do
			
			if not ( g_SpinAttack_Area[z][x] == 0 ) then
				
				local unitX = sombreX + g_SpinAttack_Area_OffsetX + x
				local unitZ = sombreZ + g_SpinAttack_Area_OffsetZ + z
				local unit = UnitGetByPos( unitX, unitZ )
				
				if ( unit != nil ) and ( UnitGetForce( unit ) == FORCE_PLAYER ) then
					count = count + 1
				end
				
			end
			
		end
	end
	
	
	return ( count >= g_SpinAttack_unitBorder )
end

function 回転アタック()
	
	CursorSetDistanceMode( CURSOR_DISTANCE_MIDDLE )
	CursorSetPos( 15, 14 )
	MapCameraWait()
	
	-- Dialog( "回転アタック" )
	
	local sombreX = UnitGetX( g_pid_sombre2 )
	local sombreZ = UnitGetZ( g_pid_sombre2 )
	
	local x = 1
	local z = 1
	
	BattleSetAttack( g_pid_sombre2, "IID_ソンブル_回転アタック" )
		
		
		while( g_SpinAttack_Route[z][x] != G_DIR_NONE ) do
			
			if not ( g_SpinAttack_Area[z][x] == 0 ) then
				
				local unitX = sombreX + g_SpinAttack_Area_OffsetX + x
				local unitZ = sombreZ + g_SpinAttack_Area_OffsetZ + z
				
				local unit = UnitGetByPos( unitX, unitZ )
				if		( unit != nil ) 
					and	( UnitGetForce( unit ) == FORCE_PLAYER ) then
					
					BattleAddTarget( unit )
					
				end
				
			end
			
			x, z = 回転アタック_インデックス更新( x, z, g_SpinAttack_Route[z][x] )
			
		end
		
		
	local centerX, centerZ = プレイヤー軍の中心点を算出()
	BattleStart( centerX, centerZ )
	
	WaitTime( 1.0 )
	
	VariableSet( g_key_SpinAttack, g_SpinAttack_span )
end

function 回転アタック_スマッシュ( unit, dir )
	
	if ( dir == G_DIR_DIAGONAL ) then
		return
	end
	
	local x = UnitGetX( unit )
	local z = UnitGetZ( unit )
	local toX, toZ = 回転アタック_インデックス更新( x, z, dir )
	
	if ( UnitGetByPos( toX, toZ ) == nil ) and UnitCanEnter( unit, toX, toZ ) then
		UnitSetPos( unit, toX, toZ )
	else
		スキル装備( unit, "SID_気絶" )
	end
	
end

function 回転アタック_インデックス更新( x, z, dir )
	
	if		( dir == G_DIR_LEFT )	then
		x = x - 1
	elseif	( dir == G_DIR_RIGHT )	then
		x = x + 1
	elseif	( dir == G_DIR_UP )		then
		z = z + 1
	elseif	( dir == G_DIR_DOWN )	then
		z = z - 1
	end
	
	return x, z
	
end
