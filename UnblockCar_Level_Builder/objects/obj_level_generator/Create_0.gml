
#macro STRING_LN "\n"
#macro EMPTY "x"
enum OBJECT_TYPE
{
	WALL,
	MY_CAR,
	OTHER_CAR
}

// The initial array is the template of an empty level, which only contains walls.
level = 
[
	noone, OBJECT_TYPE.WALL, OBJECT_TYPE.WALL, OBJECT_TYPE.WALL, OBJECT_TYPE.WALL, OBJECT_TYPE.WALL, OBJECT_TYPE.WALL, OBJECT_TYPE.WALL, OBJECT_TYPE.WALL, OBJECT_TYPE.WALL, OBJECT_TYPE.WALL, OBJECT_TYPE.WALL, OBJECT_TYPE.WALL, noone,
	OBJECT_TYPE.WALL, noone, noone, noone, noone, noone, noone, noone, noone, noone, noone, noone, noone, OBJECT_TYPE.WALL,
	OBJECT_TYPE.WALL, noone, noone, noone, noone, noone, noone, noone, noone, noone, noone, noone, noone, OBJECT_TYPE.WALL,
	OBJECT_TYPE.WALL, noone, noone, noone, noone, noone, noone, noone, noone, noone, noone, noone, noone, OBJECT_TYPE.WALL,
	OBJECT_TYPE.WALL, noone, noone, noone, noone, noone, noone, noone, noone, noone, noone, noone, noone, noone,
	OBJECT_TYPE.WALL, noone, noone, noone, noone, noone, noone, noone, noone, noone, noone, noone, noone, OBJECT_TYPE.WALL,
	OBJECT_TYPE.WALL, noone, noone, noone, noone, noone, noone, noone, noone, noone, noone, noone, noone, OBJECT_TYPE.WALL,
	noone, OBJECT_TYPE.WALL, OBJECT_TYPE.WALL, OBJECT_TYPE.WALL, OBJECT_TYPE.WALL, OBJECT_TYPE.WALL, OBJECT_TYPE.WALL, OBJECT_TYPE.WALL, OBJECT_TYPE.WALL, OBJECT_TYPE.WALL, OBJECT_TYPE.WALL, OBJECT_TYPE.WALL, OBJECT_TYPE.WALL, noone,
]

// [METHOD - TEST] Prints the level on the screen.
mth_show_level_structure = function(_level_array)
{
	var _array_lenght = array_length(_level_array);
	var _print = "";
	for (var _i = 0; _i < _array_lenght; ++_i)
	{
	    if (_i mod 14 == 0){_print += STRING_LN;}
		switch (_level_array[_i])
		{
		    case OBJECT_TYPE.WALL:
		        _print += "*";
		        break;
		    case OBJECT_TYPE.MY_CAR:
		        _print += "!";
		        break;
		    case OBJECT_TYPE.OTHER_CAR:
		        _print += "o";
		        break;
		    default:
		        _print += EMPTY;
		        break;
		}
	}
	show_message(_print);
}
mth_copy_to_python = function(_level_array)
{
	var _array_lenght = array_length(_level_array);
	var _print = room_get_name(room) + " = [";
	for (var _i = 0; _i < _array_lenght; ++_i)
	{
	    if (_i mod 14 == 0){_print += STRING_LN;}
		switch (_level_array[_i])
		{
		    case OBJECT_TYPE.WALL:
		        _print += "'X'";
		        break;
		    case OBJECT_TYPE.MY_CAR:
		        _print += "'M'";
		        break;
		    case OBJECT_TYPE.OTHER_CAR:
		        _print += "'C'";
		        break;
		    default:
		        _print += "' '";
		        break;
		}
		_print += (_i != _array_lenght) ? ", " : "";
	}
	_print += "]";
	clipboard_set_text(_print);
	show_message("COPIED! : " + _print);
}


// Timer (in frames) when the generator will begin to do its work.
generator_timer = 15;
collider_i = array_length(level);