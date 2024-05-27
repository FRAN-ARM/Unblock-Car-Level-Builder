
#macro STRING_LN "\n"
#macro EMPTY "x"
#macro OBJECT_TYPE global
OBJECT_TYPE.wall = "Wall";
OBJECT_TYPE.my_car = "MyCar";
OBJECT_TYPE.other_car = "Wall";

// The initial array is the template of an empty level, which only contains walls.
level = 
[
	noone, OBJECT_TYPE.wall, OBJECT_TYPE.wall, OBJECT_TYPE.wall, OBJECT_TYPE.wall, OBJECT_TYPE.wall, OBJECT_TYPE.wall, OBJECT_TYPE.wall, OBJECT_TYPE.wall, OBJECT_TYPE.wall, OBJECT_TYPE.wall, OBJECT_TYPE.wall, OBJECT_TYPE.wall, noone,
	OBJECT_TYPE.wall, noone, noone, noone, noone, noone, noone, noone, noone, noone, noone, noone, noone, OBJECT_TYPE.wall,
	OBJECT_TYPE.wall, noone, noone, noone, noone, noone, noone, noone, noone, noone, noone, noone, noone, OBJECT_TYPE.wall,
	OBJECT_TYPE.wall, noone, noone, noone, noone, noone, noone, noone, noone, noone, noone, noone, noone, OBJECT_TYPE.wall,
	OBJECT_TYPE.wall, noone, noone, noone, noone, noone, noone, noone, noone, noone, noone, noone, noone, noone,
	OBJECT_TYPE.wall, noone, noone, noone, noone, noone, noone, noone, noone, noone, noone, noone, noone, OBJECT_TYPE.wall,
	OBJECT_TYPE.wall, noone, noone, noone, noone, noone, noone, noone, noone, noone, noone, noone, noone, OBJECT_TYPE.wall,
	noone, OBJECT_TYPE.wall, OBJECT_TYPE.wall, OBJECT_TYPE.wall, OBJECT_TYPE.wall, OBJECT_TYPE.wall, OBJECT_TYPE.wall, OBJECT_TYPE.wall, OBJECT_TYPE.wall, OBJECT_TYPE.wall, OBJECT_TYPE.wall, OBJECT_TYPE.wall, OBJECT_TYPE.wall, noone,
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
		    case OBJECT_TYPE.wall:
		        _print += "*";
		        break;
		    case OBJECT_TYPE.my_car:
		        _print += "!";
		        break;
		    case OBJECT_TYPE.other_car:
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
		var _value = _level_array[_i];
		switch (_value)
		{
		    case "Wall":
		        _print += "'X'";
		        break;
		    case "MyCar":
		        _print += "'M'";
		        break;
		    default:
				if (is_numeric(_value) && _value > -1)
				{
					_print += "'" + string(_value) + "'";
				}
				else
				{
					_print += "' '";
				}
		        break;
		}
		_print += (_i != _array_lenght) ? ", " : "";
	}
	_print += "]";
	clipboard_set_text(_print);
	show_message("COPIED! : " + _print);
	room_goto_next();
}


// Timer (in frames) when the generator will begin to do its work.
generator_timer = 15;
collider_i = array_length(level);
other_cars = [];