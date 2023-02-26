
if !placed{
	
	image_angle -= 90

	current_belt_direction = (current_belt_direction + 1) % array_length(belt_directions_array)
	belt_direction = belt_directions_array[current_belt_direction]
	belt_direction = belt_directions_array[current_belt_direction]
}