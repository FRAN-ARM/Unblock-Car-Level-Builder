
show_debug_message(generator_timer);

switch (--generator_timer)
{
    case 0:
		var _i = 0, _x = 24, _y = 16;
		var _array_new_element = noone;
		repeat(collider_i)
		{
			var _result = noone;
			if (_i != 0)
			{
				_x += 32;
			    if (_i mod 14 == 0)
				{
					_x = 24;
					_y += 32;
				}
			}
			with(obj_collider)
			{
				x = _x;
				y = _y;
				var _object = instance_place(x, y, obj_parent_gameplay_objects);
				if (_object != noone)
				{
					switch (_object.object_index)
					{
					    case obj_wall:
					        _array_new_element = "Wall";
					        break;
					    case obj_my_car:
					        _array_new_element = "MyCar";
					        break;
					    case obj_other_cars:
					        //_array_new_element = OBJECT_TYPE.other_car;
							if (array_contains(other.other_cars, _object))
							{
								_array_new_element = (array_get_index(other.other_cars, _object) + 1);
							}
							else
							{
								array_push(other.other_cars, _object);
								_array_new_element = (array_get_index(other.other_cars, _object) + 1);
							}
					        break;
					}
				}
				else
				{
					_array_new_element = noone;
				}
			}
			level[_i] = _array_new_element;
			_i++;
		}
		mth_show_level_structure(level);
		mth_copy_to_python(level);
        break;
    case -100:
        game_end();
        break;
}