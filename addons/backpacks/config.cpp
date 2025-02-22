#include "script_component.hpp"

class CfgPatches
{
    class ADDON
    {
        name = COMPONENT_NAME;
        units[] = {
            "SP_Carryall_Black",
            "SP_Carryall_Green",
            "SP_Carryall_Tan",
            "SP_Carryall_White",
            "SP_Carryall_ATacsFG",
            "SP_Carryall_ATacsAU",
            "SP_Carryall_Multicam",
            "CFP_RPGPack_Black",
            "CFP_RPGPack_Grey",
            "CFP_RPGPack_Khaki",
            "CFP_RPGPack_TropicGreen",
            "CFP_Kitbag_EDRL",
            "CFP_Kitbag_IranDPM",
            "CFP_Kitbag_M81",
            "CFP_Kitbag_Marpat",
            "CFP_Kitbag_PolygonDesert",
            "CFP_Kitbag_PolygonWoodland",
            "CFP_Kitbag_Woodland",
	    "CFP_Kitbag_MarpatDesert",
	    "CFP_Kitbag_Tropentarn",
	    "CFP_Kitbag_Flecktarn",
            "CFP_AssaultPack_M81",
            "CFP_AssaultPack_Marpat",
	    "CFP_AssaultPack_MarpatDesert",
            "CFP_AssaultPack_PolygonDesert",
            "CFP_AssaultPack_PolygonWoodland",
            "CFP_AssaultPack_Woodland",
	    "CFP_AssaultPack_Tropentarn",
	    "CFP_AssaultPack_Flecktarn",
	    "CFP_AssaultPack_Multicam",
	    "CFP_AssaultPack_IDF",
            "CFP_Carryall_DPMWoodland",
	    "CFP_FieldPack_ATACSAU",
	    "CFP_FieldPack_ATACSFG"
        };
        weapons[] = {};
        author = MODULE_AUTHOR;
        authors[] = {"SP Craig", "Tupolov","AuburnAlumni"};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"CFP_main","CFP_Models"};
        VERSION_CONFIG;
    };
};

#include "CfgVehicles.hpp"
