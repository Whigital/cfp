#include "script_component.hpp"

class CfgPatches
{
    class ADDON
    {
        units[] = {};
        weapons[] = {};
        author = MODULE_AUTHOR;
        authors[] = {"SP Craig", "Siege-A", "Tupolov","AuburnAlumni"};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"CFP_main"};
        VERSION_CONFIG;
    };
};

class CfgUnitInsignia
{
    #include "Core.hpp"
    #include "AF.hpp"
    #include "IQ.hpp"
    #include "RU.hpp"    
    #include "UK.hpp"    
    #include "US.hpp"
    #include "Hezbollah.hpp"
};
