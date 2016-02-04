/**
 * AdminToolkit - An arma3 administration helper tool
 * @author ole1986
 */
 
private['_handled'];
_handled = false;

switch (_this select 1) do
{
	// Function Key 2 (F2)
	case 0x3C: 
	{
        _handled = true;
        if (!dialog) then {
            systemChat "Opening AdminToolkitMenu...";
            createDialog "AdminToolkitMenu";
            [] call AdminToolkit_buttonEvents;
        } else {
            closeDialog 0;
        };
	};
};
_handled;