#include <\x\cfp\addons\main\script_component.hpp>
SCRIPT(randomizeWeapon);

/* ----------------------------------------------------------------------------
Function: CFP_fnc_randomizeWeapon)
Description:
Randomizes a units weapon loadout based on config

Parameters:
Object - Unit
Category - String

Returns:
Nil

Examples:
(begin example)
[_this, "Rifles"] call cfp_fnc_randomizeWeapon;
(end)

See Also:
- nil

Author:
Tupolov

Peer reviewed:
nil
----------------------------------------------------------------------------

Random items
- grenade
- rifle
- handgun
- explosive
- launcher

*/

params ["_unit","_cat"];

private _category = format["%1List",_cat];
private _array = (configFile >> "CfgVehicles" >> typeOf _unit >> _category) call BIS_fnc_getCfgData;

if (count _array == 0) exitWith {};

private _item = selectRandomWeighted _array;

if (_item isEqualType "") exitWith {};

// Need to check vest/backpack capacity?

switch (_cat) do {

	case ("grenade") : {
		_unit addMagazines _item;
	};
	case ("handgun") : {
		_unit addMagazines (_item select 1);
		_unit addWeapon (_item select 0);
	};
	case ("rifle") : {
		if (((_item select 1) select 0) isEqualType []) then {
			{
				_unit addMagazines _x;
			} foreach (_item select 1);
		} else {
			_unit addMagazines (_item select 1);
		};
		_unit addWeapon (_item select 0);
		// Check for scope/muzzle etc
		if (count _item > 2) then {
			_unit addPrimaryWeaponItem (_item select 2);
		};
	};
	case ("launcher") : {
		// check for space?
		_unit addMagazines (_item select 1);
		_unit addWeapon (_item select 0);
	};
	case ("explosive") : {
		{
			_unit addMagazines _x;
		} foreach _item;
	};
};


