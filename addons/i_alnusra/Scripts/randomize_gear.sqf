_this setVariable ["BIS_enableRandomization", false];
sleep 0.5;

[_this,"insignia_cfp_alNusra"] call BIS_fnc_setUnitInsignia;

// Set Custom language
[_this, "Male01_ackbar"] remoteExecCall ["setSpeaker", 0];

if ( !isNil { _this getVariable "NoRandom" }  ) exitWith {};

_headgearProbability = getnumber (configFile >> "cfgvehicles" >> typeof _this >> "headgearProbability"); // Gets the number from headgearProbability parameter in a character class.

_headgearRandomize = floor random 100; // Gets a random number.

_headgear = {};

if (_headgearRandomize <= _headgearProbability) then
{
	_headgear = getarray (configFile >> "cfgvehicles" >> typeof _this >> "allowedheadgear"); // If the random number doesn't exceed headgearProbability, a character gets one of his dominant headgear.
}
else
{
	_headgear = getarray (configFile >> "cfgvehicles" >> typeof _this >> "allowedheadgearB"); // If the random number exceeds headgearProbability, one of the rest of the headgear is used.
}; // Both from above load an array of headgear classes into headgear variable.

_headCount = count _headgear; // Gets the number of headgear in the array.

if (isServer) then
{
	_headSelected = "";
	
	_rnd1 = random _headCount; // Gets a random number up to the number of headgear in the array. No floor here because it messes up the case with an array containing only one item.
	if (_rnd1 > 0) then
	{
		_headSelected = _headgear select floor _rnd1; // Selects a random headgear from the array.
		_this addHeadgear (_headSelected); // Adds selected headgear to a character.
	}
	else
	{
		_headSelected = "H_FakeHeadgear"; // Occasionally, no headgear is used.
		removeHeadgear _this; //Removes any headgear a character might have had defined in his class.
	};
	
	_facewear = getarray (configFile >> "cfgvehicles" >> typeof _this >> "allowedfacewear"); // Loads an array of matching facewear defined in allowedFacewear parameter of previously selected headgear.
	_faceCount = count _facewear; // Gets the number of facewear in the array.
		
	_rnd2 = floor random _faceCount; // Gets a random number up to the number of facewear in the array.
		
	if (_rnd2 > 0) then
	{
		_this addGoggles (_facewear select _rnd2); // assign a random facewear .
		_goggles = goggles _this;
		if ((_goggles == "G_Diving") or
		(_goggles == "G_Shades_Black") or
		(_goggles == "G_Shades_Blue") or
		(_goggles == "G_Sport_Blackred") or
		(_goggles == "G_Tactical_Clear") or
		(_goggles == "G_Spectacles") or
		(_goggles == "G_Spectacles_Tinted") or
		(_goggles == "G_Combat") or
		(_goggles == "G_Lowprofile") or
		(_goggles == "G_Shades_Green") or
		(_goggles == "G_Shades_Red") or
		(_goggles == "G_Squares") or
		(_goggles == "G_Squares_Tinted") or
		(_goggles == "G_Sport_BlackWhite") or
		(_goggles == "G_Sport_Blackyellow") or
		(_goggles == "G_Sport_Greenblack") or
		(_goggles == "G_Sport_Checkered") or
		(_goggles == "G_Sport_Red") or
		(_goggles == "G_Aviator") or
		(_goggles == "G_Lady_Blue") or
		(_goggles == "G_Lady_Dark") or
		(_goggles == "G_Lady_Mirror") or
		(_goggles == "G_Lady_Red") or
		(_goggles == "G_Bandanna_aviator") or
		(_goggles == "G_Balaclava_combat") or
		(_goggles == "G_Balaclava_lowprofile") or
		(_goggles == "G_Bandanna_shades") or
		(_goggles == "G_Tactical_Black")
		) then
		{
			removeGoggles _this;
		};
	}
	else
	{
		removeGoggles _this; // Sometimes no facewear
		_beards = [];
		_beard = "";
		if (_headgearRandomize > _headgearProbability) then 
		{
			if (isClass (configFile >> "CfgGlasses" >> "SFG_Tac_BeardD")) then 
			{
				_beards = ["SFG_Tac_BeardD","SFG_Tac_smallBeardD"];
				_count = count _beards;
				_beard = (_beards select floor random _count);
				_this addGoggles _beard;
			};
		};
	};
	_magazines = magazines _this;
	removeVest _this;
	_class = typeOf _this;
	
	switch _class do 
	{
		// Independent units
		
		case "cfp_i_alNusra_team_leader": 
		{
			_vests = ["V_TacVest_blk","V_TacVest_khk","V_TacVest_brn","V_TacVest_oli","V_TacVest_camo","V_PlateCarrier1_rgr","V_PlateCarrier1_blk"];
			_count = count _vests;
			_this addVest (_vests select floor random _count);
		};
		case "cfp_i_alNusra_squad_leader": 
		{
			_vests = ["V_TacVest_blk","V_TacVest_khk","V_TacVest_brn","V_TacVest_oli","V_TacVest_camo","SP_OpforRig1_Black","SP_OpforRig1_Green","SP_OpforRig1_Tan","SP_OpforRig1_Grey"];
			_count = count _vests;
			_this addVest (_vests select floor random _count);
		};
		case "cfp_i_alNusra_grenadier": 
		{
			_vests = ["V_HarnessOGL_gry","V_HarnessOGL_brn"];
			_count = count _vests;
			_this addVest (_vests select floor random _count);
		};
		case "cfp_i_alNusra_rifleman": 
		{
			_vests = ["V_HarnessO_brn","V_HarnessO_gry","V_TacVest_blk","V_TacVest_khk","V_TacVest_brn","V_TacVest_oli","V_TacVest_camo","SP_OpforRig1_Black","SP_OpforRig1_Green","SP_OpforRig1_Tan","SP_OpforRig1_Grey","V_TacChestrig_grn_F","V_TacChestrig_cbr_F","V_TacChestrig_oli_F","CUP_V_CDF_6B3_2_FST","CUP_V_I_RACS_Carrier_Rig_wdl_2","CUP_V_I_Guerilla_Jacket","CUP_V_I_Carrier_Belt","CUP_V_RUS_Smersh_1"];
			_count = count _vests;
			_this addVest (_vests select floor random _count);
		};
		case "cfp_i_alNusra_rifleman_dshkm": 
		{
			_vests = ["V_HarnessO_brn","V_HarnessO_gry","V_TacVest_blk","V_TacVest_khk","V_TacVest_brn","V_TacVest_oli","V_TacVest_camo","SP_OpforRig1_Black","SP_OpforRig1_Green","SP_OpforRig1_Tan","SP_OpforRig1_Grey","V_TacChestrig_grn_F","V_TacChestrig_cbr_F","V_TacChestrig_oli_F","CUP_V_CDF_6B3_2_FST","CUP_V_I_RACS_Carrier_Rig_wdl_2","CUP_V_I_Guerilla_Jacket","CUP_V_I_Carrier_Belt","CUP_V_RUS_Smersh_1"];
			_count = count _vests;
			_this addVest (_vests select floor random _count);
		};
		case "cfp_i_alNusra_rifleman_kord": 
		{
			_vests = ["V_HarnessO_brn","V_HarnessO_gry","V_TacVest_blk","V_TacVest_khk","V_TacVest_brn","V_TacVest_oli","V_TacVest_camo","SP_OpforRig1_Black","SP_OpforRig1_Green","SP_OpforRig1_Tan","SP_OpforRig1_Grey","V_TacChestrig_grn_F","V_TacChestrig_cbr_F","V_TacChestrig_oli_F","CUP_V_CDF_6B3_2_FST","CUP_V_I_RACS_Carrier_Rig_wdl_2","CUP_V_I_Guerilla_Jacket","CUP_V_I_Carrier_Belt","CUP_V_RUS_Smersh_1"];
			_count = count _vests;
			_this addVest (_vests select floor random _count);
		};
		case "cfp_i_alNusra_rifleman_podnos": 
		{
			_vests = ["V_HarnessO_brn","V_HarnessO_gry","V_TacVest_blk","V_TacVest_khk","V_TacVest_brn","V_TacVest_oli","V_TacVest_camo","SP_OpforRig1_Black","SP_OpforRig1_Green","SP_OpforRig1_Tan","SP_OpforRig1_Grey","V_TacChestrig_grn_F","V_TacChestrig_cbr_F","V_TacChestrig_oli_F","CUP_V_CDF_6B3_2_FST","CUP_V_I_RACS_Carrier_Rig_wdl_2","CUP_V_I_Guerilla_Jacket","CUP_V_I_Carrier_Belt","CUP_V_RUS_Smersh_1"];
			_count = count _vests;
			_this addVest (_vests select floor random _count);
		};
		case "cfp_i_alNusra_rifleman_ags30": 
		{
			_vests = ["V_HarnessO_brn","V_HarnessO_gry","V_TacVest_blk","V_TacVest_khk","V_TacVest_brn","V_TacVest_oli","V_TacVest_camo","SP_OpforRig1_Black","SP_OpforRig1_Green","SP_OpforRig1_Tan","SP_OpforRig1_Grey","V_TacChestrig_grn_F","V_TacChestrig_cbr_F","V_TacChestrig_oli_F","CUP_V_CDF_6B3_2_FST","CUP_V_I_RACS_Carrier_Rig_wdl_2","CUP_V_I_Guerilla_Jacket","CUP_V_I_Carrier_Belt","CUP_V_RUS_Smersh_1"];
			_count = count _vests;
			_this addVest (_vests select floor random _count);
		};
		case "cfp_i_alNusra_rifleman_metis": 
		{
			_vests = ["V_HarnessO_brn","V_HarnessO_gry","V_TacVest_blk","V_TacVest_khk","V_TacVest_brn","V_TacVest_oli","V_TacVest_camo","SP_OpforRig1_Black","SP_OpforRig1_Green","SP_OpforRig1_Tan","SP_OpforRig1_Grey","V_TacChestrig_grn_F","V_TacChestrig_cbr_F","V_TacChestrig_oli_F","CUP_V_CDF_6B3_2_FST","CUP_V_I_RACS_Carrier_Rig_wdl_2","CUP_V_I_Guerilla_Jacket","CUP_V_I_Carrier_Belt","CUP_V_RUS_Smersh_1"];
			_count = count _vests;
			_this addVest (_vests select floor random _count);
		};
		case "cfp_i_alNusra_rifleman_spg9": 
		{
			_vests = ["V_HarnessO_brn","V_HarnessO_gry","V_TacVest_blk","V_TacVest_khk","V_TacVest_brn","V_TacVest_oli","V_TacVest_camo","SP_OpforRig1_Black","SP_OpforRig1_Green","SP_OpforRig1_Tan","SP_OpforRig1_Grey","V_TacChestrig_grn_F","V_TacChestrig_cbr_F","V_TacChestrig_oli_F","CUP_V_CDF_6B3_2_FST","CUP_V_I_RACS_Carrier_Rig_wdl_2","CUP_V_I_Guerilla_Jacket","CUP_V_I_Carrier_Belt","CUP_V_RUS_Smersh_1"];
			_count = count _vests;
			_this addVest (_vests select floor random _count);
		};
		case "cfp_i_alNusra_machinegunner": 
		{
			removeBackpack _this;
			_vests = ["V_TacVest_blk","V_TacVest_khk","V_TacVest_brn","V_TacVest_oli","V_TacVest_camo"];
			_count = count _vests;
			_this addVest (_vests select floor random _count);
			_packs = ["b_assaultpack_blk","b_assaultpack_cbr","b_assaultpack_khk","B_OutdoorPack_blk","B_OutdoorPack_tan","B_HuntingBackpack","B_Kitbag_cbr"];
			_count = count _packs;
			_this addBackpack (_packs select floor random _count);
		};
		case "cfp_i_alNusra_sniper": 
		{
			_vests = ["V_BandollierB_khk","V_BandollierB_cbr","V_BandollierB_rgr","V_BandollierB_blk","V_BandollierB_oli"];
			_count = count _vests;
			_this addVest (_vests select floor random _count);
		};
		case "cfp_i_alNusra_at": 
		{
			_vests = ["V_HarnessO_brn","V_HarnessO_gry","V_TacVest_blk","V_TacVest_khk","V_TacVest_brn","V_TacVest_oli","V_TacVest_camo","SP_OpforRig1_Black","SP_OpforRig1_Green","SP_OpforRig1_Tan","SP_OpforRig1_Grey","V_TacChestrig_grn_F","V_TacChestrig_cbr_F","V_TacChestrig_oli_F","CUP_V_CDF_6B3_2_FST","CUP_V_I_RACS_Carrier_Rig_wdl_2","CUP_V_I_Guerilla_Jacket","CUP_V_I_Carrier_Belt","CUP_V_RUS_Smersh_1"];
			_count = count _vests;
			_this addVest (_vests select floor random _count);
		};
		case "cfp_i_alNusra_medic": 
		{
			_vests = ["V_HarnessO_brn","V_HarnessO_gry","V_TacVest_blk","V_TacVest_khk","V_TacVest_brn","V_TacVest_oli","V_TacVest_camo","SP_OpforRig1_Black","SP_OpforRig1_Green","SP_OpforRig1_Tan","SP_OpforRig1_Grey","V_TacChestrig_grn_F","V_TacChestrig_cbr_F","V_TacChestrig_oli_F","CUP_V_CDF_6B3_2_FST","CUP_V_I_RACS_Carrier_Rig_wdl_2","CUP_V_I_Guerilla_Jacket","CUP_V_I_Carrier_Belt","CUP_V_RUS_Smersh_1"];
			_count = count _vests;
			_this addVest (_vests select floor random _count);
		};
		case "cfp_i_alNusra_sapper": 
		{
			removeBackpack _this;
			_vests = ["V_HarnessO_brn","V_HarnessO_gry","V_TacVest_blk","V_TacVest_khk","V_TacVest_brn","V_TacVest_oli","V_TacVest_camo","SP_OpforRig1_Black","SP_OpforRig1_Green","SP_OpforRig1_Tan","SP_OpforRig1_Grey","V_TacChestrig_grn_F","V_TacChestrig_cbr_F","V_TacChestrig_oli_F","CUP_V_CDF_6B3_2_FST","CUP_V_I_RACS_Carrier_Rig_wdl_2","CUP_V_I_Guerilla_Jacket","CUP_V_I_Carrier_Belt","CUP_V_RUS_Smersh_1"];
			_count = count _vests;
			_this addVest (_vests select floor random _count);
			_packs = ["b_assaultpack_blk","b_assaultpack_cbr","b_assaultpack_khk","B_OutdoorPack_blk","B_OutdoorPack_tan","B_HuntingBackpack","B_Kitbag_cbr"];
			_count = count _packs;
			_this addBackpack (_packs select floor random _count);
		};
		case "cfp_i_alNusra_crewman": 
		{
			_vests = ["V_HarnessO_brn","V_HarnessO_gry","V_TacVest_blk","V_TacVest_khk","V_TacVest_brn","V_TacVest_oli","V_TacVest_camo","SP_OpforRig1_Black","SP_OpforRig1_Green","SP_OpforRig1_Tan","SP_OpforRig1_Grey","V_TacChestrig_grn_F","V_TacChestrig_cbr_F","V_TacChestrig_oli_F","CUP_V_CDF_6B3_2_FST","CUP_V_I_RACS_Carrier_Rig_wdl_2","CUP_V_I_Guerilla_Jacket","CUP_V_I_Carrier_Belt","CUP_V_RUS_Smersh_1"];
			_count = count _vests;
			_this addVest (_vests select floor random _count);
		};
	};
	{_this addMagazine _x} forEach _magazines;
};